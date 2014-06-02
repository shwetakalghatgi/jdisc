using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace site
{
    public partial class _Default : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        public string emailId;
        protected void Page_Load(object sender, EventArgs e)
        {
            
             emailId = (string)Request.QueryString["userEmail"];
            Master.FindControl("btnUserProf").Visible = true;
            loadTopics();
        }

        protected void loadTopics()
        {
            SqlDataAdapter adp;
            string text = (string)Request.QueryString["subject"];
            sql.Open();
            DataSet ds = new DataSet();
            if (text == null)
            {
                if (emailId != null)
                {
                    adp = new SqlDataAdapter("select * from Topic_List where userEmailId='" + emailId + "'", conStr);
                }
                else
                {
                 adp = new SqlDataAdapter("select * from Topic_List where userName='" + Session["Username"].ToString() +"'", conStr);
                }
            }
            else
            {
                 adp = new SqlDataAdapter("select * from Topic_List where userName='" + Session["userName"].ToString() + "'and subject ='" + text + "'", conStr);
            
            }
           // SqlDataAdapter adp = new SqlDataAdapter("select * from Topic_List where userName='" + Session["userName"].ToString() + "'and subject ='" + text + "'", conStr);
            //SqlDataAdapter adp = new SqlDataAdapter("select * from Topic_List where  subject ='" + text + "'", conStr);
            adp.Fill(ds, "Topic_List");
            gridView1.DataSource = ds;

            gridView1.DataBind();
            sql.Close();
            if (gridView1.Rows.Count == 0)//.Visible == false)
            {
                gridView1.Visible = false;
                Label1.Text = "No data";
                //oooo
            }
        }


        protected void deleteTopic( object sender, GridViewDeleteEventArgs e)
        {
            sql.Open();
            HyperLink hlID = (HyperLink)gridView1.Rows[e.RowIndex].FindControl("hl");
            string str = "delete  from titleCommments where title='" + hlID.Text + "';delete  from Topic_List where title='" + hlID.Text + "'";
            SqlCommand cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            loadTopics();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addNewTopic.aspx");
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            Response.Redirect("subjectsPage.aspx");
        }
    }
}
