using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace site
{
    public partial class registration : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("treeUser").Visible = false;

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmail.Text == "" || txtName.Text == "" || txtPassword.Text == "")
                {
                    lblAlert.Text = "Required fields should be filled";
                }
                else
                {
                    sql.Open();
                    string str = "insert into userInfo values ('" + txtName.Text + "','" + txtPassword.Text + "','',null,'" + txtEmail.Text + "')";
                    SqlCommand cmd = new SqlCommand(str, sql);
                    cmd.ExecuteNonQuery();
                    sql.Close();
                }

                //string subject = "test";
                //string message = "Please click the following link to register";
                //message += "<a href = '" + Request.Url.AbsoluteUri.Replace("registration.aspx", "TopicList.aspx?emailId=" + txtEmail.Text) + "'></a>";
                //const string sender1 = "abc";
                //const string password = "xyz";

                //string recipent = "kalghatgishweta@gmail.com";
                //using (
                //MailMessage textMessage = new MailMessage(sender1, recipent, subject, message))
                //{
                //    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                //    smtpClient.UseDefaultCredentials = false;

                //    smtpClient.EnableSsl = true;
                //    smtpClient.Credentials = new NetworkCredential(sender1, password);
                //    smtpClient.Send(textMessage);
                //}
                //Response.Write("E-mail sent!");
            }
            catch (Exception ex)
            {
                //Response.Write("Could not send the e-mail - error: " + ex.Message);
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
        }
    }
}