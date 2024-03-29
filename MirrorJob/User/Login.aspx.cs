﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sq;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string username, password= string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                username = ConfigurationManager.AppSettings["username"];
                password = ConfigurationManager.AppSettings["password"];
                if (txtUserName.Text.Trim() == "admin" && txtPassword.Text.Trim() == "1234")
                {
                   
                        Response.Redirect("../Admin/Dashboard.aspx");
                }
                else
                {
                    con = new SqlConnection(str);
                    string query = @"Select * from [User] where Username=@Username and Password=@Password";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    con.Open();
                    sq = cmd.ExecuteReader();
                    if(sq.Read())
                    {
                        Session["user"] = sq["Username"].ToString();
                        Session["userId"] = sq["UserId"].ToString();
                        Response.Redirect("WebForm1.aspx", false);
                    }
                    else
                    {
                        showErrorMsg("User");
                    }
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }

        private void showErrorMsg(string userType)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "<b>" + userType + "</b> acreditările sunt incorecte..!";
            lblMsg.CssClass = " alert alert-avertisment";
        }
    }
}