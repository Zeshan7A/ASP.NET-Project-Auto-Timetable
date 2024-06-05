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

public partial class StudentHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            SelectCheckedPaperMrks();

        }

    }

    protected void btnViewCourse_Click(object sender, EventArgs e)
    {
        SelectCheckedPaperMrks();
    }

    private void SelectCheckedPaperMrks()
    {
        string stdname = "Arif Ullah Khan";
            //Session["StdName"].ToString();

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select distinct semester from MidmarksView where Name='" + stdname + "' group by Semester", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        RepeaterSemester.DataSource = tb;
        RepeaterSemester.DataBind();
        con.Close();
        cmd.Dispose();
    }

    protected void RepeaterSemester_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        decimal QP, sumofQP;
        int CH, SumofCH;
        decimal gpch;
        QP = 0;
        sumofQP = 0;
        SumofCH = 0;
        // string stdname = Session["StdName"].ToString();
        string stdname = "Arif Ullah Khan";
        //Session["StdName"].ToString();
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string sem = (e.Item.FindControl("lblSemester") as Label).Text;
            Repeater rptCourse = e.Item.FindControl("RepeaterCourse") as Repeater;
            //Label lblgpa = e.Item.FindControl("lblGPA") as Label;
            //rptOrders.DataSource = GetData(string.Format("SELECT TOP 3 * FROM Orders WHERE CustomerId='{0}'", customerId));
            //rptOrders.DataBind();
            SqlDataAdapter sda = new SqlDataAdapter("select * from MidmarksView where semester='" + sem + "' and Name='" + stdname + "' ", con);
             SqlCommand cmd = new SqlCommand("select * from MidmarksView where semester='" + sem + "' and Name='" + stdname + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();

            
            while (dr.Read())
            {
              
                gpch = Convert.ToDecimal(dr["GPCH"]);
                CH = Convert.ToInt32(dr["Credit_Hour"]);
                sumofQP += gpch;
                SumofCH += CH;
                
            }

            //if ( e.Item.ItemType == ListItemType.Item ||   e.Item.ItemType == ListItemType.AlternatingItem)
            //{       
            string GPA;            
                GPA = (sumofQP / SumofCH).ToString();
            // lbl.Text = GPA;
            //lblgpa.Text = GPA ;
            lblGPA.Text = GPA;
            // string GPA;
            //Label lbl=  e.Item.FindControl("lblGPA") as Label;

            // GPA = (sumofQP / SumofCH).ToString();
            // lbl.Text = GPA;
            dr.Close();
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
        //    Label lblaccount = (Label)e.Item.FindControl("lblCredt_Hour");
        //    if (lblaccount != null)
        //    {
        //        totalCH += Convert.ToInt32(lblaccount.Text);
        //    }
        //}

        //if (e.Item.ItemType == ListItemType.Footer)
        //{
        //    Label lbltotalaccount = (Label)e.Item.FindControl("lbTotalCH");
        //    if (lbltotalaccount != null)
        //    {
        //        lbltotalaccount.Text = totalCH.ToString();
        //        totalCH = 0;
        //    }
        //}


    }


}