using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

namespace NestedGridviews
{
    public partial class EditNestedGridView : System.Web.UI.Page
    {
        #region Variables

        string gvUniqueID = String.Empty;
        int gvNewPageIndex = 0;
        int gvEditIndex = -1;
        string gvSortExpr = String.Empty;

        private string gvSortDir
        {
            get { return ViewState["SortDirection"] as string ?? "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        #endregion

        #region Private Members

        private string GetSortDirection()
        {
            switch (gvSortDir)
            {
                case "ASC":
                    gvSortDir = "DESC";
                    break;
                case "DESC":
                    gvSortDir = "ASC";
                    break;
            }
            return gvSortDir;
        }

        private SqlDataSource ChildDataSource(string strCustomerId, string strSort)
        {
            string query = "";
            SqlDataSource dsTemp = new SqlDataSource();
            query = "SELECT [Orders].[customer_id],[Orders].[id]," +
                                    "[Orders].[ship_address1],[Orders].[shipping_fee],[Orders].[ship_name] " +
                                    "FROM [Orders]" +
                                    " WHERE [Orders].[customer_id] = '" + strCustomerId + "'" +
                                    "UNION ALL " +
                                    "SELECT '" + strCustomerId + "','','','','' FROM [Orders] WHERE [Orders].[customer_id] = '" + strCustomerId + "'" +
                                    "HAVING COUNT(*)=0 " + strSort;
            dsTemp.SelectCommand = query;
            dsTemp.ConnectionString = ConfigurationManager.ConnectionStrings["Northwind"].ConnectionString;
            return dsTemp;
        }

        #endregion

        #region Parent GridView Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvMaster_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = e.Row;
            string strSort = string.Empty;

            // Make sure we aren't in header/footer rows
            if (row.DataItem == null)
                return;

            // Find Child GridView control
            GridView gv = new GridView();
            gv = (GridView)row.FindControl("gvDetails");

            // Check if any additional conditions (Paging, Sorting, Editing, etc) to be applied on child GridView
            if (gv.UniqueID == gvUniqueID)
            {
                gv.PageIndex = gvNewPageIndex;
                gv.EditIndex = gvEditIndex;

                // Check if Sorting used
                if (gvSortExpr != string.Empty)
                {
                    GetSortDirection();
                    strSort = " ORDER BY " + string.Format("{0}{1}", gvSortExpr, gvSortDir);
                }

                // Expand the Child grid
                ClientScript.RegisterStartupScript(GetType(), "Expand", "<SCRIPT LANGUAGE='javascript'>expandcollapse('div" + ((DataRowView)e.Row.DataItem)["id"].ToString() + "', 'one');</script>");
            }

            // Prepare the query for Child GridView by passing the Customer ID of the parent row
            gv.DataSource = ChildDataSource(((DataRowView)e.Row.DataItem)["id"].ToString(), strSort);
            gv.DataBind();

            // Add delete confirmation message for Customer
            LinkButton l = (LinkButton)e.Row.FindControl("linkDeleteCust");
            l.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this Customer " + DataBinder.Eval(e.Row.DataItem, "id") + "')");
        }

        protected void gvMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvMaster_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void gvMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvMaster_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        #endregion
    }
}