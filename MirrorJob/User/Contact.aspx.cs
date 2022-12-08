using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.User
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into Contact values (@Name,@Email,@Subject,@Message)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if(r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Mulțumim pentru trimitere, o sa ne uităm la intrebările dumneavoastră!";
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
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            name.Value = string.Empty;
            email.Value = string.Empty;
            subject.Value = string.Empty;
            message.Value = string.Empty;
        }
    }
}