using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            if (Session["Dept"] != null)
            {
                lbldeptName.Text = Session["Dept"].ToString();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }

        }
       // CheckingAdmission();
    }
    private void CheckingAdmission()
    {
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select Status from tbEnableRegistration";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                string status;
                status = dr["Status"].ToString();
                if (status == "Enable")
                {
                    Button1.CssClass = "btn btn-success btn-rounded";
                    Button2.CssClass = "btn btn-light btn-rounded";

                   // btnSubmit.Enabled = true;
                    //txtRegNo.Focus();
                }
                else
                {
                    Button2.CssClass = "btn btn-danger btn-rounded";
                    Button1.CssClass = "btn btn-light btn-rounded";
                   // btnSubmit.Enabled = false;
                   // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students Registration is Disabled at this Time.Plz Contact with HOD')", true);

                }

            }
        }
        cmd.Dispose();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "update tbEnableRegistration set  Status='Enable' where Status='Disabled'";
        int n = cmd.ExecuteNonQuery();
        if (n > 0)
        {
            Button1.CssClass = "btn btn-success btn-rounded";
            Button2.CssClass = "btn btn-light btn-rounded";
            //btnSubmit.Enabled = true;
            //txtRegNo.Focus();
        }
        cmd.Dispose();
        con.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "update tbEnableRegistration set Status='Disabled' where Status='Enable'";
        int n = cmd.ExecuteNonQuery();
        if (n > 0)
        {
            Button2.CssClass = "btn btn-danger btn-rounded";
            Button1.CssClass = "btn btn-light btn-rounded";
            //btnSubmit.Enabled = false;

           // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students Registration is Disabled at this Time.Plz Contact with HOD')", true);
        }
        cmd.Dispose();
        con.Close();
    }
}