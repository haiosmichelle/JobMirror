using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MirrorJob.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            if (Session["user"] !=null)
            {
               
                Response.Redirect("/User/Cv.aspx");
            }
            else
            {
                Response.Redirect("/User/Login.aspx");
            }
        }
    }
}