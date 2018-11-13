using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NestedGridviews
{
    public partial class NestedGridView102 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SqlDataSource src = (SqlDataSource)e.Row.FindControl("sdsOrder");
                src.SelectParameters[0].DefaultValue = e.Row.Cells[1].Text;
            }
        }
    }
}