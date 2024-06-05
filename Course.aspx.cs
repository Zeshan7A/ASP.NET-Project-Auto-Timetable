using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Course : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    //public static int cr=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["Dept"] as string))
            {
                FillGridView();
                getcoursSchema();

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
           
            // DropDownList1.Items.Add("Select Department");
        }
        //ScriptManager.GetCurrent(this).RegisterPostBackControl(Button1);
    }//load page
    private void FillGridView()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from Course where Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();



    }//end of FillGridveiw function 
   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "select")
        {
            GridViewRow rowSelect = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int rowindex = rowSelect.RowIndex;
            // int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowindex];

            HiddenField prf = row.FindControl("pr") as HiddenField;
            var prdd = prf.Value;
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select * from Course Where Course_Code='" + prdd + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                if (dr.Read())
                {
                    LabelCourseCode.Text = dr["Course_Code"].ToString();
                    TextBox1.Text = dr["Course_Code"].ToString();
                    TextBox2.Text = dr["Title"].ToString();
                    TextBox3.Text = dr["Credit_Hour"].ToString();
                    mddlsemester.SelectedItem.Text = dr["Semester"].ToString();
                    
                    mddlCourseSchema.Text = dr["Course_Schema"].ToString();
                }
            }
           // ColoringTextboxes();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#mymodal').modal('show');", true);


        }//end if

    }//end rowcommand

    private void ColoringTextboxes()
    {
        TextBox1.BorderColor = Color.Gray;
        TextBox2.BorderColor = Color.Gray;
        TextBox3.BorderColor = Color.Gray;
        mddlCourseSchema.BorderColor = Color.Gray;
        mddlsemester.BorderColor = Color.Gray;
       
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("courseCode") as Label;

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "delete from Course where Course_Code=@courseCode";
        cmd.Parameters.AddWithValue("@courseCode", id.Text);
        cmd.CommandType = CommandType.Text;
        int val = Convert.ToInt32(cmd.ExecuteNonQuery());
        if (val > 0)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Deleted', 'success');", true);
            FillGridView();
        }
        else
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Successfully Saved', 'error');", true);
        }
        con.Close();
        cmd.Dispose();




    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);


        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "Update Course set Course_Code='" + TextBox1.Text + "', Title='" + TextBox2.Text + "', Credit_Hour='" + TextBox3.Text + "',Course_Schema='" + mddlCourseSchema.SelectedItem.ToString() + "', Semester='" + mddlsemester.SelectedValue.ToString() + "' where Course_Code='" + LabelCourseCode.Text + "'  ";
        int n = cmd.ExecuteNonQuery();
        if (n > 0)
        {
          //  this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully update', 'success');", true);
           // FillGridView();
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record Successfully Update.')", true);
            FillGridView();
        }
        else
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Updated. Plz try again.', 'warning');", true);
        }
        con.Close();
        cmd.Dispose();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#mymodal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();", true);





    }//end of update
    protected void btnAdd_Click(object sender, EventArgs e)
    {       
       
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;

            cmd.CommandText = " SELECT COUNT(*) from Course where Course_Code='"+txtcoursecode.Text+"' ";
            int userCount = (int)cmd.ExecuteScalar();
            if (userCount > 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);     
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * from Course where Course_Code='" + txtcoursecode.Text + "'", con);
                DataTable tb = new DataTable();
                sda.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
              
            }
            else
            {
              //  ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Add now..record not exist.')", true);
                cmd.CommandText = "INSERT into Course Values('" + txtcoursecode.Text + "','" + txtitle.Text + "','" + txtcredithour.Text + "','" + Session["Dept"].ToString() + "', '" + ddlsemester.SelectedValue.ToString() + "','" + ddlcourseSchema.SelectedItem.ToString() + "', '"+txtmaxMarks.Text+"' )";
                cmd.CommandType = CommandType.Text;
                int v = cmd.ExecuteNonQuery();
                if (v > 0)
                {

                    int Credit_Hour = Convert.ToInt32(txtcredithour.Text);
                    int Total_CH = Convert.ToInt32(lbmaxch.Text);

                    Total_CH += Credit_Hour;
                    lbmaxch.Text = Total_CH.ToString();
                    //  this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Savad', 'success');", true);
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is successfully Add.')", true);
                    FillGridView();
                    //  lbmaxch.Text = Credit_Hour.ToString();

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Oops! something wrong.')", true);
                }
            }



        
        //}
        con.Close();
        cmd.Dispose();
    }//end of btnAdd

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
       FillGridView();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from Course where Semester='" + DropDownList2.SelectedValue.ToString()+ "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
        GridView1.Focus();
        //int cr = 0;
        //for (int i = 0; i < GridView1.Rows.Count; i++)
        //{
        //    Label lb = GridView1.Rows[i].FindControl("CreditHours") as Label;
        //    cr += Convert.ToInt32(lb.Text);


        //}
        //maxch.Text = cr.ToString();

    }
    protected void ddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
    
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from Course where Semester='" + ddlsemester.SelectedValue.ToString() + "' and Course_Schema='" +ddlcourseSchema.SelectedValue.ToString() +"'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
        GridView1.Focus();
        int cr = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label lb = GridView1.Rows[i].FindControl("CreditHours") as Label;
            cr += Convert.ToInt32(lb.Text);

          
        }
        lbmaxch.Text = cr.ToString();

     
        
        //foreach (GridViewRow row in GridView1.Rows)
        //{
        //    Label lb = GridView1.Rows[2].FindControl("CreditHours") as Label;
        //     cr += Convert.ToInt32( lb.Text);
        //}
        //lbmaxch.Text = cr.ToString();
        //int ch = 0;
        //cmd.Connection = con;
        //cmd.CommandText = "select * from Course Where Semester='" + ddlsemester.SelectedValue.ToString()+ "'";
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.HasRows == true)
        //{
        //    while(dr.Read())
        //    {
               
        //       // TextBox3.Text = dr["Credit_Hour"].ToString();
        //        ch +=Convert.ToInt32(dr["Credit_Hour"]);
        //    }
        //    lbmaxch.Text = ch.ToString();
        //}
        //cmd.Dispose();
        //con.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
 
     
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = " SELECT COUNT(*) from CourseSchema where Course_Schema='" + txtmCourseSchema.Text + "' and Dept_Name='"+ Session["Dept"].ToString()+"' ";
        int userCount = (int)cmd.ExecuteScalar();
        if (userCount > 0)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record already Exist.')", true);           

        }
        else
        {
            //  ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Add now..record not exist.')", true);
            cmd.CommandText = "INSERT into CourseSchema Values('" + txtmCourseSchema.Text + "','" + Session["Dept"].ToString() + "' )";
            cmd.CommandType = CommandType.Text;
            int v = cmd.ExecuteNonQuery();
            if (v > 0)
            {
              
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Record is Successfully Add.')", true);
                getcoursSchema();

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Oops! something wrong.')", true);
            }
        }


        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#exampleModal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();", true);

        //}
        con.Close();
        cmd.Dispose();

  

    }
    public void getcoursSchema()
    {
        ddlcourseSchema.Items.Clear();
        ddlcourseSchema.Items.Add("--Select Course Schema--");

        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select Course Schema--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Course_Schema from CourseSchema where Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlcourseSchema.DataSource = tb;
      
        ddlcourseSchema.DataTextField = "Course_Schema";
        ddlcourseSchema.DataValueField = "Course_Schema";
        ddlcourseSchema.DataBind();

        DropDownList1.DataSource = tb;
        DropDownList1.DataTextField = "Course_Schema";
        DropDownList1.DataValueField = "Course_Schema";
        DropDownList1.DataBind();
        con.Close();
        cmd.Dispose();



        //DropDownList1.Items.Clear();
        //DropDownList1.Items.Add("--Select Subject--");
        //if (con.State == ConnectionState.Open)
        //{
        //    con.Close();
        //}
        //con.Open();
        //cmd.Connection = con;
        //SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + ddlsemester.SelectedValue.ToString() + "'", con);
        //DataTable tb = new DataTable();
        //sda.Fill(tb);
        //DropDownList1.DataSource = tb;

        //DropDownList1.DataTextField = "Title";
        //DropDownList1.DataValueField = "Course_Code";
        //DropDownList1.DataBind();
        //con.Close();
        //cmd.Dispose();

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from Course where Semester='" + DropDownList2.SelectedValue.ToString() + "' and Course_Schema='" + DropDownList1.SelectedValue.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
        GridView1.Focus();
    }
}//end of class