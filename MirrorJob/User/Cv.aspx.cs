using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.User
{
    public partial class Cv : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                { showUserInfo(); }
         
            }
            //else
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }

        private void showUserInfo()
        {
           try
            { con = new SqlConnection(str);
            string query = "Select * from [User] where UserId=@userId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@userId", Request.QueryString["id"]);
            con.Open();
            sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
                    txtName.Text = sdr["Name1"].ToString();
                    txtEmail.Text = sdr["Email1"].ToString();
                    txtMobile.Text = sdr["Mobile"].ToString();
                    txtTenth.Text = sdr["TenthGrade"].ToString();
                    txtGraduation.Text = sdr["GraduationGrade"].ToString();
                    txtPHD.Text = sdr["Phd"].ToString();
                    txtWork.Text = sdr["WorksOn"].ToString();
                    txtExperience.Text = sdr["Experience"].ToString();
                    txtAddress.Text = sdr["Address"].ToString();
                    ddlCountry.SelectedValue = sdr["Country"].ToString();
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Userul nu a fost gasit!";
                lblMsg.CssClass = "alert alert-danger";
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"]!=null)
                {
                    string concatQuery=string.Empty, filePath = string.Empty;
                    bool isValidToExecute=false, isValid = false;
                    con = new SqlConnection(str);
                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidResume(fuResume.FileName))
                        {
                            concatQuery = "Resume=@resume,";
                            isValid = true;
                        }
                        else
                        {
                            concatQuery = string.Empty;
                            lblMsg.Visible = true;
                            lblMsg.Text = "Te rog selecteza .doc, .docx, .pdf file pentru CV!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                       
                        query = @"Update [User] set Name1=@Name1,Email1=@Email1,Mobile=@Mobile,TenthGrade=@TenthGrade,GraduationGrade=@GraduationGrade,Phd=@Phd,
                                 WorksOn=@WorksOn,Experience=@Experience,"+concatQuery+"Address=@Address,Country=@Country where UserId=@UserId";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Name1", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email1", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@TenthGrade", txtTenth.Text.Trim());
                        cmd.Parameters.AddWithValue("@GraduationGrade", txtGraduation.Text.Trim());
                        cmd.Parameters.AddWithValue("@Phd", txtPHD.Text.Trim());
                        cmd.Parameters.AddWithValue("@WorksOn", txtWork.Text.Trim());
                        cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                        cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidResume(fuResume.FileName))
                        { Guid obj = Guid.NewGuid();
                            filePath = "Resumes/" + obj.ToString() + fuResume.FileName;
                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resumes/") + obj.ToString() + fuResume.FileName);

                            cmd.Parameters.AddWithValue("@resume", filePath);
                            isValid = true;
                        }
                        else
                        {
                            concatQuery = string.Empty;
                            lblMsg.Visible = true;
                            lblMsg.Text = "Te rog selecteza .doc, .docx, .pdf file pentru CV!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValid = true;

                    }
                        if(isValid)
                        {
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if(r>0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Detaliile CV-ului au fost updatate cu succesc!";
                            lblMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Nu se pot updata inregistrarile, te rog incearca din nou!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                        }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Nu se pot updata inregistrarile, te rog incearca din nou!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(SqlException ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}