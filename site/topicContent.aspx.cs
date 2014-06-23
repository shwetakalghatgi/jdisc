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
    public partial class test : System.Web.UI.Page
    {
         public SolidBrush brush;
         public Graphics graphic;
         public bool isDrawing = false;
         public string topicTitle;
         public string imageUrl;
         public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
         SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            topicTitle = (string)Request.QueryString["topicTitle"];
            loadTopicContent();
            loadTopicComments();

        }

        [WebMethod()]
        public static void btnSignUp_Click(string imageData, string title)
        {
            SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
            SqlCommand cmd;
            cmd = new SqlCommand("insert into titleCommments (titleImage,title) values (@titleImage,@title)", sql);
            sql.Open();
            cmd.Parameters.AddWithValue("@titleImage", imageData);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.ExecuteNonQuery();
            sql.Close();
        }

        protected void loadTopicComments()
        {
             string str = "select titleImage from titleCommments where title = '" + topicTitle + "'";
             sql.Open();
             SqlCommand cmd = new SqlCommand(str,sql);             
             SqlDataReader dr = cmd.ExecuteReader();
             DataTable dt = new DataTable();
             dt.Load(dr);
            int rowsCount =  dt.Rows.Count;
            foreach (DataRow row in dt.Rows)
            {
                imageUrl = imageUrl + row["titleImage"].ToString();
            }
             sql.Close();
             divId.InnerHtml = imageUrl;
            
        }
        protected void mouseDown()
        {
            Response.Write("oo");
        }
        protected void saveComments(object sender, EventArgs e)
        { 

            sql.Open();
            string str = "insert into titleCommments values ('" + txtTitle.Text + "','" + txtComm.Text + "')";
            SqlCommand cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            loadTopicComments();
        }
         public void loadTopicContent()
         {
             string str = "select * from Topic_List where title = " + "'" + topicTitle + "'";
             sql.Open();
             SqlCommand cmd = new SqlCommand(str,sql);
             
             SqlDataReader dr = cmd.ExecuteReader();
             if(dr.Read())
             {
                 
                 txtTitle.Text = dr["title"].ToString();
                 txtAuthor.Text = dr["author"].ToString();
                
             }
             sql.Close();
         }

        

         protected void btnEqn_Click(object sender, EventArgs e)
         {
             Response.Redirect("ImageDrawPopUp.aspx");
         }

       
    }
}