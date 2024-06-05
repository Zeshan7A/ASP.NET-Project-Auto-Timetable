<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#mymodal').modal('show');
        }
    </script>
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
    </style>
    <link href="dist/css/Custom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" EnableViewState="true" runat="server">
       
        <ContentTemplate>
            <!-- Modal Popup -->
            <div id="mymodal" class="modal fade bd-example-modal-lg" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="H1">Update Course.</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="container">
                            <div class="modal-body">

                                <%--<EditItemTemplate>
                    <asp:TextBox ID="txtDept_Name" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>--%>
                                <div class="form-group">
                                    <label class="col-form-label">Course Code</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:Label ID="LabelCourseCode" runat="server" Text="" Visible="false"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label>Course Title</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <%-- </div>--%>
                                <%--  <div class="form-row">--%>
                                <div class="form-group">
                                    <label class="col-form-label">Credit Hours</label>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="Designation"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Semester</label>
                                    <asp:DropDownList ID="mddlsemester" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true">
                                        <asp:ListItem>--Select Semester--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Course Schema</label>
                                    <asp:DropDownList ID="mddlCourseSchema" CssClass="form-control" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource4" DataTextField="Course_Schema" DataValueField="Course_Schema">
                                        <asp:ListItem>--Select Course Schema--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Course_Schema] FROM [CourseSchema]"></asp:SqlDataSource>
                                </div>
                                <%-- </div> --%>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="text-right">
                                <asp:Button ID="btnSubmit" Text="Update" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-success btn-lg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Popup -->


