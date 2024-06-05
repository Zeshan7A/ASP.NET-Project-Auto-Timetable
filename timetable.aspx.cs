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


public partial class Timetable : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
           // ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time')", true);

            // bool v=  CheckingOnlyClass();
            FillGridView();
            getprofessor();
            MultiView1.ActiveViewIndex = 0;
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
        SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Dept_Name='"+ Session["Dept"].ToString()+"' Order by Class_Code Desc", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();

        //string duplicateValue = GridView1.Rows[0].Cells[1].Text;
        //for (int i = 1; i < GridView1.Rows.Count; i++)
        //{
        //    if (GridView1.Rows[i].Cells[1].Text == duplicateValue)
        //    {
        //        GridView1.Rows[i].Cells[1].Text = string.Empty;
        //    }
        //    else
        //    {
        //        duplicateValue = GridView1.Rows[i].Cells[1].Text;
        //    }
        //}




    }//end of FillGridveiw function 

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string time=null;
        if (e.CommandName == "select")
        {


            // updaterow.Focus();
            GridViewRow rowSelect = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            int rowindex = rowSelect.RowIndex;
            // int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowindex];

            HiddenField prf = row.FindControl("pr") as HiddenField;
            HiddenField dept = row.FindControl("hfDept") as HiddenField;
            var prdd = prf.Value;

            HiddenField coursecode = row.FindControl("hfsubjectcode") as HiddenField;
            Label lblClassCode = row.FindControl("classCode") as Label;

            Label lbldept = row.FindControl("lbldept") as Label;
            Label lbname = row.FindControl("lbname") as Label;
            var name = lbname.Text;
            Label lbtitle = row.FindControl("lbtitle") as Label;
            var subject = lbtitle.Text;
            HiddenField prfnum = row.FindControl("profno") as HiddenField;
            var profno = prfnum.Value;
            //Label lbhour = row.FindControl("lbhour") as Label;
            //var hours = lbhour.Text;
            Label lbtime = row.FindControl("lblHour") as Label;
            var times = lbtime.Text;
            Label lbsemester = row.FindControl("lbsemester") as Label;
            var smester = lbsemester.Text;
            Label lbcurrentsession = row.FindControl("lbcurrentsession") as Label;
            var currentsession = lbcurrentsession.Text;
           
            ddlupdateDept.SelectedItem.Text = lbldept.Text;
            //DropDownListSubject.SelectedItem.Text = subject;
            // DropDownListSubject.SelectedValue = profno.ToString();
            //DropDownListProfessor.SelectedItem.Text = name;
            //DropDownListSemester.SelectedItem.Text = smester;
            ////DropDownListSubject.SelectedItem.Text = dr["Title"].ToString();
            lblSubjectCode.Text = coursecode.Value;
            //ddlupdateProfessor.SelectedItem.Text = name.ToString();
            lblProfcode.Text = profno.ToString();
            lbldept.Text = dept.Value;
            TextBox3.Text = times;
            TextBox4.Text = currentsession;
            lblSubject.Text = subject.ToString();
            lblSemester.Text = smester.ToString();
            lblProfessor.Text = name.ToString();
           // updatealert.Visible = false;
           // updaterow.Visible = true;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select Class_Code,Day,Hour from ClassView Where Class_Code='" + lblClassCode.Text + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
               while (dr.Read()==true)
                {
                  
                    time += dr["Day"].ToString() + "," ;

                }
            }
            con.Close();
            cmd.Dispose();
            TextBox2.Text = time;




            /////////////////////
            ddlupdateProfessor.Items.Clear();
            ddlupdateProfessor.Items.Add("--Select Professor--");
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("SELECT [Prof_Num], [Name] FROM [Professor]  where Dept_Name='" + lbldept.Text + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            ddlupdateProfessor.DataSource = tb;
            ddlupdateProfessor.DataTextField = "Name";
            ddlupdateProfessor.DataValueField = "Prof_Num";

            ddlupdateProfessor.DataBind();
            con.Close();
            cmd.Dispose();

            ddlupdateProfessor.SelectedItem.Text = lbname.Text;
            ///////////////////////////
            MultiView1.ActiveViewIndex = 1;
        }//end if
    }//end rowcommand 
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("classCode") as Label;
     
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "delete from Class where Class_Code=@classCode";
        cmd.Parameters.AddWithValue("@classCode", id.Text);
        cmd.CommandType = CommandType.Text;
        int val = Convert.ToInt32(cmd.ExecuteNonQuery());
        if (val > 0)
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Deleted', 'success');", true);
            FillGridView();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Successfully Saved', 'error');", true);

        }
        con.Close();
        cmd.Dispose();




    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#mymodal').modal('show');", true);
    }

    //update button
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //  ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);


        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        // cmd.CommandText = "Update Class set Class_Time='" + mtxtclastime.Text + "', Semester_Year='" + mtxtsemesteryear.Text + "' where Class_Code='" + mtxtclasscode.Text + "'  ";
        int n = cmd.ExecuteNonQuery();
        if (n > 0)
        {

            // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Updated', 'success');", true);

            FillGridView();
        }
        else
        {
            //this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Updated. Plz try again.', 'warning');", true);
            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Updated. Plz try again.', 'warning');", true);
        }
        con.Close();
        cmd.Dispose();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();", true);

    }//end of update

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        FillGridView();

    }

    //add button
    protected void btnAdd_Click1(object sender, EventArgs e)
    {

        //string message = "";
        //foreach (ListItem item in animals.Items)
        //{
        //    if (item.Selected)
        //    {
        //        message += item.Text  + ",";
        //    }
        //}
        //string days;
        //days=message;

        // errorlabel.Visible = false;
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        //Class_Time='" +txtclstime.Text+ "' and Day='" + TextBox1.Text + "' and
        cmd.CommandText = "select Day,Hour,Prof_Num,Course_Code,Semester,Current_Session from Class where  (Day='" + TextBox1.Text + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "') or ( Day='" + TextBox1.Text + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "')";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            // errorlabel.Text = "Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time";
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time')", true);
            //alertmsg.Visible = true;
            // errorlabel.ForeColor = Color.Red; Day='" + TextBox1.Text + "' and
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "') or ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Name='" + ddlprofessor.SelectedItem.Text + "') ", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();


        }//end has.row

        else
        {
            ///assign class to teacher first time
            dr.Close();
            cmd.CommandText = "INSERT into Class Values('"+ TextBox1.Text + "','" + txtclstime.Text + "','" + ddlprofessor.SelectedValue.ToString() + "','" + DropDownList1.SelectedValue.ToString() + "','" + ddlsemester.SelectedValue.ToString() + "','" + txtsemesteryear.Text + "')";
            cmd.CommandType = CommandType.Text;
            int v = cmd.ExecuteNonQuery();
            if (v > 0)
            {

                // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is Successfully Saved')", true);

                //  FillGridView();
                //  errorlabel.ForeColor = Color.Green;
                // alertmsg.Visible = true;
                //  errorlabel.Text = "Class is Successfully Assigned";
                FillGridView();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Oooop!', 'Sorry something is wrong', 'Warring');", true);
            }
        }


        con.Close();
        cmd.Dispose();
        dr.Close();
        dr.Dispose();
    }//end of add button


    protected void sddlprofessor_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (RadioButton1.Checked == true)
        {
            //Label6.Text = "Defualt Searching now";
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Name='" + sddlprofessor.SelectedItem.ToString() + "'  and Dept_Name='"+Session["Dept"].ToString()+"'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();
        }
        else if (RadioButton2.Checked == true)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();

        }

    }
    protected void sddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
       // animals.CssClass = "filter-multi-select";

        if (RadioButton1.Checked == true)
        {
            var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + syaer + "' and Semester='" + sddlsemester.SelectedItem.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            con.Close();
            cmd.Dispose();
        }
        else if (RadioButton2.Checked == true)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Semester='" + sddlsemester.SelectedItem.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            con.Close();
            cmd.Dispose();
        }

    }

    protected void txtsyear_TextChanged(object sender, EventArgs e)
    {

        if (RadioButton1.Checked == true)
        {
            var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + syaer + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();
        }
        else if (RadioButton2.Checked == true)
        {
            var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Current_Session='" + syaer + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();
        }


    }
    protected void ddlSemesterYear_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (txtsyear.Text != "")
        {

            if (RadioButton1.Checked == true)
            {
                var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + syaer + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
                DataTable tb = new DataTable();
                sda.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
                con.Close();
                cmd.Dispose();
            }
            else if (RadioButton2.Checked == true)
            {
                var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where Current_Session='" + syaer + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
                DataTable tb = new DataTable();
                sda.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
                con.Close();
                cmd.Dispose();
            }
        }
    }

    protected void ddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
 
       // animals.CssClass = "filter-multi-select";
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("--Select Subject--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + ddlsemester.SelectedValue.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        DropDownList1.DataSource = tb;

        DropDownList1.DataTextField = "Title";
        DropDownList1.DataValueField = "Course_Code";
        DropDownList1.DataBind();
        con.Close();
        cmd.Dispose();
            }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        FillGridView();
        //updaterow.Visible = false;
    }
    //protected void DropDownListSemester_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownListSubject.Items.Clear();
    //    DropDownListSubject.Items.Add("--Select Subject--");
    //    if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }
    //    con.Open();
    //    cmd.Connection = con;
    //    SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + DropDownListSemester.SelectedValue.ToString() + "'", con);
    //    DataTable tb = new DataTable();
    //    sda.Fill(tb);
    //    DropDownListSubject.DataSource = tb;
    //    DropDownListSubject.DataTextField = "Title";
    //    DropDownListSubject.DataValueField = "Course_Code";
    //    DropDownListSubject.DataBind();
    //    con.Close();
    //    cmd.Dispose();
    //}
    //protected void btnUpdate_Click(object sender, EventArgs e)
    //{
    //    if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }
    //    con.Open();
    //    cmd.Connection = con;
    //    cmd.CommandText = "select Class_Time,Prof_Num,Course_Code,Semester,Current_Session from Class where  (Class_Time='" + textboxtime.Text + "' and  Current_Session='" + textboxyear.Text + "' and Semester='" + DropDownListSemester.SelectedValue.ToString() + "') or (Class_Time='" + textboxtime.Text + "' and  Current_Session='" + textboxyear.Text + "' and Prof_Num='" + DropDownListProfessor.SelectedValue.ToString() + "')";
    //    SqlDataReader dr = cmd.ExecuteReader();
    //    if (dr.HasRows == true)
    //    {

    //        updatealert.Visible = true;
    //        lbupdate.Text = "Sorry this Professor or that Semester is already hava a Class. First change it";
    //        lbupdate.ForeColor = Color.Red;
    //        if (con.State == ConnectionState.Open)
    //        {
    //            con.Close();
    //        }
    //        con.Open();
    //        cmd.Connection = con;
    //        SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where (Class_Time='" + textboxtime.Text + "' and Current_Session='" + textboxyear.Text + "' and Semester='" + DropDownListSemester.SelectedValue.ToString() + "') or (Class_Time='" + textboxtime.Text + "' and  Current_Session='" + textboxyear.Text + "' and Name='" + DropDownListProfessor.SelectedItem.Text + "') ", con);
    //        DataTable tb = new DataTable();
    //        sda.Fill(tb);
    //        GridView1.DataSource = tb;
    //        GridView1.DataBind();
    //        con.Close();
    //        cmd.Dispose();
    //    }
    //    else
    //    {
    //        cmd.CommandText = "Update Class set  Class_Time='" + textboxtime.Text + "', Prof_Num='" + DropDownListProfessor.SelectedValue.ToString() + "', Semester='" + DropDownListSemester.SelectedValue.ToString() + "', Current_Session='" + textboxyear.Text + "' where Class_Code='" + ClassID.Text + "'  ";
    //        dr.Close();
    //        int n = cmd.ExecuteNonQuery();
    //        if (n > 0)
    //        {
    //            // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Updated', 'success');", true);
    //            updatealert.Visible = true;
    //            lbupdate.Text = "Congrats! Class is Successfuly Update.";
    //            lbupdate.ForeColor = Color.Green;
    //            FillGridView();
    //        }
    //        else
    //        {
    //            ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Oooop!', 'Data is Not Updated. Plz try again.', 'warning');", true);
    //        }
    //    }
    //    con.Close();
    //    cmd.Dispose();
    //}
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        Label6.Text = "Defualt Searching now";
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        Label6.Text = "Custom Searching now";
    }
    protected void btnclose_Click(object sender, EventArgs e)
    {
        // updaterow.Visible = false;
        rbtnOnlyTime.Checked = false;
        rbtnOnlyTeacher.Checked = false;
      //  ddlupdateDept.Items.Clear();
      //  ddlupdateDept.Text="--Select Department--";
       // ddlupdateProfessor.Items.Clear();
      //  ddlupdateProfessor.Text="--Select Professor--";
        //ddlupdateSemeter.Items.Clear();
       // ddlupdateSemeter.Text="--Select Semester--";
       // ddlupdatesubjects.Items.Clear();
       // ddlupdatesubjects.Text="--Select Subject--";
        MultiView1.ActiveViewIndex = 0;
        
    }




    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Prof_Num"
        ddlprofessor.Items.Clear();
        ddlprofessor.Items.Add("--Select Professor--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("SELECT [Prof_Num], [Name] FROM [Professor]  where Dept_Name='" + DropDownList2.SelectedValue.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
      ddlprofessor.DataSource = tb;
        ddlprofessor.DataTextField = "Name";
        ddlprofessor.DataValueField = "Prof_Num";

        ddlprofessor.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        //1st check for existing data 
        //if not then add new class
        //after successfuly add class also add their class timing.
        //////////////////////////////////////////////
        string day;

        var strarray = TextBox1.Text.Split(',');
        foreach (string n in strarray)
        {
            day = n;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select Day,Hour,Prof_Num,Course_Code,Semester,Current_Session from ClassView where  (Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "') or ( Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "')";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                // errorlabel.Text = "Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time";
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time')", true);          
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "') or ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Name='" + ddlprofessor.SelectedItem.Text + "') ", con);
                DataTable tb = new DataTable();
                sda.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
                con.Close();
                cmd.Dispose();
            }//end  has.row if
            else
            {
                /// first check for class existing only without time only class 
                dr.Close();
                SelectExistingClassID("select Class_Code from ClassView where  (Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "') or ( Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "')");
                cmd.CommandText = "select Prof_Num,Course_Code,Semester,Current_Session from Class where   Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and  Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "'";
                SqlDataReader drs = cmd.ExecuteReader();
                if (drs.HasRows == true)//checking for existin of class only if 
                {
                    cmd.CommandText = "select Class_Code,Day,Hour from Time where   Class_Code='" + classid + "' and Day='" + day + "' and  Hour='" +txtclstime.Text + "'";
                    SqlDataReader classtime = cmd.ExecuteReader();
                    if (classtime.HasRows == true)//checking for class timing existing if not then add in else body
                    {
                    }
                    else
                    {
                      //  SelectExistingClassID("select Class_Code from Class where Class_Code = '" + classid + "' and Day = '" + day + "' and  Hour = '" +txtclstime.Text + "'");
                        cmd.CommandText = "INSERT into Time Values('" + Existingclassid + "','" + day + "','" + txtclstime.Text + "')";
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                       
                    }
                }
                else
                { 
                    ///if class is not exist first add a class only then add a time 
                    dr.Close();
                cmd.CommandText = "INSERT into Class Values('" + ddlprofessor.SelectedValue.ToString() + "','" + DropDownList1.SelectedValue.ToString() + "','" + ddlsemester.SelectedValue.ToString() + "','" + txtsemesteryear.Text + "')";
                cmd.CommandType = CommandType.Text;
                int v = cmd.ExecuteNonQuery();
                    if (v > 0)
                    {
                        SelectClassID();
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        con.Open();
                        string str;

                        var array = TextBox1.Text.Split(',');
                        foreach (string d in array)
                        {
                            str = d;
                            var a = classid;
                            cmd.CommandText = "INSERT into Time Values('" + classid + "','" + day + "','" + txtclstime.Text + "')";
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }//end foreach loop
                        con.Close();
                        cmd.Dispose();
                        dr.Close();
                        dr.Dispose();
                        // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);
                        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is Successfully Saved')", true);
                        FillGridView();
                    }
                }
              
            }


            con.Close();
            cmd.Dispose();
            dr.Close();
            dr.Dispose();

        }//foreach
       

        

        ///////////////////////////////////////
    
    }//end button

    public string classid = null;
    public string Existingclassid = null;
    public void SelectClassID()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }    
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select max(Class_Code) as Class_Code from Class";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                classid = dr["Class_Code"].ToString();              
            }
        }
        con.Close();
        cmd.Dispose();
        dr.Close();
    }//end of selectclassID method

    public void SelectExistingClassID(string q)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = q;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            if (dr.Read())
            {
                Existingclassid = dr["Class_Code"].ToString();
            }
        }
        con.Close();
        cmd.Dispose();
        dr.Close();
    }//end of selectclassID method

    protected void Button2_Click(object sender, EventArgs e)
    {
        //testing button
        string day;

        var strarray = TextBox1.Text.Split(',');
        foreach (string n in strarray)
        {
            day = n;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select Day,Hour,Prof_Num,Course_Code,Semester,Current_Session from ClassView where  (Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and Dept_Name='"+ Session["Dept"].ToString() +"'   ) or ( Day='" + day + "' and Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "')";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                // errorlabel.Text = "Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time";
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Time Conflict! Or the Professor is taking other Class at this time or this Semester has other Class at this time')", true);
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter("select * from ClassView where ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "') or ( Hour='" + txtclstime.Text + "' and  Current_Session='" + txtsemesteryear.Text + "' and Name='" + ddlprofessor.SelectedItem.Text + "') ", con);
                DataTable tb = new DataTable();
                sda.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
                con.Close();
                cmd.Dispose();
            }//end  has.row if
            else
            {
                
                dr.Close();
                /// first check for class existing only without time only class 
                bool val = CheckingOnlyClass();
                if (val==true)
                {
                    //if class is add then check time and add
                    SelectExistingClassID("select Class_Code from Class where  Course_Code='"+DropDownList1.SelectedValue.ToString()+"' and Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "'");
                    if(Existingclassid!=null)
                    {
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandText = "INSERT into Time Values('" + Existingclassid + "','" + day + "','" + txtclstime.Text + "')";
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                        con.Close();
                        cmd.Dispose();
                    }

                }
                else
                {
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT into Class Values('" + ddlprofessor.SelectedValue.ToString() + "','" + DropDownList1.SelectedValue.ToString() + "','" + ddlsemester.SelectedValue.ToString() + "','" + txtsemesteryear.Text + "','" + Session["Dept"].ToString() + "')";
                    cmd.CommandType = CommandType.Text;
                    int v = cmd.ExecuteNonQuery();
                    if (v > 0)
                    {
                        SelectClassID();
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                        con.Open();
                        string str;

                        var array = TextBox1.Text.Split(',');
                        foreach (string d in array)
                        {
                            str = d;
                            //var a = classid;
                            cmd.CommandText = "INSERT into Time Values('" + classid + "','" + str + "','" + txtclstime.Text + "')";
                            cmd.CommandType = CommandType.Text;
                            cmd.ExecuteNonQuery();
                        }//end foreach loop
                        con.Close();
                        cmd.Dispose();
                        dr.Close();
                        dr.Dispose();
                        // ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);
                        ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Data is Successfully Saved')", true);
                        FillGridView();
                    }

                }         
            }


            con.Close();
            cmd.Dispose();
            dr.Close();
            dr.Dispose();

        }//foreach

      



    }//end of testing button

    private bool CheckingOnlyClass()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select Prof_Num,Course_Code,Semester,Current_Session from Class where   Current_Session='" + txtsemesteryear.Text + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and  Prof_Num='" + ddlprofessor.SelectedValue.ToString() + "' and Course_Code='" + DropDownList1.SelectedValue.ToString()+ "'";
        SqlDataReader drs = cmd.ExecuteReader();
        if (drs.HasRows == true)//checking for existin of class only if 
        {
            return true;
        }
        else
        {
            return false;
        }
        con.Close();
        cmd.Dispose();
        drs.Close();

       // return true;
    }
    //private bool CheckingClassTime()
    //{
    //    if (con.State == ConnectionState.Open)
    //    {
    //        con.Close();
    //    }
    //    con.Open();
    //    cmd.Connection = con;
    //    cmd.CommandText = "select Class_Code,Day,Hour from Time where   Class_Code='" + classid + "' and Day='" + day + "' and  Hour='" + txtclstime.Text + "'";
    //    SqlDataReader drs = cmd.ExecuteReader();
    //    if (drs.HasRows == true)//checking for existin of class only if 
    //    {
    //        return true;
    //    }
    //    else
    //    {
    //        return false;
    //    }
    //    con.Close();
    //    cmd.Dispose();
    //    drs.Close();

    //    // return true;
    //}




    protected void ddlupdateDept_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlupdateProfessor.Items.Clear();
        ddlupdateProfessor.Items.Add("--Select Professor--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("SELECT [Prof_Num], [Name] FROM [Professor]  where Dept_Name='" + ddlupdateDept.SelectedValue.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlupdateProfessor.DataSource = tb;
        ddlupdateProfessor.DataTextField = "Name";
        ddlupdateProfessor.DataValueField = "Prof_Num";
        ddlupdateProfessor.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void ddlupdateSemeter_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlupdatesubjects.Items.Clear();
        ddlupdatesubjects.Items.Add("--Select Subject--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + ddlupdateSemeter.SelectedValue.ToString() + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlupdatesubjects.DataSource = tb;
        ddlupdatesubjects.DataTextField = "Title";
        ddlupdatesubjects.DataValueField = "Course_Code";
        ddlupdatesubjects.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void rbtnOnlyTime_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void rbtnOnlyTeacher_CheckedChanged(object sender, EventArgs e)
    {
        
    }

    protected void btnUpdateClass_Click(object sender, EventArgs e)
    {
        if (rbtnOnlyTeacher.Checked == true )
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Teacher Only.')", true);

          

        }
        else if (rbtnOnlyTime.Checked == true)
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Time Only.')", true);

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Please Select one Option for updating.')", true);

        }
    }

    public void getprofessor()
    {
        sddlprofessor.Items.Clear();
        sddlprofessor.Items.Add("--Select Professor--");

        //DropDownList1.Items.Clear();
        //DropDownList1.Items.Add("--Select Course Schema--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("SELECT [Prof_Num], [Name] FROM Professor where Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        sddlprofessor.DataSource = tb;

        sddlprofessor.DataTextField = "Name";
        sddlprofessor.DataValueField = "Prof_Num";
        sddlprofessor.DataBind();

     
        con.Close();
        cmd.Dispose();

    }
}//end of class 