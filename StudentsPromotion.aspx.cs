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

public partial class StudentsPromotion : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    public static string s1,s2,s3,s4;


    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        { 
        SelectCurrentSemester();
        }

    }//end of page load

    private void SelectCurrentSemester()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "SELECT DISTINCT Semester FROM Student";
        //  SqlDataAdapter sda = new SqlCommand("select * from Lecturer", con);
        SqlDataReader sdr = cmd.ExecuteReader();
        rptrCurrentSemstr.DataSource = sdr;
        rptrCurrentSemstr.DataBind();

      

        con.Close();
        cmd.Dispose();
    }

    protected void rptrCurrentSemstr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
        {
            Label lbl = e.Item.FindControl("lbleCurrentSemesters") as Label;
           // Button btn = e.Item.FindControl("btnAssignApproved") as Button;
            DropDownList ddl1 = e.Item.FindControl("DropDownList1") as DropDownList;
            //DropDownList ddl2 = e.Item.FindControl("DropDownList2") as DropDownList;
            //DropDownList ddl3 = e.Item.FindControl("DropDownList3") as DropDownList;
            //DropDownList ddl4 = e.Item.FindControl("DropDownList4") as DropDownList;
            //if (lbl.Text == "1st Semester" || lbl.Text == "3rd Semester" || lbl.Text == "5th Semester" || lbl.Text == "7th Semester")
            //{
            //    DropDownList1.Items.Add("2nd Semester");
            //    DropDownList2.Items.Add("4th Semester");
            //    DropDownList3.Items.Add("6th Semester");
            //    DropDownList4.Items.Add("8th Semester");
            //    //  DropDownList1.Items.Add(new ListItem("3rd Semester"));
            //}         


            /////////////////
            if (lbl.Text == "2nd Semester")
            {
                DropDownList1.Items.Add("3rd Semester");
                s1 = lbl.Text;
            }
            else if(lbl.Text == "4th Semester")
            {
                DropDownList2.Items.Add("5th Semester");
                s2 = lbl.Text;
            }
            else if (lbl.Text == "6th Semester")
            {
                DropDownList3.Items.Add("7th Semester");
                s3 = lbl.Text;
            }
            else if (lbl.Text == "8th Semester")
            {
                DropDownList4.Items.Add("Complete");
                s4 = lbl.Text;
            }


            if (lbl.Text == "1st Semester")
            {
                DropDownList1.Items.Add("2nd Semester");
                s1 = lbl.Text;
            }
            else if (lbl.Text == "3rd Semester")
            {
                DropDownList2.Items.Add("4th Semester");
                s2 = lbl.Text;
            }
            else if (lbl.Text == "5th Semester")
            {
                DropDownList3.Items.Add("6th Semester");
                s3 = lbl.Text;
            }
            else if (lbl.Text == "7th Semester")
            {
                DropDownList4.Items.Add("8th Semester");
                s4 = lbl.Text;
            }
            else if (lbl.Text == "Complete")
            {
                //DropDownList4.Items.Add("8th Semester");
                //s4 = lbl.Text;
                lbl.Visible = false;
            }

        }   
     }//end item data bount 


    protected void btnAdd_Click(object sender, EventArgs e)
    {

        if (DropDownList1.Text != "--Select Semester--" && DropDownList2.Text != "--Select Semester--" && DropDownList2.Text != "--Select Semester--" && DropDownList3.Text != "--Select Semester--" && DropDownList4.Text != "--Select Semester--")
        {     
        foreach (RepeaterItem item in rptrCurrentSemstr.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.Open();
                cmd.Connection = con;
                var itemss = (Label)item.FindControl("lbleCurrentSemesters");
                if(itemss.Text=="2nd Semester")
                {
                    cmd.CommandText = "update Student set Semester='" + DropDownList1.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "4th Semester")
                {
                   cmd.CommandText = "update Student set Semester='" + DropDownList2.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "6th Semester")
                {
                    cmd.CommandText = "update Student set Semester='" + DropDownList3.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "8th Semester")
                {
                    
                    cmd.CommandText = "update Student set Semester='" + DropDownList4.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else  if (itemss.Text == "1st Semester")
                {
                    cmd.CommandText = "update Student set Semester='" + DropDownList1.SelectedItem + "' where semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "3rd Semester")
                {
                    cmd.CommandText = "update Student set Semester='" + DropDownList2.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "5th Semester")
                {
                    cmd.CommandText = "update Student set Semester='" + DropDownList3.SelectedItem + "' where Semester='" + itemss.Text + "'";
                }
                else if (itemss.Text == "7th Semester")
                {

                    cmd.CommandText = "update Student set Semester='" + DropDownList4.SelectedItem + "' where Semester='" + itemss.Text + "'";


                }
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "SweetAlert", "swal('Congratulations!', 'All Semester is Successfully Promoted to Next Semesters.', 'success');", true);
        }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "SweetAlert", "swal('Ooops!', 'Please select the next Semesters.', 'error');", true);
        }


    }
}//end of class