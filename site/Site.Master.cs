using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace site
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblUserName.Text = "WelCome:  " + Session["Username"].ToString();
                lblDate.Text = DateTime.Now.ToString();

            }
            else
            {
               // btnlogout.Visible = false;
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("topicList.aspx");
        }

        protected void btnUserProf_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(String.Format("userProfile.aspx?userName={0}",  Session["Username"].ToString()));

        }

        
        
        
    }
}
