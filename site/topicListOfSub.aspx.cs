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
    public partial class topicListOfSub : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
            loadtopic();

        }

        protected void loadtopic()
        {
            string text = Request.QueryString["subject"];
            sql.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adp = new SqlDataAdapter("select title from Topic_List where subject='" + text+"'", conStr);
            adp.Fill(ds, "Topic_List");
          listTopicOfSub.DataSource = ds;
          listTopicOfSub.DataBind();
            sql.Close();
        }
    }
}