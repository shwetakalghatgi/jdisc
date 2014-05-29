using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Services;

namespace site
{
    
    public partial class Login : System.Web.UI.Page
    {
        
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
      public   SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void hideLabel()
        {
           // lblVal.Visible = true;
        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            //delete code
                     
            //
            if (  txtUserName.Text    == "" || txtPassword.Text == "")
            {
                if (txtUserName.Text == "")
                {
                   // lblValUserName.Visible = true;
                  
                }
                if (txtPassword.Text == "")
                {
                   // lblValPassword.Visible = true;
                 
                }
            }
            else
            {
                string str = "select * from loginInfo where userName='" + txtUserName.Text + "' and userPassword='" + txtPassword.Text + "'";
                sql.Open();
                SqlCommand cmd = new SqlCommand(str, sql);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["Username"] = txtUserName.Text;
                    Response.Redirect("topicList.aspx");
                }
                else
                {
                    //lblVal.Visible = true;
                    txtUserName.Text = "";
                }
                sql.Close();

            }
        }

       [WebMethod()]
//[System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = true)]
        public static void btnSignUp_Click(string n)
        {
             //var image = document.getElementById("imageView").toDataURL("image/png");
             //      alert(image);
             //      image = image.replace('data:image/png;base64,', '');
            
             // string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
              SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
               
            SqlCommand cmd;
            
             
            cmd = new SqlCommand("insert into emp1  (num) values (53)", sql);
            sql.Open();
            // cmd.Parameters.AddWithValue("@num", num);

             cmd.ExecuteNonQuery();
             sql.Close();

        }

       protected void btnSignUp_Click(object sender, EventArgs e)
       {
           Response.Redirect("registration.aspx");
       }
       
    }
}