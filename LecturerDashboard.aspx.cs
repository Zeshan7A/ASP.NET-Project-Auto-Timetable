using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LecturerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Session["Prof_Name"] as string))
        {
            lbllecturer.Text = Session["Prof_Name"].ToString();
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
    }
}