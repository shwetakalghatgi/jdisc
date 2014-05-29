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

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            sql.Open();
            string str = "insert into loginInfo values ('" + txtName.Text + "','" + txtPassword.Text + " ')";
            SqlCommand cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            Response.Redirect("Login.aspx");
        }

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                //MailMessage mailMessage = new MailMessage();
                //mailMessage.To.Add("kalghatgishweta@gmail.com");
                //mailMessage.From = new MailAddress("kalghatgishweta@gmail.com");
                string subject = "test";
                string message = "Please click the following link to register";
              //  message += "Please click the following link to activate your account";
                message += "<a href = '" + Request.Url.AbsoluteUri.Replace("registration.aspx", "Login.aspx?ActivationCode=3") + "'></a>";
                //message += "Thanks";

                
                const string sender1 = "kalghatgishweta@gmail.com";
                const string password = "vanashankaree";

                string recipent = "kalghatgishweta@gmail.com";
                using (
                MailMessage textMessage = new MailMessage(sender1, recipent, subject, message))
                {
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.UseDefaultCredentials = false;

                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new NetworkCredential(sender1, password);
                    smtpClient.Send(textMessage);
                }
                Response.Write("E-mail sent!");
            }
            catch (Exception ex)
            {
                Response.Write("Could not send the e-mail - error: " + ex.Message);
            }
        }
    }
}