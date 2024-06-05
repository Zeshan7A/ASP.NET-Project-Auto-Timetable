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

public partial class test : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    //public string Testing { get { return "hello world!"; } }
    public string Testing2;
    public string name;
    public string title;
    public string ch;
 
    protected void Page_Load(object sender, EventArgs e)
    {
      
        //if (Page.IsPostBack != true)
        //{
            if (!string.IsNullOrEmpty(Session["Dept"] as string) )
            {
                selectcsession();

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        //}
    }
   
    protected void btnViewCourse_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select distinct Semester from ClassView group by Semester", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        RepeaterSemester.DataSource = tb;
        RepeaterSemester.DataBind();
        con.Close();
        cmd.Dispose();
    }

    int totalCH = 0;

    //outer repeater itemdatabound
    protected void RepeaterSemester_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            string sem = (e.Item.FindControl("lblSemester") as Label).Text;
            

            Label d = e.Item.FindControl("lbldeptment") as Label;

            d.Text += Session["Dept"].ToString();

             Label lbl = e.Item.FindControl("Label3") as Label;
            lbl.Text += Session["Dept"].ToString() +  " " + Session["cs"].ToString();
            Label name = e.Item.FindControl("lblName") as Label;
            Label code = e.Item.FindControl("lbccode") as Label;          
            Repeater rptCourse = e.Item.FindControl("RepeaterCourse") as Repeater;
          
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter("select Distinct Class_Code,Title,Name from ClassView  where Semester='" + sem + "' and Dept_Name='" + Session["Dept"].ToString() + "'", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);     
            rptCourse.DataSource = tb;
            rptCourse.DataBind();
            con.Close();
            cmd.Dispose();
           // cmds.Dispose();


        }
   

    }
    //inner repeater itemdatabound
    public string selecttime(string classcode)
    {
        string val = null;
        string time = null;
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        SqlCommand cmd = new SqlCommand("select Class_Code, Day,Hour from ClassView where Class_Code='" + classcode + "'  ", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            
            while (dr.Read())
            {
                val += dr["Day"].ToString() + " ";
                time = dr["Hour"].ToString();
            }
            val += " " + " | " + time;
        }
        //con.Close();
        //cmd.Dispose();
        // dr.Close();
        return val;
    }
    protected void RepeaterCourse_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Label daytime = e.Item.FindControl("lbccode") as Label;
     var time=selecttime(daytime.Text);
            Label day = e.Item.FindControl("lblday") as Label;
            day.Text = time.ToString();


        }

        }  
    protected void mddlsemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (!string.IsNullOrEmpty(Session["cs"] as string))
        //{
           

        //}
        //else
        //{
        //    selectcsession();
        //    // Response.Redirect("~/login.aspx");
        //}
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select distinct Semester from ClassView where Semester='"+mddlsemester.SelectedItem.Text.ToString()+ "' and Dept_Name='"+ Session["Dept"].ToString() +"' group by Semester", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        RepeaterSemester.DataSource = tb;
        RepeaterSemester.DataBind();
        con.Close();
        cmd.Dispose();
    }



    public void selectcsession()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT max(Class_Code),Current_Session from class GROUP BY Current_Session ", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {

            while (dr.Read())
            {
               Session["cs"]= dr["Current_Session"].ToString() + " ";              
            }

        }
        con.Close();
        cmd.Dispose();
        dr.Close();

    }
}//end of class