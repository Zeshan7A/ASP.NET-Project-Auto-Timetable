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


public partial class testpage2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["Dept"] as string))
            {
                getcoursSchema();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
    public void getcoursSchema()
    {
        DropDownList6.Items.Clear();
        DropDownList6.Items.Add("--Select Course Schema--");

        //DropDownList1.Items.Clear();
        //DropDownList1.Items.Add("--Select Course Schema--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Course_Schema from CourseSchema where Dept_Name='" + Session["Dept"].ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        DropDownList6.DataSource = tb;

        DropDownList6.DataTextField = "Course_Schema";
        DropDownList6.DataValueField = "Course_Schema";
        DropDownList6.DataBind();

        con.Close();
        cmd.Dispose();

        DropDownList5.Items.Add(Session["Dept"].ToString());

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
    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/testing.aspx");
    }
  
    protected void btnViewCourse_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select distinct Semester from Course group by Semester", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        RepeaterSemester.DataSource = tb;
        RepeaterSemester.DataBind();
        con.Close();
        cmd.Dispose();
    }
    protected void RepeaterSemester_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string sem = (e.Item.FindControl("lblSemester") as Label).Text;
            Repeater rptCourse = e.Item.FindControl("RepeaterCourse") as Repeater;
            //rptOrders.DataSource = GetData(string.Format("SELECT TOP 3 * FROM Orders WHERE CustomerId='{0}'", customerId));
            //rptOrders.DataBind();
            SqlDataAdapter sda = new SqlDataAdapter("select * from course where semester='"+sem+"' and Dept_Name='"+DropDownList5.SelectedItem.ToString()+"' and Course_Schema='"+DropDownList6.SelectedItem+"' ", con);
            DataTable tb = new DataTable();
            sda.Fill(tb);
            rptCourse.DataSource = tb;
            rptCourse.DataBind();
            //con.Close();
            //cmd.Dispose();
        }

    }
    int totalCH = 0;
    protected void RepeaterCourse_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    Label totalCreditHours = (Label)e.Item.FindControl("lbTotalCH");
        //    //Reference the Repeater Item.
        //    RepeaterItem item = e.Item;

        //    //Reference the Controls.
        //    int ch = Convert.ToInt32((item.FindControl("lblCredt_Hour") as Label).Text);
        //    totalCH += ch;
        //}
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblaccount = (Label)e.Item.FindControl("lblCredt_Hour");
            if (lblaccount != null)
            {
                totalCH += Convert.ToInt32(lblaccount.Text);
            }
        }

        if (e.Item.ItemType == ListItemType.Footer)
        {
            Label lbltotalaccount = (Label)e.Item.FindControl("lbTotalCH");
            if (lbltotalaccount != null)
            {
                lbltotalaccount.Text = totalCH.ToString();
                totalCH = 0;
            }
        }
      
       
    }
}