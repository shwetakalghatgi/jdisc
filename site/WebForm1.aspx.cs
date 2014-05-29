using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace site
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        [WebMethod()]
        public static void btnSignUp_Click(string imageData)
        {
            byte[] data = Convert.FromBase64String(imageData);

            // string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
            SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");

            SqlCommand cmd;


            cmd = new SqlCommand("insert into emp1 (images,num) values (@image,4)", sql);
            sql.Open();
            cmd.Parameters.AddWithValue("@image", data);

            cmd.ExecuteNonQuery();
            sql.Close();

        }
    }
}