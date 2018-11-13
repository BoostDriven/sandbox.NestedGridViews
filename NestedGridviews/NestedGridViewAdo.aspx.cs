using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace NestedGridviews
{
    public partial class NestedGridViewAdo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvCustomers.DataSource = GetData("select top 10 * from Customers");
                gvCustomers.DataBind();
            }
           
        }

        private static DataTable GetData(string query)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["northwind"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string customerId = gvCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
                gvOrders.ToolTip = customerId;
                gvOrders.DataSource = GetData(string.Format("select * from Orders where customer_id='{0}'", customerId));
                gvOrders.DataBind();

                //Expand the Child grid
                //ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandCollapse('div" + ((DataRowView)e.Row.DataItem)["id"].ToString() + "', 'one');</script>");
            }
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomers.PageIndex = e.NewPageIndex;
            gvCustomers.DataSource = GetData("select top 10 * from Customers");
            gvCustomers.DataBind();
        }

        protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvOrders = sender as GridView;
            gvOrders.PageIndex = e.NewPageIndex;
            gvOrders.DataSource = GetData(string.Format("select * from Orders where customer_id={0}", gvOrders.ToolTip));
            gvOrders.DataBind();
        }

     
    }
}