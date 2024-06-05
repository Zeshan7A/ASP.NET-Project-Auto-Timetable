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

public partial class DeleteUpdateFaculty : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            FillGridView();
             DropDownList1.Items.Add(Session["Dept"].ToString());
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
        SqlDataAdapter sda = new SqlDataAdapter("select Prof_Num,Name,Designation,Address,ContactNo,UserName,Password,Dept_Name from Professor where Dept_Name='"+ Session["Dept"].ToString()+"'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();



    }//end of FillRepeater function 

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
            cmd.CommandText = "select * from Professor Where Prof_Num='" + prdd + "'";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true)
            {
                if (dr.Read())
                {
                    TextBox1.Text = dr["Prof_Num"].ToString();
                    TextBox2.Text = dr["Name"].ToString();
                    TextBox3.Text = dr["Designation"].ToString();
                    TextBox7.Text = dr["Address"].ToString();
                    TextBox6.Text = dr["ContactNo"].ToString();
                    TextBox4.Text = dr["UserName"].ToString();
                    TextBox5.Text = dr["Password"].ToString();
                    DropDownList2.SelectedItem.Text = dr["Dept_Name"].ToString();
              
                }
            }
            ColoringTextboxes();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Pop", "$('#mymodal').modal('show');", true);


        }//end if

    }//end rowcommand

    private void ColoringTextboxes()
    {
        TextBox1.BorderColor = Color.Gray;
        TextBox2.BorderColor = Color.Gray;
        TextBox3.BorderColor = Color.Gray;
        TextBox4.BorderColor = Color.Gray;
        TextBox5.BorderColor = Color.Gray;
        TextBox6.BorderColor = Color.Gray;
        TextBox7.BorderColor = Color.Gray;
        DropDownList2.BorderColor = Color.Gray;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label id = GridView1.Rows[e.RowIndex].FindControl("ProfNum") as Label;

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "delete from Professor where Prof_Num=@ProfNum";
        cmd.Parameters.AddWithValue("@ProfNum", id.Text);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        FillGridView();
        con.Close();
        cmd.Dispose();




    }
 
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "Update Professor set Name='" + TextBox2.Text + "', Designation='" + TextBox3.Text + "',Address='" + TextBox7.Text + "',ContactNo='" + TextBox6.Text + "', UserName='" + TextBox4.Text + "', Password='" + TextBox5.Text + "', Dept_Name='" + DropDownList2.SelectedItem.ToString() + "' where Prof_Num='" + TextBox1.Text + "'  ";
            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Congratulations!', 'Data is Successfully Saved', 'success');", true);
                FillGridView();
            }
            con.Close();
            cmd.Dispose();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('body').removeClass('modal-open');$('.modal-backdrop').remove();", true);


    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Prof_Num,Name,Designation,Address,ContactNo,UserName,Password,Dept_Name from Professor where Dept_Name='" + DropDownList1.SelectedItem.ToString() + "' and Name='" + DropDownList3.SelectedItem.ToString() + "' ", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        cmd.Dispose();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        FillGridView();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        DropDownList3.Items.Add("--Select Lecturer--");
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter("select Name from Professor where Dept_Name='" + DropDownList1.SelectedValue.ToString() + "'", con);
        DataTable tb = new DataTable();
        sda.Fill(tb);
        DropDownList3.DataSource = tb;
        DropDownList3.DataTextField = "Name";
        DropDownList3.DataValueField = "Name";
        DropDownList3.DataBind();
        con.Close();
        cmd.Dispose();
    }
}//end of class