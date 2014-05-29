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
    public partial class allTopicsOfSubject : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");

        protected void Page_Load(object sender, EventArgs e)
        {
            loadTopics();

        }

        protected void loadTopics()
        {
            sql.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adp = new SqlDataAdapter("select * from Topic_List", conStr);
            adp.Fill(ds, "Topic_List");
            gritviewAllTopicSub.DataSource = ds;
            gritviewAllTopicSub.DataBind();
            sql.Close();
        }
    }
}