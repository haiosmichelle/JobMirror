using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.IO;
using System.Text.RegularExpressions;
using MirrorJob.User;

namespace MirrorJob.Admin
{
    public partial class NewJob : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd,cmd2;
        SqlDataReader rd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("../User/Login.aspx");
            //}
            Session["title"] = "Adaugare Job";
            if (!IsPostBack)
            {
               fillData();
            }
        }

        private void fillData()
        {
            if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from Jobs where JobId= '" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtJobTitle.Text = sdr["Title"].ToString();
                        txtNoOfPost.Text = sdr["NoOfPost"].ToString();
                        txtDes.Text = sdr["Description"].ToString();
                        txtQual.Text = sdr["Qualification"].ToString();
                        txtEx.Text = sdr["Experience"].ToString();
                        txtSpe.Text = sdr["Specialization"].ToString();
                        txtLast.Text = Convert.ToDateTime(sdr["LastDate"]).ToString("yyyy-MM-dd");
                        txtSal.Text = sdr["Salary"].ToString();
                        ddlJobType.SelectedValue = sdr["JobType"].ToString();
                        txtCom.Text = sdr["CompanyName"].ToString();
                        txtWeb.Text = sdr["Web"].ToString();
                        txtEmail.Text = sdr["Email3"].ToString();
                        txtAdress.Text = sdr["Adress"].ToString();
                        ddlCountry.SelectedValue = sdr["Country"].ToString();
                        ddlJobtip.SelectedValue = sdr["Job"].ToString();
                        btnAddJob.Text = "Update";
                        linkBack.Visible = true;
                        Session["title"] = "Editare Job";

                    }
                }
                else
                {
                    lblMsg.Text = "Jobul nu a fost gasit!";
                    lblMsg.CssClass = "alert alert-danger";

                }
                sdr.Close();
                con.Close();
            }
        }

        protected void btnAddJob_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);
                if (Request.QueryString["id"] != null)
                {
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            concatQuery = ",ComanyImage= @CompanyImage";
                        }
                        else
                        {
                            concatQuery = string.Empty;
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                    query = "Update Jobs set Title=@Title,NoOfPost=@NoOfPost,Description=@Description,Qualification=@Qualification,Experience=@Experience,Specialization=@Specialization,LastDate=@LastDate,Salary=@Salary,JobType=@JobType," +
                       "CompanyName=@CompanyName" + concatQuery + @",Web=@Web,Email3=@Email3,Adress=@Adress,Country=@Country,Job=@Job where JobId=@id";

                    type = "S-a updatat";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfPost", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDes.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQual.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtEx.Text.Trim());
                    cmd.Parameters.AddWithValue("@Specialization", txtSpe.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDate", txtLast.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSal.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCom.Text.Trim());
                    cmd.Parameters.AddWithValue("@Web", txtWeb.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email3", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Adress", txtAdress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@Job", ddlJobtip.SelectedValue);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
             
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);


                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExecute = true;

                        }
                        else
                        {
                            lblMsg.Text = "Te rog selecteaza .jpg, .jpeg, .png pentru Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValidToExecute = true;
                    }
                }
                else
                {
            
                    query = "Insert into Jobs values(@Title,@NoOfPost,@Description,@Qualification,@Experience,@Specialization,@LastDate,@Salary,@JobType," +
                        "@CompanyName,@CompanyImage,@Web,@Email3,@Adress,@Country,@CreateDate,@Job)";
                    type = "S-a salvat";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtJobTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@NoOfPost", txtNoOfPost.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDes.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQual.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtEx.Text.Trim());
                    cmd.Parameters.AddWithValue("@Specialization", txtSpe.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDate", DateTime.Parse(txtLast.Text.Trim()).ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@Salary", txtSal.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCom.Text.Trim());
                     
                    cmd.Parameters.AddWithValue("@Web", txtWeb.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email3", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Adress", txtAdress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@Job",ddlJobtip.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));

                    string query2 = "SELECT [User].Email1 from [User] where Tip_Job=@Job";
                    cmd2 = new SqlCommand(query2, con);
                    cmd2.Parameters.AddWithValue("@Job", ddlJobtip.SelectedValue);
                    con.Open();
                    rd = cmd2.ExecuteReader();
                    while (rd.Read())
                    {
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
                            Body = "<h3>A aparut un nou job din categoria aleasa de dumneavoastra.</h3><a href='http://localhost:50401/User/Jobs.aspx'>Apasa aici pentru a vizualiza</a>",
                            IsBodyHtml = true,
                        };
                        mailMessage.To.Add(rd["Email1"].ToString());

                        smtpClient.Send(mailMessage);


                    }
                    con.Close();
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);


                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExecute = true;

                            string outp = cmd.CommandText;
                            foreach (SqlParameter p in cmd.Parameters)
                            {
                                outp = outp.Replace(p.ParameterName, "'" + p.Value.ToString() + "'");
                            }

                            File.WriteAllText("C:\\Users\\haios\\source\\repos\\MirrorJob\\MirrorJob\\bin\\file.txt", outp);
                        }
                        else
                        {
                            lblMsg.Text = "Te rog selecteaza .jpg, .jpeg, .png pentru Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExecute = true;
                    }

                }
                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = type + " cu succes Jobul!!";
                        lblMsg.CssClass = "alert alert-success";
                        Clear();
                    }
                    else
                    {
                        lblMsg.Text = "Nu " + type + " inregistrarea, te rog incearca mai tarziu!!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
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

        private void Clear()
        {
            txtJobTitle.Text = string.Empty;
            txtNoOfPost.Text = string.Empty;
            txtDes.Text = string.Empty;
            txtQual.Text = string.Empty;
            txtEx.Text = string.Empty;
            txtSpe.Text = string.Empty;
            txtLast.Text = string.Empty;
            txtSal.Text = string.Empty;
            txtCom.Text = string.Empty;
            txtWeb.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAdress.Text = string.Empty;
            ddlJobType.ClearSelection();
            ddlCountry.ClearSelection();
            ddlJobtip.ClearSelection();

        }

        //    private bool IsValidExtension(string fileName)
        //    {
        //        bool isValid = false;
        //        string[] fileExtension = { ".jpg", ".png", ".jpeg" };
        //        for (int I= 0; I <= fileExtension.Length-1; I++)
        //        {
        //            if (fileName.Contains(fileExtension[I]))
        //            {
        //                isValid = true;
        //                break;
        //            }
        //        }
        //        return isValid;
        //    }
        //}
    }
}