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

public partial class DeleteUpdateFaculty : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    public static string rgNo,RolNo;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
           FillGridView();
            // DropDownList1.Items.Add("Select Department");
        }
    }
    private void FillGridView()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student where Dept_Name='" + Session["Dept"].ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();



    }//end of FillRepeater function 

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "select")
        {
            GridViewRow rowSelect = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int rowindex = rowSelect.RowIndex;
            // int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowindex];

            //HiddenField prf = row.FindControl("pr") as HiddenField;
            //var prdd = prf.Value;
            Label Regno=row.FindControl("StdRegNo") as Label;
            var RegistraionNo=Regno.Text;
            rgNo = Regno.Text;
            Label nam=row.FindControl("lblName") as Label;
            var StdName=nam.Text;
            Label Rollno=row.FindControl("lblRollNo") as Label;
            var RollNo=Rollno.Text;
            RolNo = RollNo;
            Label semester=row.FindControl("lblSemester") as Label;
            var Semester=semester.Text;
            Label session=row.FindControl("lblSession") as Label;
            var Session=session.Text;
            Label username=row.FindControl("lblUsername") as Label;
            var UserName=username.Text;
            Label password=row.FindControl("lblPassword") as Label;
            var Password=password.Text;

                    TextBox1.Text = RegistraionNo;
                    TextBox2.Text = StdName;
                    TextBox3.Text = RollNo;
                    TextBox4.Text = Semester;
                    TextBox5.Text = Session;
                   // TextBox6.Text = dr["Phone;
                    TextBox7.Text = UserName;
                    TextBox8.Text =Password;
            //con.Open();
            //cmd.Connection = con;
            //cmd.CommandText = "select * from Student Where Std_RegNo='" + prdd + "'";
            //SqlDataReader dr = cmd.ExecuteReader();
            //if (dr.HasRows == true)
            //{
            //    if (dr.Read())
            //    {
            //        RegistrationNo = dr["Std_RegNo"].ToString();
            //        TextBox1.Text = dr["Std_RegNo"].ToString();
            //        TextBox2.Text = dr["Name"].ToString();
            //        TextBox3.Text = dr["RollNo"].ToString();
            //        TextBox4.Text = dr["Semester"].ToString();
            //        TextBox5.Text = dr["Session"].ToString();
            //        TextBox6.Text = dr["Phone"].ToString();
            //        TextBox7.Text = dr["UserName"].ToString();
            //        TextBox8.Text = dr["Password"].ToString();

            //    }

                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#mymodal').modal('show');", true);


            //}
        }
    }

   




    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("StdRegNo") as Label;

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "delete from Student where Std_RegNo=@StdRegNo";
       cmd.Parameters.AddWithValue("@StdRegNo", id.Text);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
    //    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is successfully Deleted')", true);
        FillGridView();
        con.Close();
        cmd.Dispose();




    }
 
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
        this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        if (TextBox1.Text == rgNo)
        {
            cmd.CommandText = "Update Student set Name='" + TextBox2.Text + "', RollNo='" + TextBox3.Text + "',Semester='" + TextBox4.Text + "',Session='" + TextBox5.Text + "', UserName='" + TextBox7.Text + "', Password='" + TextBox8.Text + "' where Std_RegNo='" + rgNo + "'  ";        
            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                lblerror.Text = "";
                lblerror2.Text = "";
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is successfully Updated')", true);
                FillGridView();
            }
        }
        else
        {               
            cmd.CommandText = "SELECT COUNT(*) from Student where Std_RegNo='" + TextBox1.Text + "' ";
            int userCount = (int)cmd.ExecuteScalar();
            if (userCount > 0)//if RegNo exist
            {
                lblerror.Text = "This Registration No is exist!";
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#mymodal').modal('show');", true);
                //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);
            }
            else
            {
                //update code means not exist rollno in semester
                cmd.CommandText = "Update Student set Std_RegNo='" + TextBox1.Text + "', Name='" + TextBox2.Text + "', RollNo='" + TextBox3.Text + "',Semester='" + TextBox4.Text + "',Session='" + TextBox5.Text + "', UserName='" + TextBox7.Text + "', Password='" + TextBox8.Text + "' where Std_RegNo='" + rgNo + "'  ";
                // cmd.ExecuteNonQuery();
                int n = cmd.ExecuteNonQuery();
                if (n > 0)
                {
                    lblerror.Text = "";
                    lblerror2.Text = "";
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is successfully Updated')", true);
                    FillGridView();
                }
            } 

        }


           
        con.Close();
        cmd.Dispose();
    }
  
    protected void btnreset_Click(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();", true)
        FillGridView();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student where Session='" + txtsession.Text + "' and Semester='" + ddlsemester.SelectedItem.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "' ORDER BY RollNo ASC", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();

    }

    protected void ddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student where Session='" + txtsession.Text + "' and Semester='" + ddlsemester.SelectedItem.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "' ORDER BY RollNo ASC", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
    }
}//end of class