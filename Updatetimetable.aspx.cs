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


public partial class Updatetimetable : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
 public static   DataTable prof;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack != true)
        {
            SelectProfessor();
        }

    }//end of pageload

    private void SelectProfessor()
    {
        sddlprofessor.Items.Clear();
        sddlprofessor.Items.Add("--Select Professor--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from Professor", con);
        prof = new DataTable();
        sda.Fill(prof);
        var rwos = prof.Rows.Count;
        sddlprofessor.DataTextField = "Name";
        sddlprofessor.DataValueField = "Prof_Num";
        sddlprofessor.DataSource = prof;
        sddlprofessor.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void sddlprofessor_SelectedIndexChanged(object sender, EventArgs e)
    {
       
            //Label6.Text = "Defualt Searching now";
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where Name='" + sddlprofessor.SelectedItem.ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
            cmd.Dispose();     
    }

    protected void ddlSemesterYear_SelectedIndexChanged(object sender, EventArgs e)
    {
       // var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + ddlSemesterYear.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void txtsyear_TextChanged(object sender, EventArgs e)
    {
       // var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + ddlSemesterYear.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
    }
    protected void sddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
       // var syaer = (ddlSemesterYear.SelectedItem.ToString() + txtsyear.Text).ToString();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where Name='" + sddlprofessor.SelectedItem.ToString() + "' and Current_Session='" + ddlSemesterYear.SelectedItem.ToString() + "' and Semester='" + sddlsemester.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "slt")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

           // mddlsemester.Items.Clear();
            mddlsubject.Items.Clear();
            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];
            Label clascode = row.FindControl("classCode") as Label;
          //  mddlsubject.Items.Insert(0, clascode.Text);
            Label lbname = row.FindControl("lbname") as Label;

            Label lbtitle = row.FindControl("lbtitle") as Label;
            mddlsubject.Items.Insert(0,lbtitle.Text);
            //mddlsubject.DataTextField = lbtitle.Text;
            //HiddenField courscode = row.FindControl("courscode") as HiddenField;
            //mddlsubject.DataValueField = courscode.Value;
            Label lbsemester = row.FindControl("lbsemester") as Label;
           // mddlsemester.Items.Insert(0,lbsemester.Text);
            mddlsemester.Text = lbsemester.Text;

            Label lbtime = row.FindControl("lbtime") as Label;
            txttimem.Text = lbtime.Text;

            Label lbCurrentSession = row.FindControl("lbCurrentSession") as Label;
            txtyearm.Text = lbCurrentSession.Text;

            mddlProfessor.Items.Clear();
           mddlProfessor.Items.Insert(0, lbname.Text);
            //sddlprofessor.Items.Add("--Select Professor--");
            var rwos = prof.Rows.Count;        
            for (int i = 0; i<rwos; i++)
            {
                int x = 1;
                string prfname = prof.Rows[i]["Name"].ToString();
                if(lbname.Text!=prfname) 
                {
                    mddlProfessor.Items.Insert(x, prof.Rows[i]["Name"].ToString());
                    x++;
            }
              
            }

                // updaterow.Focus();
                //GridViewRow rowSelect = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                //int rowindex = rowSelect.RowIndex;
                // int index = Convert.ToInt32(e.CommandArgument);
                //GridViewRow row = GridView1.Rows[rowindex];

                //HiddenField prf = row.FindControl("pr") as HiddenField;
                //var prdd = prf.Value;

                //con.Open();
                //cmd.Connection = con;
                //cmd.CommandText = "select * from View_2 Where Class_Code='" + prdd + "'";
                //SqlDataReader dr = cmd.ExecuteReader();
                //if (dr.HasRows == true)
                //{
                //    if (dr.Read())
                //    {
                //       // ClassID.Text = dr["Class_Code"].ToString();                 
                //        mddlProfessor.SelectedItem.Text = dr["Name"].ToString();
                //        mddlsemester.SelectedItem.Text = dr["Semester"].ToString();
                //        mddlsubject.SelectedItem.Text = dr["Title"].ToString();                   
                //        txttimem.Text = dr["Class_Time"].ToString();
                //        txtyearm.Text = dr["Current_Session"].ToString();
                //    }
                //}
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#exampleModal').modal('show');", true);


        }//end if

    }
    protected void sddlprofessor_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select * from View_2 where Name='" + sddlprofessor.SelectedItem.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();

    }

    protected void mddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {

        mddlsubject.Items.Clear();
        mddlsubject.Items.Add("--Select Subjects--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Course_Code,Title from Course where Semester='" + mddlsemester.SelectedItem.ToString() + "'", con);
        prof = new DataTable();
        sda.Fill(prof);
        var rwos = prof.Rows.Count;
        mddlsubject.DataTextField = "Title";
        mddlsubject.DataValueField = "Course_Code";
        mddlsubject.DataSource = prof;
        mddlsubject.DataBind();
        con.Close();
        cmd.Dispose();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Pop", "$('#exampleModal').modal('show');", true);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }
}//end of class