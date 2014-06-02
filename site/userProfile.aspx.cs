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
    public partial class userProfile : System.Web.UI.Page
    {
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        SqlCommand cmd;
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            string text = (string)Request.QueryString["userName"];
             cmd = new SqlCommand("select * from userInfo where userName=@text ", sql);
            sql.Open();
            cmd.Parameters.AddWithValue("@text", text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows && dr.Read())
            {

                txtUserName.Text = dr["userName"].ToString();
                txtQuali.Text = dr["userQualification"].ToString();
                id = dr["userID"].ToString();
                //tNum.Text = dr["num"].ToString();
                ////   fileUpload.
                //Image1.ImageUrl = "Handler.ashx?num=" + dd.Text;
                // fileUpload.ImageUrl = "Handler.ashx?EmpID=32";// +TextBox3.Text;
            }
            else
            {
                Response.Write("Record With This ID Note Found");
            }
            sql.Close();
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            

            int img = fuImportImage.PostedFile.ContentLength;

            byte[] msdata = new byte[img];
            if (msdata.Length != 0)
            {
                fuImportImage.PostedFile.InputStream.Read(msdata, 0, img);
                cmd = new SqlCommand("update userInfo set userImage= @image where userID=@id", sql);
                cmd.Parameters.AddWithValue("@image", msdata);
                cmd.Parameters.AddWithValue("@id", id);

            }
            else
            {
               // cmd = new SqlCommand("update emp1 set namee=@namee1,address = @address where num=@num ", con);
            }
            sql.Open();

            //cmd.Parameters.AddWithValue("@namee1", tName.Text);
            //cmd.Parameters.AddWithValue("@address", tAddress.Text);
            //cmd.Parameters.AddWithValue("@num", tNum.Text);
            cmd.ExecuteNonQuery();
            sql.Close();
            
        }
    }
}