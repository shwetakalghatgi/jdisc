﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace site
{
    public partial class _Default : System.Web.UI.Page
    {
        public string conStr = @"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE";
        SqlConnection sql = new SqlConnection(@"data source=SAGAR\SQLEXPRESS;database=shweta;integrated security=TRUE");
        SqlCommand cmd;
        public string emailId;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("btnHome").Visible = false;
            loadUserName();
            loadTopics();
        }

        protected void loadUserName()
        {
            //emailId = (string)Request.QueryString["emailId"];
           emailId= Session["userEmailId"].ToString();
            string str = "select userName from userInfo where userEmailId='" + emailId + "'";
            sql.Open();
             cmd = new SqlCommand(str, sql);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows && dr.Read())
            {
                Session["Username"] = dr["userName"].ToString();
            }
            sql.Close();
        }
        protected void loadTopics()
        {
            SqlDataAdapter adp;
            string text = (string)Request.QueryString["subject"];
            sql.Open();
            DataSet ds = new DataSet();
            if (text == null)
            {
              
                adp = new SqlDataAdapter("select * from Topic_List where userEmailId='" + Session["userEmailId"].ToString() + "'", conStr);
              
            }
            else
            {
                 adp = new SqlDataAdapter("select * from Topic_List where userName='" + Session["userName"].ToString() + "'and subject ='" + text + "'", conStr);
            
            }
        
            adp.Fill(ds, "Topic_List");
            gridView1.DataSource = ds;

            gridView1.DataBind();
            sql.Close();
            if (gridView1.Rows.Count == 0)//.Visible == false)
            {
                gridView1.Visible = false;
                Label1.Text = "No data";
               
            }
        }


        protected void deleteTopic( object sender, GridViewDeleteEventArgs e)
        {
            sql.Open();
            HyperLink hlID = (HyperLink)gridView1.Rows[e.RowIndex].FindControl("hl");
            string str = "delete  from titleCommments where title='" + hlID.Text + "';delete  from Topic_List where title='" + hlID.Text + "'";
             cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
            loadTopics();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addNewTopic.aspx");
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubjectsPage.aspx");
        }
    }
}
