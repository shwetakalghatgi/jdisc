using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace site
{
    public partial class test1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
           
        }
        [WebMethod()]
        public static void UploadImage(string imageData)
        {
            
            byte[] data = Convert.FromBase64String(imageData);
            //sql.Open();
            ////string fileNameWitPath = path + DateTime.Now.ToString().Replace("/", "-").Replace(" ", "- ").Replace(":", "") + ".png";
            //SqlCommand cmd;


            //       // string str1 = "insert into emp1 values (images) (@image)";
            //        cmd = new SqlCommand("insert into emp1 values (images) (@image)", sql);
            //        cmd.Parameters.AddWithValue("@image", data);

            //        cmd.ExecuteNonQuery();
            //        sql.Close();

        }
        
    }
}