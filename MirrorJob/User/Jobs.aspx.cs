using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.User
{
    public partial class Jobs : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int jobCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showJobList();
                RBSelectedColorChange();
            }

        }

         void RBSelectedColorChange()
        {
            //if(RadioButtonList1.SelectedItem.Selected== true)
            //{
            //    RadioButtonList1.SelectedItem.Attributes.Add("class", "selectedradio");
            //}
        }

        private void showJobList()
        {
            if (dt == null)
            {  con = new SqlConnection(str);
                if (Session["user"] != null)
                {
                    string query = @"SELECT Jobs.JobId,Jobs.Title,Jobs.Salary,Jobs.JobType, Jobs.CompanyName, Jobs.CompanyImage, Jobs.Country, Jobs.CreateDate
                     FROM Jobs
                     join [User] on Jobs.Job=[User].Tip_Job 
                      where [User].Username=@username";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", Session["user"]);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                }
                else
                {
                    string query = @"SELECT * FROM Jobs"; 
                    cmd = new SqlCommand(query, con);                 
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                }
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            lbljobCount.Text = JobCount(dt.Rows.Count);
        }

        private string JobCount(int count)
        {
            if(count >1)
            {
                return "Total <b>" + count + "</b> Joburi gasite";
            }
            else if(count==1)
            {
                return "Total <b>" + count + "</b> job gasit";
            }
            else
            {
                return "Nu a fost gasit niciun job";
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCondition = false;
                string subquery = string.Empty;
                string jobType = string.Empty;
                string postedDate = string.Empty;
                string query = string.Empty;
                List<string> queryList = new List<string>();
                con = new SqlConnection(str);
            if(ddlCountry.SelectedValue !="0")
                {
                    queryList.Add(" Country='" + ddlCountry.SelectedValue + "' ");
                    isCondition = true;
                }
                jobType = selectedCheckBox();
                if(jobType!="")
                {
                    queryList.Add(" JobType IN (" + jobType + ") ");
                    isCondition = true;
                }
                //if(RadioButtonList1.SelectedValue !="0")
                //{
                //    postedDate = SelectedRadioButton();
                //    queryList.Add(" Convert(DATE, CreateDate) " + postedDate);
                //    isCondition = true;
                //}
              if(isCondition)
                {
                    foreach(string a in queryList)
                    {
                        subquery += a + " and ";
                      
                    }
                    subquery = subquery.Remove(subquery.LastIndexOf("and"), 3);
                    query = @"SELECT JobId,Title,Salary,JobType, CompanyName, CompanyImage, Country,Job CreateDate FROM Jobs WHERE " + subquery + " ";
                }
                else
                {
                    query= @"SELECT JobId,Title,Salary,JobType, CompanyName, CompanyImage, Country,Job CreateDate FROM Jobs";
                }
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
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

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlCountry.ClearSelection();
            CheckBoxList1.ClearSelection();
            //RadioButtonList1.SelectedValue = "0";
            RBSelectedColorChange();
            showJobList();
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlCountry.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query= @"SELECT JobId,Title,Salary,JobType, CompanyName, CompanyImage, Country,Job, CreateDate FROM Jobs Where Country='" + ddlCountry.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }
        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if(string.IsNullOrEmpty(url.ToString()) || url==DBNull.Value)
            {
                url1 = "~/Images/No_Imag.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);

        }
        public static string RelativeDate(DateTime theDate)
        {
            Dictionary<long, string> thresholds = new Dictionary<long, string>();
            int min = 60;
            int hour = 60 * min;
            int day = 24 * hour;
            thresholds.Add(60, "{0} secunde in urma");
            thresholds.Add(min*2, "un minut in urma");
            thresholds.Add(min*45, "{0} minute in urma");
            thresholds.Add(min*120, "o ora in urma in urma");
            thresholds.Add(day, "{0} ore in urma");
            thresholds.Add(day*2, "ieri");
            thresholds.Add(day*30, "{0} zile in urma");
            thresholds.Add(day*365, "{0} luni in urma");
            thresholds.Add(long.MaxValue, "{0} ani in urma");
            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;
            foreach (long threshold in thresholds.Keys)
            {
                if(since <threshold)
                {
                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));
                    return string.Format(thresholds[threshold],(t.Days>365 ? t.Days / 365 : (t.Days>0 ? t.Days :(t.Hours>0? t.Hours:(t.Minutes > 0 ? t.Minutes :(t.Seconds>0?t.Seconds:0))))).ToString());
                }
            }
            return "";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string jobType = string.Empty;
            jobType = selectedCheckBox();
            if(jobType !="")
            {
                con = new SqlConnection(str);
                string query= @"SELECT JobId,Title,Salary,JobType, CompanyName, CompanyImage, Country,Job CreateDate FROM Jobs Where JobType IN (" + jobType + ")";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                
            }
        }

        private string selectedCheckBox()
        {
            string jobType = string.Empty;
            for(int i=0;i< CheckBoxList1.Items.Count;i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    jobType += "'" + CheckBoxList1.Items[i].Text + "',";//Full Time,Remote
                }
            }
            return jobType = jobType.TrimEnd(',');
        }

        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (RadioButtonList1.SelectedValue != "0")
        //    {
        //        string postedDate = string.Empty;
        //        postedDate = SelectedRadioButton();
        //        con = new SqlConnection(str);
        //        string query = @"SELECT JobId,Title,Salary,JobType, CompanyName, CompanyImage, Country,Job CreateDate FROM Jobs WHERE Convert(DATE, CreateDate) " + postedDate + " ";
        //        cmd = new SqlCommand(query, con);
        //        sda = new SqlDataAdapter(cmd);
        //        dt = new DataTable();
        //        sda.Fill(dt);
        //        showJobList();
        //        RBSelectedColorChange();
        //    }
        //    else
        //    {
        //        showJobList();
        //        RBSelectedColorChange();
        //    }
        //}

        // string SelectedRadioButton()
        //{
        //    string postedDate = string.Empty;
        //    DateTime date = DateTime.Today;
        //    if (RadioButtonList1.SelectedValue == "1")
        //    {
        //        postedDate = "= Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
        //    }
        //    else if(RadioButtonList1.SelectedValue == "2")
        //    {
        //        postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd") + "') and Convert(DATE,'"+date.ToString("yyyy/MM/dd")+"') ";
        //    }
        //    else if (RadioButtonList1.SelectedValue == "3")
        //    {
        //        postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
        //    }
        //    else if (RadioButtonList1.SelectedValue == "4")
        //    {
        //        postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-4).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
        //    }
        //    else
        //    {
        //        postedDate = " between Convert(DATE,'" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "') ";
        //    }
        //    return postedDate;
        //}
    }
}