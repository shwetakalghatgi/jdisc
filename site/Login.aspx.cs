using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetOpenAuth.OpenId;
using DotNetOpenAuth.OpenId.RelyingParty;
using DotNetOpenAuth.OpenId.Extensions.SimpleRegistration;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;
using System.Web.Security;
using System.Net;
using System.IO;
using System.Drawing;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Security.Cryptography;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.UI.WebControls.WebParts;



namespace site
{
    
    public partial class Login : System.Web.UI.Page
    {
        private const string PASSWORD = "Fr$4n@k&8f*0r^T=";
        OpenIdRelyingParty openid = new OpenIdRelyingParty();
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    HttpCookie GetSavedUser = Request.Cookies.Get("SaveUser");
            //    if (GetSavedUser != null)
            //    {
            //        cookieVal.Text = GetSavedUser["UserName"].ToString();
            //        txtUserName.Text = GetSavedUser["UserName"].ToString();
            //        txtPassword.Text = GetSavedUser["Password"].ToString();
            //        // TextBox pass = (TextBox)Login1.FindControl("Password");
            //        // pass.Attributes.Add("value", Decrypt(ConvertStringToByteArray(Request.Cookies["LCMUser"]["Password"])));
            //    }
            //}
            OpenIDProviderResponse();
            Master.FindControl("treeUser").Visible = false;    
        }

        protected void OpenIDProviderResponse()
        {
            var response = openid.GetResponse();

            if (response != null)
            {
                switch (response.Status)
                {
                    //test
                    case AuthenticationStatus.Authenticated:
                        NotLoggedIn.Visible = false;

                        btngmaillogout.Visible = true;

                        var fetchResponse = response.GetExtension<FetchResponse>();
                        Session["FetchResponse"] = fetchResponse;
                        var response2 = Session["FetchResponse"] as FetchResponse;

                        lblemail.Text = response2.GetAttributeValue(WellKnownAttributes.Contact.Email);
                        lblname.Text = GetFullname(response2.GetAttributeValue(WellKnownAttributes.Name.First), response2.GetAttributeValue(WellKnownAttributes.Name.Last));
                        Session["userEmailId"] = lblemail.Text;
                        Response.Redirect("~/TopicList.aspx");
                        break;
                    case AuthenticationStatus.Canceled:
                        lblAlertMsg.Text = "Cancelled.";
                        break;
                    case AuthenticationStatus.Failed:
                        lblAlertMsg.Text = "Login Failed.";
                        break;
                }
            }
            else
            {
                return;

            }

        }

        protected void OpenLogin_Click(object src, CommandEventArgs e)
        {
            string discoveryUri = e.CommandArgument.ToString();
            var b = new UriBuilder(Request.Url) { Query = "" };
            var req = openid.CreateRequest(discoveryUri, b.Uri, b.Uri);

            var fetchRequest = new FetchRequest();
            fetchRequest.Attributes.AddRequired(WellKnownAttributes.Contact.Email);
            fetchRequest.Attributes.AddRequired(WellKnownAttributes.Name.First);
            fetchRequest.Attributes.AddRequired(WellKnownAttributes.Name.Last);
            req.AddExtension(fetchRequest);
            req.RedirectToProvider();

        }

        private static string GetFullname(string first, string last)
        {
            var _first = first ?? "";
            var _last = last ?? "";

            if (string.IsNullOrEmpty(_first) || string.IsNullOrEmpty(_last))
                return "";

            return _first + " " + _last;
        }

