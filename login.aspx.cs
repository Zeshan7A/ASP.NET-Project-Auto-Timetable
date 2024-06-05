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

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        txtusername.Focus();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {

        //if (txtusername.Text == "" && txtpassword.Text == "")
        //{
        //    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Please enter username & password.')", true);

        //}
        //else
        //{
            if (ddlrole.SelectedItem.Text == "--Select role--")
            {
            lblError.Text = "Please Select your role.";
            ErrorMessageAlert.Visible = true;
            // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Please Select your role.')", true);
            //ClientScript.RegisterStartupScript(GetType(), "SweetAlert", "swal('Ooops', 'Please Select your role', 'error');", true);

        }
        else if (ddlrole.SelectedItem.Text == "BS Office Admin")
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select username,password from tbAdmin where username='" + txtusername.Text + "' and password ='" + txtpassword.Text + "'";
                cmd.CommandType = CommandType.Text;
               SqlDataReader dr = cmd.ExecuteReader();
               if (dr.HasRows == true)
               {
                   if (dr.Read())
                   {
                       Session["role"] = dr["role"];
                      // Response.Redirect("~/CommantsPage.aspx");
                   }
               }
               else 
               {
                  // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Username and Password.')", true);
                lblError.Text = "Check your Username and Password.";
                ErrorMessageAlert.Visible = true;
            }

            }
            else if (ddlrole.SelectedItem.Text == "Dept Admin")
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select username,password,role,Department from Admin where username='" + txtusername.Text + "' and password ='" + txtpassword.Text + "'";
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    if (dr.Read())
                    {
                    Session["role"] = dr["role"];
                    Session["Dept"] = dr["Department"];
                    Response.Redirect("~/Default.aspx");
                    }
                }
                else
                {
                   // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Username and Password.')", true);
                lblError.Text = "Check your Username and Password.";
                ErrorMessageAlert.Visible = true;

            }

            }
            else if (ddlrole.SelectedItem.Text == "Student")
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from Student where username='" + txtusername.Text + "' and password ='" + txtpassword.Text + "'";
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    if (dr.Read())
                    {
                    Session["stdid"] = dr["StdID"];
                        Session["StdName"] = dr["Name"];
                    Session["StdSemeter"] = dr["Semester"];
                    Session["Dept"] = dr["Dept_Name"].ToString();
                    Response.Redirect("~/StudentDashboard.aspx");
                    }
                }
                else
                {
                    //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Username and Password.')", true);
                lblError.Text = "Check your Username and Password.";
                ErrorMessageAlert.Visible = true;
            }

            }
            else if (ddlrole.SelectedItem.Text == "Lecturer")
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from Professor where username='" + txtusername.Text + "' and password ='" + txtpassword.Text + "'";
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    if (dr.Read())
                    {
                        Session["ProfessorNum"] = dr["Prof_Num"];
                        Session["Prof_Name"] = dr["Name"];
                        Session["Prof_Dept"] = dr["Dept_Name"];
                        SelectCurrentSession();
                       
                       // Response.Redirect("~/FacultyProfile.aspx");
                        Response.Redirect("~/LecturerDashboard.aspx");
                    }
                }
                else
                {
                   // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Username and Password.')", true);
                lblError.Text = "Check your Username and Password.";
                ErrorMessageAlert.Visible = true;
            }

            }


        //}//end outer else


        //con.Open();
        //cmd.Connection = con;
        //cmd.CommandText = "select * from tbadmin where username='" + TextBox1.Text + "' and password ='" + TextBox2.Text + "'";
        //cmd.CommandType = CommandType.Text;
        //SqlDataReader reader = cmd.ExecuteReader();
        //if (reader.HasRows)
        //{
        //    while (reader.Read())
        //    {
        //        Session["username"] = reader["username"];
        //        Session["role"] = reader["role"];
        //    }
        //    reader.Close();
        //    if (Session["role"].ToString() == "Admin")
        //    {
        //        Response.Redirect("~/CommantsPage.aspx");
        //    }
        //}
        //con.Close();
        //cmd.Dispose();
    }
    private void SelectCurrentSession()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT DISTINCT Current_Session FROM Class WHERE Class_Code=(SELECT max(Class_Code) FROM Class)";
        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                Session["currentsession"] = dr["Current_Session"];
                // Response.Redirect("~/CommantsPage.aspx");
            }
        }
        dr.Close();
        con.Close();
        cmd.Dispose();
    }
}