using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace site
{
    public partial class SubjectsPage : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSubjects();
        }

        protected void loadSubjects()
        {
            sql.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adp = new SqlDataAdapter("select distinct subject from Topic_List where userName='"+ Session["Username"].ToString() +"'", conStr);
            adp.Fill(ds, "Topic_List");
            gridviewSub.DataSource = ds;
            gridviewSub.DataBind();
            sql.Close();
            if (gridviewSub.Rows.Count == 0)//.Visible == false)
            {
                gridviewSub.Visible = false;
              //  lblSubList.Text = "";
                lblSubList.Text = "No data";
                //oooo
            }
        }
    }
}