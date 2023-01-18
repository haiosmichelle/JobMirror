using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
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
                var email_to = "";
                var email_from = "";
                var parola = "";
                con = new SqlConnection(str);
                string query = @"Insert into [User] (Username,Password,Name1,Email1,Address,Mobile,Country,Tip_Job) values (@Username,@Password,@Name1,@Email1,@Address,@Mobile,@Country,@Tip_Job)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtConfirmPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Name1", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email1", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                cmd.Parameters.AddWithValue("@Tip_Job", ddlJob.SelectedValue);
                con.Open();
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential("michelle.haiosta02@e-uvt.ro", "haklvydxyywdjokp"),
                    EnableSsl = true,
                };
                var mailMessage = new MailMessage
                {
                    From = new MailAddress("michelle.haiosta02@e-uvt.ro"),
                    Subject = "subject",
                    Body = "<a href=\"http://localhost:50401/User/Login.aspx\"><button ID=\"btnValidare\" OnClick=\"btnValidare_Click\">Apasa aici sa iti confirmi email-ul</button></a>",
                    IsBodyHtml = true,
                };
                mailMessage.To.Add(txtEmail.Text.Trim());

                smtpClient.Send(mailMessage);
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Intra pe Email pentru a valida inregistrarea!";
                    lblMsg.CssClass = " alert alert-success";
                    clear();
                }

            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> username-ul există deja, incearcă unu nou..!";
                    lblMsg.CssClass = " alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            catch (Exception ex)
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
            ddlJob.ClearSelection();
        }
    }
}