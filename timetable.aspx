<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Timetable.aspx.cs" Inherits="Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
    <style>
        .tab
        {
            border-collapse: collapse;
            line-height: 2rem;
            font-size: 1rem;
            text-align: center;
        }

        .borderless td, .borderless th
        {
            border: none;
        }

        input
        {
            font-size: 1rem;
            line-height: 1rem;
        }

        .input-lg
        {
            padding-right: 0 !important;
            padding-left: 0 !important;
        }

        .d
        {
            border-right: none !important;
        }

        .t
        {
            border-left: none !important;
            padding-left: 8px !important;
        }




        .checkbox-menu li label {
    display: inline;
    padding: 3px 10px;
    clear: both;
    font-weight: normal;
    line-height: 1.42857143;
    color: #333;
    white-space: nowrap;
    margin:0;
    transition: background-color .4s ease;
}
.checkbox-menu li input {
    margin: 0px 5px;
    top: 2px;
    position: relative;
}

.checkbox-menu li.active label {
    background-color: #cbcbff;
    font-weight:bold;
}

.checkbox-menu li label:hover,
.checkbox-menu li label:focus {
    background-color: #f5f5f5;
}

.checkbox-menu li.active label:hover,
.checkbox-menu li.active label:focus {
    background-color: #b8b8ff;
}


        /*.dropdown-menu
        {
            max-width:0px ! important;
        }*/

        .customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
      /*background: #e1ecf4;*/
}
            .customers td
            {
                font-size: 1rem;
            }
