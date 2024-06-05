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

public partial class AddStudent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();


    protected void Page_Load(object sender, EventArgs e)
    {
       
       
        if (!Page.IsPostBack)
        {
            FillGridView();
            // DropDownList1.Items.Add("Select Department");
            MultiView1.ActiveViewIndex = 0;
          
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
    private void FillGridView()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student ORDER BY RollNo ASC", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();



    }//end of FillRepeater function 

    protected void Button1_Click(object sender, EventArgs e)
    {
    }//end add button
   
    protected void btnreset_Click(object sender, EventArgs e)
    {
        FillGridView();
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
                //Extract Image File Name.
                //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                //Set the Image File Path.
                // string filePath = "~/images/" + fileName;

                //  string strname = FileUpload1.FileName.ToString();

                //  FileUpload1.PostedFile.SaveAs(Server.MapPath("~/assets/images/Professor/") + strname);
                cmd.CommandText = "SELECT Count(*) FROM Student where RollNo='" + txtRollNo.Text + "' and Semester='" + ddlSemester.SelectedItem.ToString() + "' and Session='" + txtsession.Text + "'";
                int existrollNo = (int)cmd.ExecuteScalar();
                if (existrollNo > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Check your Roll No Semester or Session.Student with same Roll No. is not allowed within Class. ')", true);
                    SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student where RollNo='" + txtRollNo.Text + "' and Semester='" + ddlSemester.SelectedItem.ToString() + "' and Session='" + txtsession.Text + "'", con);
                    DataTable tb = new DataTable();
                    sda.Fill(tb);
                    GridView1.DataSource = tb;
                    GridView1.DataBind();
                    GridView1.Focus();
                
                }
                else
                {
                    cmd.CommandText = "insert into Student Values('" + txtRegNo.Text + "','" + txtName.Text + "','" + txtfname.Text+"','" + txtRollNo.Text + "','" + ddlDepartment.SelectedItem.ToString() + "','" + txtsession.Text + "','" + ddlSemester.SelectedItem.ToString() + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + null + "')";
                    cmd.CommandType = CommandType.Text;
                    int val = Convert.ToInt32(cmd.ExecuteNonQuery());
                    if (val > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is successfully Add.')", true);
                        FillGridView();

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
        

    }//end submit button
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }

    //    con.Open();
    //    cmd.Connection = con;
    //    SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Dept_Name,Semester,Session,UserName,Password from Student where Session='" + DropDownList1.SelectedItem.ToString() + "' and Semester='" + DropDownList2.SelectedItem.ToString() + "' ORDER BY RollNo ASC", con);
    //    DataTable tb = new DataTable();
    //    sda.Fill(tb);
    //    GridView1.DataSource = tb;
    //    GridView1.DataBind();
    //    con.Close();
    //    cmd.Dispose();
    //    GridView1.Focus();

    //}
    //protected void Button1_Click1(object sender, EventArgs e)
    //{
        
    //         if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }
    //    con.Open();
    //    cmd.Connection = con;
    //    cmd.CommandText = "update tbEnableRegistration set  Status='Enable' where Status='Disabled'";
    //    int n = cmd.ExecuteNonQuery();
    //    if (n > 0)
    //    {
    //        Button1.CssClass = "btn btn-success btn-rounded";
    //        Button2.CssClass = "btn btn-light btn-rounded";            
    //        btnSubmit.Enabled = true;
    //        txtRegNo.Focus();
    //    }
    //    cmd.Dispose();
    //    con.Close();


    //}
    //protected void Button2_Click(object sender, EventArgs e)
    //{
  
       
    //    if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }
    //    con.Open();
    //    cmd.Connection = con;
    //    cmd.CommandText = "update tbEnableRegistration set Status='Disabled' where Status='Enable'";
    //    int n = cmd.ExecuteNonQuery();
    //    if (n > 0)
    //    {
    //        Button2.CssClass = "btn btn-danger btn-rounded";
    //        Button1.CssClass = "btn btn-light btn-rounded";
    //        btnSubmit.Enabled = false;
   
    //        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students Registration is Disabled at this Time.Plz Contact with HOD')", true);
    //    }
    //    cmd.Dispose();
    //    con.Close();

    //}

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       // Label id = GridView1.Rows[e.RowIndex].FindControl("StdRegNum") as Label;
        //int index = Convert.ToInt32(e.CommandArgument);
        //GridViewRow selectedRow = GridView1.Rows[index];
        //string id = selectedRow.Cells[0].Text;

        if (e.CommandName == "select")
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Select event occured.')", true);
            //con.Open();
            //SqlCommand sq = new SqlCommand("DELETE FROM Student where Std_RegNo='" + id + "'", con);
            //sq.ExecuteNonQuery();
            //con.Close();
        }
        else if (e.CommandName== "Delete")
        {

          //  ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students record is successfully delete.')", true);

            //GridViewRow rowSelect = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            //int rowindex = rowSelect.RowIndex;

            //GridViewRow row = GridView1.Rows[rowindex];

            //Label stdno = row.FindControl("StdRegNum") as Label;

            //con.Open();
            //cmd.Connection = con;
            //cmd.CommandText = "delete from Student where Std_RegNo='" + stdno.Text + "'";
            //cmd.CommandType = CommandType.Text;
            //int val = Convert.ToInt32(cmd.ExecuteNonQuery());
            //if (val > 0)
            //{
            //    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students record is successfully delete.')", true);
            //    FillGridView();
            //}
            //else
            //{
            //    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Oops something wrong.')", true);
            //}
            //cmd.Dispose();
            //con.Close();

        }//end else if

    }//end of event

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("StdRegNum") as Label;

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "delete from Student where Std_RegNo=@StdRegNum";
        cmd.Parameters.AddWithValue("@StdRegNum", id.Text);
        cmd.CommandType = CommandType.Text;
        int val = Convert.ToInt32(cmd.ExecuteNonQuery());
        if (val > 0)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Students record is successfully delete.')", true);
            FillGridView();
        }
        else
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Successfully Saved', 'error');", true);
        }
        con.Close();
        cmd.Dispose();




    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
 
    protected void ButtonViewAll_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

  
}//end class