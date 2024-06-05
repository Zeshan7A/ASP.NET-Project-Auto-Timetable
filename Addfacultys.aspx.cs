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

public partial class Addfacultys : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["Dept"] as string))
            {

                ddlDepartment.Items.Add(Session["Dept"].ToString());
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
            cmd.Connection = con;
            //Extract Image File Name.
            //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            //Set the Image File Path.
            // string filePath = "~/images/" + fileName;

            //string strname =  FileUpload2.FileName.ToString();

          //  FileUpload1.PostedFile.SaveAs(Server.MapPath("~/assets/images/Professor/") + strname);

            cmd.CommandText = "insert into Professor Values('" + txtPersonalNum.Text + "','" + txtName.Text + "','" + txtdesignation.Text + "','" + txtaddress.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','"+txtPassword.Text+"','" + ddlDepartment.SelectedItem.ToString() + "')";
            cmd.CommandType = CommandType.Text;
            int val = Convert.ToInt32(cmd.ExecuteNonQuery());
            if (val > 0)
            {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);              

            }
            else
            {
                //error
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "SweetAlert", "swal('Ooops!', 'Something Wrong!.', 'error');", true);

                //Label1.Text = "there is error";
            }
            cmd.Dispose();
            con.Close();
        }
        else
        {
            cmd.Dispose();
            con.Close();
        }
    }


  
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'warning');", true);
       // ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);      
    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT COUNT(*) from Professor where UserName='" + txtEmail.Text + "' ";
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
}