<!-- Modal for adding new course schema -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add New Course Schema</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Course Schema</label>
                                <asp:TextBox ID="txtmCourseSchema" CssClass="form-control" runat="server" placeholder="Couse Schema"></asp:TextBox>
                                <%--   <small id="lbexist" runat="server" class="form-text text-muted">This Course Schema is already Exist.</small>--%>
                            </div>
                            <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>


            <div class="container-fluid pt-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="container-fluid">
                                <div class="card-body">
                                    <div class="border-bottom" style="margin-bottom: 2rem;">
                                        <h4 class="card-title text-center"><span style="color: #27a9e3;">Add New Course</span></h4>
                                    </div>
                                    <%--<form class="">--%>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                                        Add New Course Schema
                                    </button>
                                    <br /> <br />

                                    <div class="form-row">
                                    <%--    <div class="form-group col-md-6">
                                            <label class="col-form-label">Department</label>
                                            <asp:DropDownList ID="ddlDepartment" CssClass="form-control" runat="server">
                                                <asp:ListItem>--Select Department--</asp:ListItem>
                                                <asp:ListItem>Computer Science</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>--%>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label">Course Schema</label>
                                            <asp:DropDownList ID="ddlcourseSchema" CssClass="form-control" runat="server"  AppendDataBoundItems="true"  >
                                            

                                            </asp:DropDownList>
                                            <%--<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Course_Schema] FROM [CourseSchema]"></asp:SqlDataSource>--%>
                                        </div>
                                         <div class="form-group col-md-6">
                                            <label class="col-form-label">Semester</label>
                                            <asp:DropDownList ID="ddlsemester" CssClass="form-control" runat="server" DataSourceID="SqlDataSource6" AutoPostBack="true" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
                                                <asp:ListItem>--Select Semester--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                       
                                    
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label">Course Code</label>
                                            <asp:TextBox ID="txtcoursecode" CssClass="form-control"  runat="server" placeholder="Couse Code"></asp:TextBox>
                                        </div>
                                          <div class="form-group col-md-6">
                                            <label class="col-form-label">Course title</label>
                                            <asp:TextBox ID="txtitle" CssClass="form-control"  runat="server" placeholder="Course title"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row">

                                      
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label">Credit Hour</label>
                                            <asp:TextBox ID="txtcredithour" MaxLength="1"  CssClass="form-control" onkeypress="return myKeyPress(event)"   onkeyup='MaxMarks()' runat="server" placeholder="Credit Hour"></asp:TextBox>
                                        </div>
                                          <div class="form-group col-md-6">
                                            <label class="col-form-label">Max Subject Marks</label>
                                            <asp:TextBox ID="txtmaxMarks" CssClass="form-control" runat="server" placeholder="Max Subject Marks"></asp:TextBox>
                                        </div> 
                                    </div>
                                  
                                           <div class="form-row">
                                                     <div class="form-group col-md-6">
                                            Total Credit Hours:
                                             <asp:Label ID="lbmaxch" runat="server" ForeColor="Red" Text=""></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                        </div>
                                               </div>
                                    <hr />
                                    <div class="text-right">
                                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success btn-lg" OnClick="btnAdd_Click" Text="Add New Course" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="border-bottom" style="margin-bottom: 2rem;">
                            <h4 class="card-title text-center"><span style="color: #27a9e3;">Search Course </span><span class="small">by Semester & Course Schema</span> </h4>
                        </div>
                        <div class="row">
                            <%--<div class="col-md-12">--%>
                               <%-- <label class="col-form-label">Search by Semester</label>--%>
                                <div class="form-group col">
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                        <asp:ListItem>--Select Semester--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group col">
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" AppendDataBoundItems="true"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                       <%-- <asp:ListItem>--Select Course Schema--</asp:ListItem>--%>
                                    </asp:DropDownList>
                                    </div>

                           <%-- </div>--%>
                        </div>
                    </div>
                </div>
              
                 <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 0px">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-hover tab" AllowPaging="true" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" DataKeyNames="Course_Code" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging">

                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                        <PagerSettings Mode="Numeric"
                            Position="Bottom"
                            PageButtonCount="10" />

                        <PagerStyle BackColor="LightBlue"
                            Height="30px" CssClass="GridPager"
                            VerticalAlign="Bottom" Font-Size="X-Large"
                            HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="Course Code">
                                <ItemTemplate>
                                    <asp:Label ID="courseCode" Text='<%#Eval("Course_Code") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course title">
                                <ItemTemplate>
                                    <asp:Label ID="Coursetitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Credit Hours">
                                <ItemTemplate>
                                    <asp:Label ID="CreditHours" Text='<%#Eval("Credit_Hour") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Semester">
                                <ItemTemplate>
                                    <asp:Label ID="Semester" Text='<%#Eval("Semester") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cours Schema">
                                <ItemTemplate>
                                    <asp:Label ID="lbgdvCS" Text='<%#Eval("Course_Schema") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department">
                                <ItemTemplate>
                                    <asp:Label ID="Department" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:Label>
                                    <asp:HiddenField ID="pr" runat="server" Value='<%# Eval("Course_Code") %>' />
                                </ItemTemplate>
                                <%--<EditItemTemplate>
                    <asp:TextBox ID="txtDept_Name" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:TextBox>
                </EditItemTemplate>--%>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnedit" ImageUrl="~/assets/images/customimages/edit.png" runat="server" CommandName="select" ToolTip="Select Record" Width="30px" Height="30px" />
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/customimages/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete Record" Width="30px" Height="30px" />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
              
            </div>



        </ContentTemplate>
       
    </asp:UpdatePanel>
    <script>


        //auto marks for subject
        function MaxMarks() {

            var CH = parseInt(document.getElementById('<%=txtcredithour.ClientID%>').value);
             var MarksMarks = parseInt(document.getElementById('<%=txtmaxMarks.ClientID%>').value);              
            if (document.getElementById('<%=txtcredithour.ClientID%>').value == "")
            {
                document.getElementById('<%=txtmaxMarks.ClientID%>').value = "";
                  document.getElementById('<%=txtmaxMarks.ClientID%>').style.background = "White";            
            }
            else
            {              
              if (CH > 4) {
                  document.getElementById('<%=txtmaxMarks.ClientID%>').value = "200";
                   document.getElementById('<%=txtmaxMarks.ClientID%>').style.background = "lightgoldenrodyellow";
            }
            else
            {
                
                  document.getElementById('<%=txtmaxMarks.ClientID%>').value = "100";
                   document.getElementById('<%=txtmaxMarks.ClientID%>').style.background = "lightgoldenrodyellow";
              }
                }
            
         
           
        }
        //function allow only from 1 to 6 credithours not more than
        function myKeyPress(e) {
            var keynum;
            if (window.event) { // IE                    
                keynum = e.keyCode;
            } else if (e.which) { // Netscape/Firefox/Opera                   
                keynum = e.which;
            }
            if (keynum > 54 || keynum == 53 || keynum == 48)
                e.preventDefault();
            
        }

        //allow only number to credithour textbox
             $('#<%=txtcredithour.ClientID%>').keydown(function () {

               //allow  backspace, tab, ctrl+A, escape, carriage return
               if (event.keyCode == 8 || event.keyCode == 9
                                 || event.keyCode == 27 || event.keyCode == 13
                                 || (event.keyCode == 65 && event.ctrlKey === true))
                   return;
               if ((event.keyCode < 48 || event.keyCode > 57))
                   event.preventDefault();
           });
    </script>
</asp:Content>

