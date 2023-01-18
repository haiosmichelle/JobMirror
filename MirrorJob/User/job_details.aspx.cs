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
    public partial class job_details : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt,dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        //public int jobCount = 0;
        public string jobTitle = string.Empty;
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showJobDetails();
                DataBind();
            }
            else
            {
                Response.Redirect("Jobs.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            showJobDetails();
           
        }

        private void showJobDetails()
        {
            
                con = new SqlConnection(str);
                string query =@"Select * from Jobs where JobId=@id";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
            jobTitle = dt.Rows[0]["Title"].ToString();
        }
        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_Imag.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);

        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "ApplyJob")
            {
                if (Session["user"] !=null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedJobs values( @JobId, @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if(r>0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Ai aplicat cu succes!";
                            lblMsg.CssClass = "alert alert-success";
                            showJobDetails();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Nu ai putut sa aplici !";
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
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

       
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"]!=null)
            {
                LinkButton btnApplyJob = e.Item.FindControl("btnApply") as LinkButton;
                if(isAplied())
                {
                    btnApplyJob.Enabled = false;
                    btnApplyJob.Text = "Aplicat";
                }
                else
                {
                    btnApplyJob.Enabled = true;
                    btnApplyJob.Text = "Aplica acum";
                }
            }
        }
        bool isAplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedJobs where UserId=@UserId and JobId=@JobId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if (dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}