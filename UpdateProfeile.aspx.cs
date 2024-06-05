using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class UpdateProfeile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
     
        if (Page.IsPostBack != true)
        {

            if (!string.IsNullOrEmpty(Session["StdName"] as string))
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
        cmd.CommandText = "Update Student set Std_RegNo='"+txtRegNo.Text+"', Name='" + txtName.Text + "', RollNo='" + txtRollNo.Text + "',Semester='" + ddlSemester.SelectedItem.Text.ToString() + "',Session='" + txtsession.Text + "', UserName='" + txtEmail.Text + "', Password='" + txtPassword.Text + "' where StdID='" + Session["stdid"].ToString() + "'  ";

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
        SqlCommand cmd = new SqlCommand("select * from Student where StdID='" + Session["stdid"].ToString() +"'  ", con);
        //Name='" + Session["StdName"].ToString() + "' and Session='"+  +"'  ", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {

            while (dr.Read())
            {
                txtRegNo.Text = dr["Std_RegNo"].ToString();
                txtName.Text = dr["Name"].ToString();
                txtfname.Text = dr["FatherName"].ToString();
                txtRollNo.Text = dr["RollNo"].ToString();
                ddlDepartment.Text = dr["Dept_Name"].ToString();
                txtsession.Text = dr["Session"].ToString();
                ddlSemester.Text = dr["Semester"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtEmail.Text = dr["UserName"].ToString();
                txtPassword.Text = dr["Password"].ToString();
                    
            }
          
        }
        con.Close();
        cmd.Dispose();
        dr.Close();

    }


}