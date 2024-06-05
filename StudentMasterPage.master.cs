using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {

            if (!string.IsNullOrEmpty(Session["StdName"] as string))
            {
                lbluser.Text = Session["StdName"].ToString();
                lblstdname.Text = Session["StdName"].ToString();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        lbluser.Text = "";
        Response.Redirect("~/login.aspx");
    }
}