.customers td, .customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  /*background-color: #4CAF50;*/
  background-color:#28b779;
  color: white;
}


    </style>
    
    <link href="dist/css/Custom.css" rel="stylesheet" />   
     <%--<link href="dist/css/sumoselect.css" rel="stylesheet" />--%>
     <%--<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"   rel="stylesheet" type="text/css" />--%> 
    <%-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="dist/css/filter-multi-select-bundle.js"></script>
    <link href="dist/css/filter_multi_select.css" rel="stylesheet" />--%>
    <script type="text/javascript">
    function isDelete() {
        return confirm("Do you want to delete this row ?");
    }

          $(function () {  
              $('[id*=animals]').multiselect({  
                includeSelectAllOption: true  
            });  
          });
         function pageLoad() {
           <%--  $("#<% =animals.ClientID %>").addClass("filter-multi-select");--%>
             $(".check").change(function () {
                 var text = "";
                 $(".check:checked").each(function () {
                     text += text != "" ? "," : "";
                     if ($(this).prop("checked"))
                         text += $(this).val();
                 });
                 $(".text").val(text);
             });            

    }//page load function
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional"  runat="server">
          
        <ContentTemplate>

            <div class="container-fluid">

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card" style="margin-top: 20px;">
                                    <div class="container-fluid">

                                        <div class="card-body">
                                            <div class="border-bottom" style="margin-bottom: 2rem;">
                                                <h4 class="card-title text-center"><span style="color: #27a9e3;">Create time table</span></h4>
                                            </div>
                                            <div>
                                                <div class="alert alert-success" role="alert" id="alertmsg" runat="server" visible="false">
                                                    <button type="button" class="close" data-dismiss="alert" arialabel="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <asp:Label ID="errorlabel" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Department</label>
                                                    <asp:DropDownList ID="DropDownList2" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" DataSourceID="selectDept" DataTextField="Dept_Name" DataValueField="Dept_Name" AppendDataBoundItems="true">
                                                        <asp:ListItem>--Select Department--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="selectDept" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Professor</label>
                                                    <asp:DropDownList ID="ddlprofessor" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                                        <asp:ListItem>--Select Lecturer--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Prof_Num], [Name] FROM [Professor]"></asp:SqlDataSource>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Semester</label>
                                                    <asp:DropDownList ID="ddlsemester" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
                                                        <asp:ListItem>--Select Semester--</asp:ListItem>

                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label class="col-form-label">Subject</label>
                                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                                        <asp:ListItem>--Select Subject--</asp:ListItem>
                                                    </asp:DropDownList>

                                                </div>

                                                <div class="form-group col-md-6">
                                                    <%--  <label class="col-form-label">Class time</label>--%>
                                                    <label class="col-form-label">Days</label>
                                                    <input type="checkbox" id="m" class="check" value="Mon" />
                                                    <label for="m">Mon</label>
                                                    <input type="checkbox" id="T" class="check" value="Tue" />
                                                    <label for="T">Tue</label>
                                                    <input type="checkbox" id="W" class="check" value="Wed" />
                                                    <label for="W">Wed</label>
                                                    <input type="checkbox" class="check" value="Thu" />
                                                    <label for="T">Thu</label>
                                                    <input type="checkbox" id="F" class="check" value="Fri" />
                                                    <label for="F">Fri</label>
                                                    <input type="checkbox" id="S" class="check" value="Sat" />
                                                    <label for="S">Sat</label>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col">

                                                            <asp:TextBox ID="TextBox1" CssClass="text form-control" runat="server"></asp:TextBox>

                                                        </div>
                                                        <div class="col">
                                                            <asp:TextBox ID="txtclstime" CssClass="form-control" runat="server" placeholder="Class time"></asp:TextBox>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label class="col-form-label">Semester Year</label>
                                                    <asp:TextBox ID="txtsemesteryear" CssClass="form-control" runat="server" placeholder="Semester Year...Fall or Spring"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6">
                                                </div>

                                            </div>



                                            <div>

                                                <div class="modal-footer" style="margin-bottom: -102px;">
                                                    <div class="text-right">
                                                        <asp:Button ID="btnAdd" runat="server" Visible="false" CssClass="btn btn-success btn-lg" CausesValidation="true" Text="Submit" />
                                                        <asp:Button ID="Button1" runat="server" Visible="false" CssClass="btn btn-success btn-lg" CausesValidation="true" Text="Submit" />
                                                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-lg" CausesValidation="true" Text="Add Class" OnClick="Button2_Click" />

                                                        <br />
                                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                                        <br />

                                                    </div>
                                                </div>
                                            </div>

                                            <%-- </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- filter row -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="container-fluid">
                                        <div class="card-body">
                                            <div class="border-bottom" style="margin-bottom: 2rem;">
                                                <h4 class="card-title text-center"><span style="color: #27a9e3;">Filter Professor</span></h4>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <asp:RadioButton ID="RadioButton1" CssClass="btn" runat="server" Text="Defualt Search" Checked="true" GroupName="Search" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="true" />
                                                    <asp:RadioButton ID="RadioButton2" CssClass="btn" runat="server" Text="Custom Search" GroupName="Search" OnCheckedChanged="RadioButton2_CheckedChanged" AutoPostBack="true" />
                                                    <asp:Label ID="Label6" runat="server" Text="Defualt Searching now" ForeColor="Green"></asp:Label>
                                                </div>
                                            </div>
                                            <%--<div class="card">
                                <div class="card-body">--%>
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Professor</label>
                                                    <asp:DropDownList ID="sddlprofessor" CssClass="form-control" AutoPostBack="true" runat="server"  AppendDataBoundItems="true" OnSelectedIndexChanged="sddlprofessor_SelectedIndexChanged">
                                                        <asp:ListItem>--Select Lecturer--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Prof_Num], [Name] FROM [Professor]"></asp:SqlDataSource>--%>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Semester year</label>

                                                    <%--                                     <asp:TextBox ID="stxtsemesteryear" CssClass="form-control" runat="server" placeholder="Semester Year...Fall or Spring" AutoPostBack="true" OnTextChanged="stxtsemesteryear_TextChanged"></asp:TextBox>--%>
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-3 col-sm-6" style="padding-right: 0;">
                                                                <asp:DropDownList ID="ddlSemesterYear" class="form-control input-lg d" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSemesterYear_SelectedIndexChanged">
                                                                    <asp:ListItem>Spring-</asp:ListItem>
                                                                    <asp:ListItem>Fall-</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-9 col-sm-6" style="padding-left: 0;">
                                                                <asp:TextBox ID="txtsyear" CssClass="form-control input-lg t" placeholder="Year...i.e 2020" runat="server" AutoPostBack="true" OnTextChanged="txtsyear_TextChanged"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>


                                                <div class="form-group col-md-4">
                                                    <label class="col-form-label">Semester</label>
                                                    <asp:DropDownList ID="sddlsemester" CssClass="form-control" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource4" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" OnSelectedIndexChanged="sddlsemester_SelectedIndexChanged">
                                                        <asp:ListItem>--Select Semester--</asp:ListItem>

                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                                </div>

                                                <%-- </div>
                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--filter row-->

                        <!-- gridview -->
                        <div class="row">
                            <div class="col-md-12">
                                <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 10px 0px; margin-top: 1.3rem;">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed tab" AllowPaging="true" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" DataKeyNames="Class_Code" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="1" OnPageIndexChanging="GridView1_PageIndexChanging">
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />

                                        <Columns>
                                            <asp:TemplateField HeaderText="Class Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="classCode" Text='<%#Eval("Class_Code") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Professor">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbname" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Class">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbtitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label>
                                                     <asp:HiddenField ID="hfsubjectcode" runat="server" Value='<%# Eval("Course_Code") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CH">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbhour" Text='<%#Eval("Credit_Hour") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Class time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbtime" Text='<%#Eval("Day") %>' runat="server"></asp:Label>
                                                    <asp:Label ID="lblHour" Text=' <%#Eval("Hour") %> ' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Semester">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbsemester" Text='<%#Eval("Semester") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Semester_Year">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbcurrentsession" Text='<%#Eval("Current_Session") %>' runat="server"></asp:Label>
                                                    <asp:HiddenField ID="pr" runat="server" Value='<%# Eval("Class_Code") %>' />
                                                    <asp:HiddenField ID="profno" runat="server" Value='<%# Eval("Prof_Num") %>' />
                                                      <asp:HiddenField ID="hfDept" runat="server" Value='<%# Eval("Dept_Name") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Department">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldept" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton Visible="false" ID="btnedit" ImageUrl="~/assets/images/customimages/edit.png" runat="server" CommandName="select" ToolTip="Select Record" Width="30px" Height="30px" />
                                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/customimages/Delete.png" runat="server" OnClientClick="return isDelete();" CommandName="Delete" ToolTip="Delete Record" Width="30px" Height="30px" />
                                                    <%--<asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete" OnClientClick="return isDelete();"><i class="fa fa-trash fa-2x text-danger"></i></asp:LinkButton>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>

                                        <PagerSettings Mode="Numeric" Position="Bottom" PageButtonCount="10" />

                                        <PagerStyle BackColor="LightBlue" Height="30px" VerticalAlign="Bottom" Font-Size="X-Large" CssClass="GridPager" HorizontalAlign="Center" />

                                    </asp:GridView>

                                </div>
                                <div class="text-right">
                                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-primary" Text="Reset" OnClick="btnReset_Click" />
                                </div>

                            </div>
                        </div>





                    </asp:View>
                    <asp:View ID="View2" runat="server">

                        <!--update-->
                        <div class="alert alert-success"  >
                            <div class="row">
                                <div class="col-md-8">
                                    <strong>Update the Timetable or Close it  <span class="fa fa-hand-point-right"></span>.</strong>
                                </div>
                                <div class="col-md-4 text-right">
                                    <asp:Button ID="btnclose" runat="server" CssClass="btn btn-danger font-bold" Text="X" OnClick="btnclose_Click" />
                                </div>
                            </div>

                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="container-fluid">
                                    
                                            <div class="card-body">
                                                <div class="border-bottom" style="margin-bottom: 2rem;">
                                                    <h4 class="card-title text-center"><span style="color: #27a9e3;">Create time table</span></h4>
                                                </div>
                                                <div>
                                                    <div class="alert alert-success" role="alert" id="Div1" runat="server" visible="false">
                                                        <button type="button" class="close" data-dismiss="alert" arialabel="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                         <div class="col-md-12">
                                     <div class="">
                                         <asp:RadioButton ID="rbtnOnlyTeacher" AutoPostBack="true" GroupName="only" OnCheckedChanged="rbtnOnlyTeacher_CheckedChanged" Text="Only Teacher Update" runat="server" />
                                         <asp:RadioButton ID="rbtnOnlyTime" GroupName="only" AutoPostBack="true" OnCheckedChanged="rbtnOnlyTime_CheckedChanged"  Text="Only Time Update" runat="server" />
                                     </div>
                                     </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-4">
                                                        <label class="col-form-label">Department</label>
                                                        <asp:DropDownList ID="ddlupdateDept" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlupdateDept_SelectedIndexChanged" DataSourceID="selectDept" DataTextField="Dept_Name" DataValueField="Dept_Name" AppendDataBoundItems="true">
                                                            <asp:ListItem>--Select Department--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <small>Department:</small>
                                                        <asp:Label ID="lbldept" Font-Bold="true" ForeColor="Red" runat="server"></asp:Label>
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="col-form-label">Professor</label>
                                                        <asp:DropDownList ID="ddlupdateProfessor" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                                            <asp:ListItem>--Select Professor--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <small>Previous Lecturer:</small>
                                                        <asp:Label ID="lblProfessor" Font-Bold="true" ForeColor="Red" runat="server"></asp:Label>
                                                          <asp:Label ID="lblProfcode" Font-Bold="true" ForeColor="Red"  runat="server"></asp:Label>
                                                        <%--<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Prof_Num], [Name] FROM [Professor]"></asp:SqlDataSource>--%>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="col-form-label">Semester</label>
                                                        <asp:DropDownList ID="ddlupdateSemeter" CssClass="form-control" runat="server" DataSourceID="selectSemester" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlupdateSemeter_SelectedIndexChanged">
                                                            <asp:ListItem>--Select Semester--</asp:ListItem>

                                                        </asp:DropDownList>
                                                        <small>Previous Semester:</small>
                                                        <asp:Label ID="lblSemester" Font-Bold="true" ForeColor="Red" runat="server"></asp:Label>

                                                        <asp:SqlDataSource ID="selectSemester" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label class="col-form-label">Subject</label>
                                                        <asp:DropDownList ID="ddlupdatesubjects" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                                            <asp:ListItem>--Select Subject--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <small>Previous Subject:</small>
                                                        <asp:Label ID="lblSubject" Font-Bold="true" ForeColor="Red" runat="server"></asp:Label>
                                                         <asp:Label ID="lblSubjectCode" Font-Bold="true" ForeColor="Red" Visible="false" runat="server"></asp:Label>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <%--  <label class="col-form-label">Class time</label>--%>
                                                        <label class="col-form-label">Days</label>
                                                        <input type="checkbox" id="m" class="check" value="Mon" />
                                                        <label for="m">Mon</label>
                                                        <input type="checkbox" id="T" class="check" value="Tue" />
                                                        <label for="T">Tue</label>
                                                        <input type="checkbox" id="W" class="check" value="Wed" />
                                                        <label for="W">Wed</label>
                                                        <input type="checkbox" class="check" value="Thu" />
                                                        <label for="T">Thu</label>
                                                        <input type="checkbox" id="F" class="check" value="Fri" />
                                                        <label for="F">Fri</label>
                                                        <input type="checkbox" id="S" class="check" value="Sat" />
                                                        <label for="S">Sat</label>
                                                        <br />
                                                        <div class="row">
                                                            <div class="col">

                                                                <asp:TextBox ID="TextBox2" CssClass="text form-control" runat="server"></asp:TextBox>

                                                            </div>
                                                            <div class="col">
                                                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="Class time"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label class="col-form-label">Semester Year</label>
                                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" placeholder="Semester Year...Fall or Spring"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                    </div>

                                                </div>


                                                    <div >
                                                        <div class="text-right">
                                                            <asp:Button ID="btnUpdateClass" runat="server" CssClass="btn btn-success btn-lg" CausesValidation="true" Text="Update Class" OnClick="btnUpdateClass_Click" />
                                                        </div>
                                                    </div>
                                              

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--update-->

                    </asp:View>
                </asp:MultiView>


            </div>

        </ContentTemplate>
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
            <%--<asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />--%>
            <%--<asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />--%>
          <asp:PostBackTrigger  ControlID="btnReset" />
         
          <%--<asp:AsyncPostBackTrigger ControlID="DropDownListSemester" EventName="SelectedIndexChanged" />--%>
          <asp:AsyncPostBackTrigger ControlID="btnclose" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function openModal() {
            $('#exampleModal').modal('show');
        }

        $('#btnSubmit').on('click', function () {
            $('#myModal').modal('hide');
        });


        $(".checkbox-menu").on("change", "input[type='checkbox']", function () {
            $(this).closest("li").toggleClass("active", this.checked);
        });

        $(document).on('click', '.allow-focus', function (e) {
            e.stopPropagation();
        });


        $(function () {
            $("[id*=btnAdd]").click(function () {
                var clstime = $("[id*=txtclstime]");
                var smstryear = $("[id*=txtsemesteryear]");
                if (clstime.val() == "" && clstime.val()=="") {
                    //If the "Please Select" option is selected display error.
                    alert("Please add class time and year");
                    return false;
                }
                return true;
            });
        });

    
    
    </script>





</asp:Content>

