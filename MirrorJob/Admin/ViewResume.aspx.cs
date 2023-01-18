using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.Admin
{
    public partial class ViewResume : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        //public int jobCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowAppliedJob();
        }
        private void ShowAppliedJob()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"SELECT ROW_NUMBER() over (order by (Select 1)) as [Sr.No],aj.AppliedJobsId,j.CompanyName,aj.JobId,j.Title,u.Mobile,
                     u.Name1,u.Email1,u.Resume from AppliedJobs aj
                      join [User] u on aj.UserId= u.UserId
                      join [Jobs] j on aj.JobId = j.JobId";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowAppliedJob();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int appliedJobId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from AppliedJobs where AppliedJobsId= @id", con);
                cmd.Parameters.AddWithValue("@id", appliedJobId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Text = "CV-ul s-a sters cu succes!";
                    lblMsg.CssClass = "alert alert-success";

                }
                else
                {
                    lblMsg.Text = "Nu poti sterge aceasta inregistrare!";
                    lblMsg.CssClass = "alert alert-danger";

                }
                con.Close();
                GridView1.EditIndex = -1;
                ShowAppliedJob();
            }
            catch (Exception ex)
            {
                con.Close();
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditJob")
            {
                Response.Redirect("NewJob.aspx?id=" + e.CommandArgument.ToString());

            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            //e.Row.ToolTip = "Click pentru a vedea detaliile jobului";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows) 
            {
                if(row.RowIndex==GridView1.SelectedIndex)
                {
                    HiddenField jobId = (HiddenField)row.FindControl("hdnJobId");
                    Response.Redirect("JobList.aspx?id=" + jobId.Value);
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click pentru a selecte linia";
                }
            }
        }

        }
    }