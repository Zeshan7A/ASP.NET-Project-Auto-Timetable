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


public partial class UpdateAttandance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected string ClassCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        //selectSemester();
        Calendar1.EndDate = DateTime.Now;
        lblcurrentsession.Text = Session["currentsession"].ToString();
        lbllecturer.Text = Session["Prof_Name"].ToString();
    }//end of pageload

    private void selectSemester()
    {

        string name;
        name = Session["Prof_Name"].ToString();
       
        lbllecturer.Text = name;

        ddlsemester.Items.Clear();
        ddlsemester.Items.Add("--Select Semester--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        // SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + ddlsemester.SelectedValue.ToString() + "'", con); 
        SqlDataAdapter sda = new SqlDataAdapter("select DISTINCT Semester from View_2 where Name='" + name + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlsemester.DataSource = tb;
        //ClassCode = "Class_Code";
        //Label1.Text = "Class_Code";
        ddlsemester.DataTextField = "Semester";
        ddlsemester.DataValueField = "Semester";
        ddlsemester.DataBind();
        con.Close();
        cmd.Dispose();

    }
    protected void ddlcurrentsession_SelectedIndexChanged(object sender, EventArgs e)
    {

       // selectSemester();

    }
    protected void ddlsession_SelectedIndexChanged(object sender, EventArgs e)
    {
        selectSemester();
    }
    protected void ddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        string name;
        name = Session["Prof_Name"].ToString();
        lbllecturer.Text = name;
        ddlsubject.Items.Clear();
        ddlsubject.Items.Add("--Select Subject--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        // SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + ddlsemester.SelectedValue.ToString() + "'", con); 
        SqlDataAdapter sda = new SqlDataAdapter("select Class_Code,Course_Code,Title from View_2 where Name='" + name + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        ddlsubject.DataSource = tb;
        //ClassCode = "Class_Code";
        //Label1.Text = "Class_Code";
        ddlsubject.DataTextField = "Title";
        ddlsubject.DataValueField = "Class_Code";
        ddlsubject.DataBind();
        con.Close();
        cmd.Dispose();


        //cmd.CommandText = "select Class_Code,Course_Code,Title from View_2 where Name='" + name + "' and Semester='" + ddlsemester.SelectedValue.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "'";
        //cmd.CommandType = CommandType.Text;
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.HasRows == true)
        //{
        //    if (dr.Read())
        //    {
        //        ClassCode = dr["Class_Code"].ToString();
        //        ddlsubject.DataValueField = dr["Course_Code"].ToString();
        //        ddlsubject.DataTextField = dr["Title"].ToString();

        //    }
        //}

    }
    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        ////if( txtdate.Text!="" )
        ////{
        //Label1.Text = ddlsubject.SelectedValue.ToString();
        //string dept = "Computer Science";

        //if (con.State == ConnectionState.Open)
        //{
        //    con.Close();
        //}
        //con.Open();
        //cmd.Connection = con;
        //SqlDataAdapter sda = new SqlDataAdapter("select Std_RegNo,Name,RollNo,Session from Student where Dept_Name='" + dept + "'and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "' ORDER BY RollNo ASC", con);
        //DataTable tb = new DataTable();
        ////if (tb.DataSet == null)
        ////{
        ////    lblsession.Text = "Select Correct Session";
        ////}
        ////else
        ////{
        //    lblsession.Visible = false;
        //    sda.Fill(tb);
        //    GridView1.DataSource = tb;
        //    GridView1.DataBind();      
        //con.Close();
        //cmd.Dispose();
        //}


    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblesubject = (Label)e.Row.FindControl("lblesubject");
            // DateTime PassportExpDateDate = DateTime.Parse(lblPassportExpDate.Text);
            lblesubject.Text = ddlsubject.SelectedItem.ToString();

            DropDownList ddlstatus = (e.Row.FindControl("ddlStatus") as DropDownList);
            string country = (e.Row.FindControl("lblstatus") as Label).Text;
            ddlstatus.Items.FindByValue(country).Selected = true;

        }
    }//end rowdatabound
    protected void btnsubmitAttandance_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
                foreach (GridViewRow g1 in GridView1.Rows)
                {                   
                    string Status = (g1.FindControl("ddlStatus") as DropDownList).SelectedItem.ToString();
                    HiddenField enrollid = g1.FindControl("enrollid") as HiddenField;
                    cmd.CommandText = "Update Enroll set Status='" + Status + "' where enrolid='" + enrollid.Value + "'";
                    cmd.ExecuteNonQuery();

                }
                ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('full class Attandance is successfuly Update')", true);
                cmd.Dispose();
                con.Close();      
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "editt")
        {
            //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Edit record.')", true);

            GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int rowindex = rowSelect.RowIndex;          
            GridViewRow row = GridView1.Rows[rowindex];
            DropDownList ddlstatus = (row.FindControl("ddlStatus") as DropDownList);
            HiddenField enrollid= row.FindControl("enrollid") as HiddenField;
            
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "Update Enroll set Status='"+ddlstatus.SelectedItem.ToString()+"' where enrolid='"+enrollid.Value+"'";
          int v=Convert.ToInt32(cmd.ExecuteNonQuery());
          if (v > 0)
          {
              SelectAttandance("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'");
              string message = "alert('Record is Update')";
              ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
          }
          else 
          {
          
          }
            con.Close();
            cmd.Dispose();

        }
        else if (e.CommandName == "dlt")
        {
            GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int rowindex = rowSelect.RowIndex;
            GridViewRow row = GridView1.Rows[rowindex];
            DropDownList ddlstatus = (row.FindControl("ddlStatus") as DropDownList);
            HiddenField enrollid = row.FindControl("enrollid") as HiddenField;
            //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "ClientScript", "alert('Delete record.')", true);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "Delete from Enroll where enrolid='" + enrollid.Value + "'";
            int v = Convert.ToInt32(cmd.ExecuteNonQuery());
            if (v > 0)
            {
                SelectAttandance("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'");
                //SqlDataAdapter sda = new SqlDataAdapter("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'", con);
                //DataTable tb = new DataTable();
                //lblsession.Visible = false;
                //sda.Fill(tb);
                //GridView1.DataSource = tb;
                //GridView1.DataBind();
                //UpdatePanel1.Update();
                string message = "alert('Record is Deleted')";
                ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            }
            else
            {

            }
            con.Close();
            cmd.Dispose();

        }
    }//end rowcommand

  

    protected void btnshow_Click(object sender, EventArgs e)
    {
        Label1.Text = ddlsubject.SelectedValue.ToString();
        
        // string dept = "Computer Science";
        //if (con.State == ConnectionState.Open)
        //{
        //    con.Close();
        //}
        //con.Open();
        //cmd.Connection = con;
        //SqlDataAdapter sda = new SqlDataAdapter("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'", con);
        //DataTable tb = new DataTable();
        //lblsession.Visible = false;
        //sda.Fill(tb);
        //GridView1.DataSource = tb;
        //GridView1.DataBind();
        //con.Close();
        //cmd.Dispose();
        SelectAttandance("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'");
        grdviewrow.Visible = true;
    }

   public void SelectAttandance(string q)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(q, con);
        DataTable tb = new DataTable();
        lblsession.Visible = false;
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
    }
   protected void txtdate_TextChanged(object sender, EventArgs e)
   {
       SelectAttandance("select * from AttendanceView where Title='" + ddlsubject.SelectedItem.ToString() + "' and Current_Session='" + ddlcurrentsession.SelectedItem.ToString() + "' and EnrollDate='" + txtdate.Text + "' and  Session='" + ddlsession.SelectedValue.ToString() + "' and  Semester='" + ddlsemester.SelectedValue.ToString() + "'");
       grdviewrow.Visible = true;
   }
}//end of class