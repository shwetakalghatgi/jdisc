using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace site
{
    public partial class addNewTopic : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_Click(object sender, EventArgs e)
        {
            if (txtTitleAuthor.Text == null || txtSubject.Text == null || txtTitleName.Text == null)
            {
                lblAlert.Text = "Required fields need to be filled";
            }
            else
            {
                SqlCommand cmd;
                int fileLength = fileUpload.PostedFile.ContentLength;
                byte[] fileData = new byte[fileLength];

                fileUpload.PostedFile.InputStream.Read(fileData, 0, fileLength);

                if (fileData.Length != 0)
                {

                    cmd = new SqlCommand("insert into Topic_List values (@title,@author,@subject,@userName,@userEmailId,@fileData)", sql);
                    cmd.Parameters.AddWithValue("@fileData", fileData);
                }
                else
                {
                    cmd = new SqlCommand("insert into Topic_List (title,author,subject,userName,userEmailId) values (@title,@author,@subject,@userName,@userEmailId)", sql);

                }

                sql.Open();
                cmd.Parameters.AddWithValue("@title", txtTitleName.Text);
                cmd.Parameters.AddWithValue("@author", txtTitleAuthor.Text);
                cmd.Parameters.AddWithValue("@subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@userName", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@userEmailId", Session["userEmailId"].ToString());

                // string str = "insert into Topic_List values ('" + txtTitleName.Text + "','" + txtTitleAuthor.Text + " ','','" + txtSubject.Text + "','','" + Session["userEmailId"].ToString() + "')";


                cmd.ExecuteNonQuery();
                sql.Close();
                Response.Redirect("TopicList.aspx");
            }
        }
    }
}