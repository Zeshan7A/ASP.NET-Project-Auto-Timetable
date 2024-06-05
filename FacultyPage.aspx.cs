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

public partial class FacultyPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        RemoveDuplicateItems();
       // Calendar1.Visible = false;
   }

   public void RemoveDuplicateItems()
    {

        ddlCourse.Items.Clear();
        ddlCourse.Items.Add("--Select Course--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("SELECT DISTINCT Title from View_2  Where Current_Session='Spring-2020' and Name='Ajobnoor'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlCourse.DataSource = tb;

        ddlCourse.DataTextField = "Title";
        ddlCourse.DataValueField = "Title";
        ddlCourse.DataBind();
        con.Close();
        cmd.Dispose();
    }

   protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
   {

       
       if (con.State == ConnectionState.Open)
       {
           con.Close();
       }
       con.Open();
       cmd.Connection = con;
       SqlDataAdapter sda = new SqlDataAdapter("SELECT Std_RegNo,Name,RollNo from Student where Dept_Name='" + ddlDept.SelectedItem.ToString() + "' and Session='" + ddlSession.SelectedItem.ToString() + "' and Semester='" + ddlSemester.SelectedItem.ToString() + "'", con);     
       DataTable tb = new DataTable();
       sda.Fill(tb);
       GridView1.DataSource = tb;
       GridView1.DataBind();
       con.Close();
       cmd.Dispose();
   }
}//end class