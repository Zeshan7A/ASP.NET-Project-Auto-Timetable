<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .tab
        {
            border-collapse: collapse;
            line-height: 2rem;
            font-size: 1rem;
            text-align: center;
        }
        .red
        {
            color:red;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
        <ContentTemplate>
            <div class="container-fluid pt-3">
             <%--   <div class="row">
                    <div class="col-md-6">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-rounded" Text="On" OnClick="Button1_Click1" />
                            <asp:Button ID="Button2" runat="server" CssClass="btn  btn-rounded" Text="Off" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>--%>
                   <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Student Registration</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Student Registration</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->

            <!-- Small boxes (Stat box) -->
            <div class="row">                   
                    <!-- Column -->
                    <div class="col-md-6 col-lg-6 col-xlg-3">
                   <asp:Button ID="ButtonAdd" CssClass="btn btn-lg btn-success" runat="server" OnClick="ButtonAdd_Click" Text="Add New" />
                        <asp:Button ID="ButtonViewAll" CssClass="btn btn-lg btn-warning" OnClick="ButtonViewAll_Click" runat="server" Text="View All" />
                    </div>            
                    <!-- Column -->
                     <!-- Column -->                                    
                    <!-- Column -->
                </div>                
                <!-- /.row -->
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View>
                   <asp:View ID="View1" runat="server">
                       
                <%-- ////////////////////////////////////////--%>
                   <div class="card">
                    <div class="card-body">
                <div class="row" style="padding-left: 22px; padding-right: 22px;">
                  
                    <div class="col-md-12">
                        <div class="border-bottom" style="margin-bottom: 1rem;">
                            <h4 class="card-title text-center"><span style="color: #27a9e3;">Add New Students</span></h4>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-form-label">Student RegNo <span class="red">*</span> </label>
                            <asp:TextBox ID="txtRegNo"  runat="server" class="form-control" placeholder="RegNo like USTB1620-BS788"></asp:TextBox>
                            <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Father Name <span class="red">*</span> </label>
                            <asp:TextBox ID="txtfname" runat="server"  class="form-control" onKeyPress="return ValidateAlpha(event);" placeholder="F/Name"></asp:TextBox>
                            <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Department <span class="red">*</span></label>

                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="selectDept" DataTextField="Dept_Name" DataValueField="Dept_Name" TabIndex="2">
                                <asp:ListItem>--Select Department--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="selectDept" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Semester <span class="red">*</span></label>
                            <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" TabIndex="4">
                                <asp:ListItem>--Select Semester--</asp:ListItem>
                                <asp:ListItem>1st Semester</asp:ListItem>
                                <asp:ListItem>2nd Semester</asp:ListItem>
                                <asp:ListItem>3rd Semester</asp:ListItem>
                                <asp:ListItem>4th Semester</asp:ListItem>
                                <asp:ListItem>5th Semester</asp:ListItem>
                                <asp:ListItem>6th Semester</asp:ListItem>
                                <asp:ListItem>7th Semester</asp:ListItem>
                                <asp:ListItem>8th Semester</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Phone No. <span class="red">*</span></label>
                            <asp:TextBox ID="txtPhone" runat="server"  class="form-control" MaxLength="12" placeholder="Contact No" data-toggle="tooltip" data-placement="right" title="like 0xxx-xxxxxxx" TabIndex="6"></asp:TextBox>
                        </div>
                  <%--      <div class="form-group">
                            <label class="col-form-label">Photo</label>

                            <div class="col-sm-6">
                                <asp:FileUpload ID="FileUpload2" CssClass="form-control" runat="server" TabIndex="9" />
                            </div>
                        </div>--%>



                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-form-label">Student Name <span class="red">*</span></label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name" onKeyPress="return ValidateAlpha(event);" TabIndex="1"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Session <span class="red">*</span></label>
                             <asp:TextBox ID="txtsession" runat="server" CssClass="form-control"  placeholder="Session" ></asp:TextBox>
                          
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Roll No <span class="red">*</span></label>
                            <asp:TextBox ID="txtRollNo" runat="server"  class="form-control" MaxLength="3" placeholder="Roll No" TabIndex="5"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Email <span class="red">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Email Address" data-toggle="tooltip" data-placement="right" title="like asdf123@gmial.com" TabIndex="7"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Password <span class="red">*</span></label>
                            <asp:TextBox ID="txtPassword" runat="server"  class="form-control" placeholder="Password" MaxLength="8" data-toggle="tooltip" data-placement="right" title="mix 8 character" TabIndex="8"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-md-12 text-right">

                        <asp:Button ID="btnSubmit" CssClass="btn btn-success btn-lg" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

                    </div>

                        </div>
                         </div>
                </div>

                <%--  ///////////////////////////////////////--%>

                   </asp:View>
                        
                   <asp:View ID="View2" runat="server">
                       
        
                <div class="row">
                    <div class="col-md-12">
                        <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 2px">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed tab" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" TabIndex="13">

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
                                    <asp:TemplateField HeaderText="Reg.No">
                                        <ItemTemplate>
                                            <asp:Label ID="StdRegNum" Text='<%#Eval("Std_RegNo") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Roll_No">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" Text='<%#Eval("RollNo") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Semester">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" Text='<%#Eval("Semester") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Session">
                                        <ItemTemplate>
                                            <asp:Label ID="Label55" Text='<%#Eval("Session") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UserName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" Text='<%#Eval("UserName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" Text='<%#Eval("Password") %>' runat="server"></asp:Label>
                                            <%--   <asp:HiddenField ID="pr" runat="server"
                                                Value='<%# Eval("Std_RegNo") %>' />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
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
                        <br />
                        <div class="text-right">
                            <asp:Button ID="btnreset" Text="Reset" runat="server" CssClass="btn btn-primary" OnClick="btnreset_Click" TabIndex="14" />
                        </div>
                    </div>
                </div>

                <%-- ////////////////////////////////////////////////--%>
                       
                   </asp:View>
                            
                       </asp:View>
                </asp:MultiView>

                











            </div>

            </label>

        </ContentTemplate>
         <Triggers>
          <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
            
      </Triggers>
    </asp:UpdatePanel>
        <script type="text/javascript">
           ///auto adding dash to phone 
           $(function () {

               $('#<%=txtPhone.ClientID%>').keydown(function (e) {
                   var key = e.charCode || e.keyCode || 0;
                   $text = $(this);
                   if (key !== 8 && key !== 9) {
                       if ($text.val().length === 4) {
                           $text.val($text.val() + '-');
                       }


                   }

                   return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
               })
           });

           //allow only number in contact textbox
            $('#<%=txtPhone.ClientID%>', '#<%=txtRollNo.ClientID%>' ).keydown(function () {

               //allow  backspace, tab, ctrl+A, escape, carriage return
               if (event.keyCode == 8 || event.keyCode == 9
                                 || event.keyCode == 27 || event.keyCode == 13
                                 || (event.keyCode == 65 && event.ctrlKey === true))
                   return;
               if ((event.keyCode < 48 || event.keyCode > 57))
                   event.preventDefault();
            });

            //allow only number in RollNO textbox
                 $('#<%=txtRollNo.ClientID%>').keydown(function () {

               //allow  backspace, tab, ctrl+A, escape, carriage return
               if (event.keyCode == 8 || event.keyCode == 9
                                 || event.keyCode == 27 || event.keyCode == 13
                                 || (event.keyCode == 65 && event.ctrlKey === true))
                   return;
               if ((event.keyCode < 48 || event.keyCode > 57))
                   event.preventDefault();
           });




           //allow only alphbeates to name textbox 
              $('#txtName', 'txtfname').bind('keypress');

           //another function allow only alph and number
           function isNumberKey(evt) {
               //Function to accept only numeric values
               //var e = evt || window.event;
               var charCode = (evt.which) ? evt.which : evt.keyCode
               if (charCode != 46 && charCode > 31
               && (charCode < 48 || charCode > 57))
                   return false;
               return true;
           }

           function ValidateAlpha(evt) {
               var keyCode = (evt.which) ? evt.which : evt.keyCode
               if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)

                   return false;
               return true;
           }

       



    </script>
</asp:Content>

