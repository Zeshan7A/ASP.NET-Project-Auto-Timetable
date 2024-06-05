using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack != true)
        {
            if (!string.IsNullOrEmpty(Session["Prof_Name"] as string))
            {
                lbluser.Text = Session["Prof_Name"].ToString();
                lblstdname.Text = Session["Prof_Name"].ToString();

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }




        //if (string.IsNullOrEmpty(Session["Prof_Name"] as string))
        //{
        //    Response.Redirect("~/login.aspx");
        //}       
    }


    protected void btnlogout_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        lbluser.Text = "";
        Response.Redirect("~/login.aspx");

    }
}
