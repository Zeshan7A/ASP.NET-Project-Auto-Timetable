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

public partial class Registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            //FillGridView();
            // DropDownList1.Items.Add("Select Department");
           // MultiView1.ActiveViewIndex = 0;

        }
        CheckingAdmission();
    }//end of page load
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
                    //Button1.CssClass = "btn btn-success btn-rounded"; 
                    //Button2.CssClass = "btn btn-light btn-rounded";

                    btnSubmit.Enabled = true;
                    //txtRegNo.Focus();
                }
                else
                {
                    //Button2.CssClass = "btn btn-danger btn-rounded";
                    //Button1.CssClass = "btn btn-light btn-rounded";
                    btnSubmit.Enabled = false;
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students Registration is Disabled at this Time.Plz Contact with HOD')", true);

                }

            }
        }
        cmd.Dispose();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT COUNT(*) from Student where Std_RegNo='" + txtRegNo.Text + "' ";
        int userCount = (int)cmd.ExecuteScalar();
        if (userCount > 0)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);
        }
        else
        {
            cmd.CommandText = "SELECT Count(*) FROM Student where RollNo='" + txtRollNo.Text + "' and Semester='" + ddlSemester.SelectedItem.ToString() + "' and Session='" + txtsession.Text + "'";
            int existrollNo = (int)cmd.ExecuteScalar();
            if (existrollNo > 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Roll No Semester or Session.Student with same Roll No. is not allowed within Class. ')", true);


            }
            else
            {
                cmd.CommandText = "insert into Student Values('" + txtRegNo.Text + "','" + txtName.Text + "','" + txtfname.Text + "','" + txtRollNo.Text + "','" + ddlDepartment.SelectedItem.ToString() + "','" + txtsession.Text + "','" + ddlSemester.SelectedItem.ToString() + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "')";
                cmd.CommandType = CommandType.Text;
                int val = Convert.ToInt32(cmd.ExecuteNonQuery());
                if (val > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('You are successfully Registered.')", true);
                   // std();
                }
                else
                {
                    //error
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Oops something wrong.')", true);
                }
            }
        }

        cmd.Dispose();
        con.Close();
       // Response.Redirect("~/login.aspx");

    }//end submit button

    public void std()
    {

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select * from Student where Name='"+txtName.Text+"' and username='" + txtEmail.Text + "' and password ='" +txtPassword.Text + "'";
        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                Session["StdName"] = dr["Name"];
                Session["StdSemeter"] = dr["Semester"];
                Response.Redirect("~/StudentDashboard.aspx");
            }
        }
        else
        {
            //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Username and Password.')", true);
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('go to login page .')", true);

        }

    }


    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT COUNT(*) from Student where UserName='" + txtEmail.Text + "' ";
        int userCount = (int)cmd.ExecuteScalar();
        if (userCount > 0)
        {
            // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);
            lblmsg.Text = "Username already exists";
        }
        else
        {
            lblmsg.Text = "";
           // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);

        }
    }
}//end of class