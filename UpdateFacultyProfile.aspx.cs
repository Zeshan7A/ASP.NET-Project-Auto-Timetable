using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class UpdateFacultyProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack != true)
        {

            if (!string.IsNullOrEmpty(Session["ProfessorNum"] as string))
            {
                selectdata();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "Update Professor set Name='" + txtName.Text + "', Designation='" + txtdesignation.Text + "', Address='" + txtaddress.Text + "', ContactNo='" + txtPhone.Text + "', UserName='" + txtEmail.Text + "', Password='" + txtPassword.Text + "', Dept_Name='" + ddlDepartment.SelectedItem.ToString() + "' where Prof_Num='" + Session["ProfessorNum"].ToString() + "'  ";
        cmd.CommandType = CommandType.Text;
        int val = Convert.ToInt32(cmd.ExecuteNonQuery());
        if (val > 0)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('You is successfully Updated.')", true);
            selectdata();
        }
        else
        {
            //error
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Oops something wrong.')", true);
        }
        cmd.Dispose();
        con.Close();


    }

    protected void selectdata()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        //   Session["StdName"] = dr["Name"];
        // Session["StdSemeter"] = dr["Semester"];
        SqlCommand cmd = new SqlCommand("select * from Professor where Prof_Num='" + Session["ProfessorNum"].ToString() + "'  ", con);
        //Name='" + Session["StdName"].ToString() + "' and Session='"+  +"'  ", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {

            while (dr.Read())
            {
               txtPersonalNum.Text = dr["Prof_Num"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtdesignation.Text = dr["Designation"].ToString();
                txtaddress.Text = dr["Address"].ToString();
                ddlDepartment.SelectedItem.Text = dr["Dept_Name"].ToString();
                txtPhone.Text = dr["ContactNo"].ToString();
                txtEmail.Text = dr["UserName"].ToString();
                txtPassword.Text = dr["Password"].ToString();
            }

        }
        con.Close();
        cmd.Dispose();
        dr.Close();

    }


}