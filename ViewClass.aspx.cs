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

public partial class ViewClass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {      
        if (!string.IsNullOrEmpty(Session["Prof_Name"] as string))
        {
            SelectClasses();
            lbllecturer.Text = Session["Prof_Name"].ToString();
            lblcurrentsession.Text = Session["currentsession"].ToString();
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
    }

    private void SelectClasses()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;   
        SqlDataAdapter sda = new SqlDataAdapter("select Distinct Class_Code,Title,Semester,Dept_Name from ClassView where Name='" + Session["Prof_Name"].ToString() + "' and Current_Session='" + Session["currentsession"].ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        rptrclass.DataSource = tb;
        rptrclass.DataBind();
        con.Close();
        cmd.Dispose();
    }



    protected void rptrclass_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            // string sem = (e.Item.FindControl("lblSemester") as Label).Text;
            Label lblday= e.Item.FindControl("lblday") as Label;
           // Label lblhour = e.Item.FindControl("lblhour") as Label;
            HiddenField code = e.Item.FindControl("hfclasscode") as HiddenField;
            Repeater rptCourse = e.Item.FindControl("innerRepeater") as Repeater;
            string val = null;
            string time = null;
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select Class_Code, Day,Hour from ClassView where Class_Code='" + code.Value + "'  ", con);
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
            lblday.Text = val;
            //lblhour.Text = time;
            // if (con.State == ConnectionState.Open)
            // {
            //     con.Close();
            // }
            // con.Open();
            // cmd.Connection = con;
            // SqlDataAdapter sda = new SqlDataAdapter("select Distinct Class_Code,Title,Name from ClassView  where Semester='" + sem + "'", con);
            // DataTable tb = new DataTable();
            // sda.Fill(tb);
            // rptCourse.DataSource = tb;
            // rptCourse.DataBind();
            // con.Close();
            // cmd.Dispose();



        }


    }
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
            //val += " " + " | " + time;
        }
        //con.Close();
        //cmd.Dispose();
        // dr.Close();
        return val;
    }

    //protected void innerRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {

    //        Label daytime = e.Item.FindControl("lbccode") as Label;
    //        var time = selecttime(daytime.Text);
    //        Label day = e.Item.FindControl("lblday") as Label;
    //        day.Text = time.ToString();


    //    }
    //}
}