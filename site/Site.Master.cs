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
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Username"] != null)
            {
                lblUserName.Text = "WelCome:  " + Session["Username"].ToString();
                lblDate.Text = DateTime.Now.ToString();
                treeUser.Visible = true;
                btnLogout.Visible = true;
                btnHome.Visible = true;
            }
            else if (Request.QueryString["emailId"] != null)
            {
                string emailId = (string)Request.QueryString["emailId"];
                string str = "select userName from userInfo where userEmailId=" + emailId;
                sql.Open();
                SqlCommand cmd = new SqlCommand(str, sql);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["Username"] = dr["userName"].ToString();
                }


            }
            else
            {
                //btnLogout.Visible = false;
                //btnHome.Visible = false;
            }

        }

        protected void testlog(object sender,EventArgs e)
        {
            Response.Redirect("TopicList.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TopicList.aspx");
        }

        protected void btnUserProf_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(String.Format("userProfile.aspx?userName={0}",  Session["Username"].ToString()));

        }

        
        
        
    }
}
