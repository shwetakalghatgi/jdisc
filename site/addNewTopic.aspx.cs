using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace site
{
    public partial class addNewTopic : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_Click(object sender, EventArgs e)
        {
            sql.Open();
            string str = "insert into Topic_List values ('" + txtTitleName.Text + "','" + txtTitleAuthor.Text + " ','','" + txtSubject.Text + "','"+ Session["userName"].ToString() +"')";
            SqlCommand cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            Response.Redirect("topicList.aspx");
        }
    }
}