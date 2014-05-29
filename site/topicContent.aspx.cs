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
         
         public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
         SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
         public string text;
        protected void Page_Load(object sender, EventArgs e)
        {   
              
            text = (string)Request.QueryString["title"];
            loadTopicContent();
            loadTopicComments();
           // string text = (string)Request.QueryString["title"];

        }
        
        public static void btnSignUp_Click(string n)
        {
            //var image = document.getElementById("imageView").toDataURL("image/png");
            //      alert(image);
            //      image = image.replace('data:image/png;base64,', '');

            // string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
            SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");

            SqlCommand cmd;


            cmd = new SqlCommand("insert into emp1  (num) values (001)", sql);
            sql.Open();
            // cmd.Parameters.AddWithValue("@num", num);

            cmd.ExecuteNonQuery();
            sql.Close();

        }

        protected void loadTopicComments()
        {
            // PAINT CODE
        
            //END OF PAINT CODE
            sql.Open();
            DataSet ds = new DataSet();

            SqlDataAdapter adp = new SqlDataAdapter("select titleComm from titleCommments where title = '" +text+ "'", conStr);
            adp.Fill(ds, "titleCommments");
            gridView2.DataSource = ds;
            gridView2.DataBind();
            sql.Close();
        }
        protected void mouseDown()
        {
            Response.Write("oo");
        }
        protected void saveComments(object sender, EventArgs e)
        {
            
            sql.Open();
           // string str = "insert into titleCommments set titleComm= '" + txtComm.Text + "' where title = '" + txtTitle.Text + "' ";
            string str = "insert into titleCommments values ('" + txtTitle.Text + "','" + txtComm.Text + "')";
            SqlCommand cmd = new SqlCommand(str,sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            loadTopicComments();
        }
         public void loadTopicContent()
         {
             
             
             string str = "select * from Topic_List where title = " + "'" + text + "'";
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

         protected void brnDraw_Click(object sender, EventArgs e)
         {
             Response.Redirect("WebForm1.aspx");
         }

         protected void btnEqn_Click(object sender, EventArgs e)
         {
             Response.Redirect("WebForm2.aspx");
         }

       
    }
}