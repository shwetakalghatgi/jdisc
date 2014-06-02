using System;
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

namespace site
{
    public partial class gmailPage : System.Web.UI.Page
    {
        OpenIdRelyingParty openid = new OpenIdRelyingParty();

        protected void Page_Load(object sender, EventArgs e)
        {

            OpenIDProviderResponse();

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
                        Response.Redirect("~/topicList.aspx?userEmail=" + lblemail.Text + "userName=" + lblname.Text);
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
    }
}