        protected void btngmaillogout_click(object sender, EventArgs e)
        {
            lblemail.Text = "";
            lblname.Text = "";
            btngmaillogout.Visible = false;

        }
        protected void hideLabel()
        {
           // lblVal.Visible = true;
        }
        private static byte[] Encrypt(byte[] clearData, byte[] key, byte[] iv)
        {
            MemoryStream memStream = new MemoryStream();
            Rijndael rijAlgorithm = Rijndael.Create();
            rijAlgorithm.Key = key;
            rijAlgorithm.IV = iv;
            CryptoStream cs = new CryptoStream(memStream, rijAlgorithm.CreateEncryptor(), CryptoStreamMode.Write);
            cs.Write(clearData, 0, clearData.Length);
            cs.Close();
            byte[] encryptedData = memStream.ToArray();
            return encryptedData;
        }
        public static string Encrypt(string plainText)
        {
            byte[] byteData = System.Text.Encoding.Unicode.GetBytes(plainText);

            // PasswordDeriveBytes is for getting Key and IV.
            // Using PasswordDeriveBytes object we are first getting 32 bytes for the Key (the default
            // Rijndael key length is 256bit = 32bytes) and then 16 bytes for the IV.
            // IV should always be the block size, which is by default 16 bytes (128 bit) for Rijndael.

            PasswordDeriveBytes pdb = new PasswordDeriveBytes(PASSWORD, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            byte[] encryptedData = Encrypt(byteData, pdb.GetBytes(32), pdb.GetBytes(16));
            return Convert.ToBase64String(encryptedData);
        }
        private static byte[] Decrypt(byte[] cipherData, byte[] key, byte[] iv)
        {
            MemoryStream memStream = new MemoryStream();
            Rijndael rijAlgorithm = Rijndael.Create();
            rijAlgorithm.Key = key;
            rijAlgorithm.IV = iv;
            CryptoStream cs = new CryptoStream(memStream, rijAlgorithm.CreateDecryptor(), CryptoStreamMode.Write);
            cs.Write(cipherData, 0, cipherData.Length);
            cs.Close();
            byte[] decryptedData = memStream.ToArray();
            return decryptedData;
        }
        public static string Decrypt(string cipherText)
        {
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(PASSWORD, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            byte[] decryptedData = Decrypt(cipherBytes, pdb.GetBytes(32), pdb.GetBytes(16));
            return System.Text.Encoding.Unicode.GetString(decryptedData);
        }

        public static string Decrypt(byte[] cipherBytes)
        {
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(PASSWORD, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            byte[] decryptedData = Decrypt(cipherBytes, pdb.GetBytes(32), pdb.GetBytes(16));
            return System.Text.Encoding.Unicode.GetString(decryptedData);
        }

        public static byte[] ConvertStringToByteArray(string cipherText)
        {
            return Convert.FromBase64String(cipherText);
        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            
            if (txtUserName.Text == "" || txtPassword.Text == "")
            {
                lblAlert.Text = "Please fill the required fields";
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
               
               string str = "select * from userInfo where userEmailId='" + txtUserName.Text + "' and userPassword='" + txtPassword.Text + "'";
               // string str = "select * from userInfo where userName='" + txtUserName.Text + "' and userPassword='" + txtPassword.Text + "'";
                sql.Open();
                SqlCommand cmd = new SqlCommand(str, sql);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows && dr.Read())
                {
                    
                    if (dr["userPassword"].ToString() == txtPassword.Text)
                    {
                        if(RememberMe.Checked==true)
                        {
                            HttpCookie SaveUser = new HttpCookie("SaveUser");
                            SaveUser.Values.Add("UserName",txtUserName.Text);
                            SaveUser.Values.Add("Password",txtPassword.Text);
                            SaveUser.Expires = DateTime.Now.AddMonths(8);
                            HttpContext.Current.Response.AppendCookie(SaveUser);
                        }
                        Session["userEmailId"] = dr["userEmailId"].ToString();
                        Response.Redirect("TopicList.aspx");
                    }
                    else
                    {
                    }
                   
                }
                else
                {
                    lblAlert.Text = "";
                    lblAlert.Text = "Invalid username and password";
                    txtUserName.Text = "";
                    txtPassword.Text = "";

                        
                }
                sql.Close();

            }
        }

       [WebMethod()]

       protected void btnSignUp_Click(object sender, EventArgs e)
       {
           Response.Redirect("registration.aspx");
       }
       
    }
}