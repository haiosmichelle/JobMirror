using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MirrorJob.User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into [User] (Username,Password,Name1,Email1,Address,Mobile,Country) values (@Username,@Password,@Name1,@Email1,@Address,@Mobile,@Country)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name1", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email1", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Înregistrat cu succes!";
                    lblMsg.CssClass = " alert alert-succes";
                    clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Nu s-a putut salva chiar acum, te rog încearcă altădată..!";
                    lblMsg.CssClass = " alert alert-avertisment";
                }
            }
            catch(SqlException ex)
            {
                if(ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>"+ txtUserName.Text.Trim() + "</b> username-ul există deja, incearcă unu nou..!";
                    lblMsg.CssClass = " alert alert-avertisment";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            txtUserName.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlCountry.ClearSelection();
        }
    }
}