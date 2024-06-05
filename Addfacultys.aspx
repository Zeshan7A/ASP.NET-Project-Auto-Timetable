<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Addfacultys.aspx.cs" Inherits="Addfacultys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .red {
        color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:UpdatePanel ID="UpdatePanel1" EnableViewState="true" runat="server">
         
        <ContentTemplate>
      


                <div class="container-fluid pt-3">
                     <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <%--<h4 class="page-title">Add Faculty</h4>--%>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Faculty Registration</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
                <%-- ////////////////////////////////////////--%>
                    <div class="card">
                        <div class="card-body">
                               <div class="border-bottom" style="margin-bottom: 2rem;">
                                        <h4 class="card-title text-center"><span style="color: #27a9e3;">Add Faculty</span></h4>
                                    </div>
                            <div class="row" style="padding-left: 22px; padding-right: 22px;">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label">Personal Number/ID <span class="red">*</span> </label>
                                        <asp:TextBox ID="txtPersonalNum" runat="server" required="true" class="form-control" placeholder="Personal Number/ID"></asp:TextBox>
                                        <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Designation <span class="red">*</span> </label>
                                        <asp:TextBox ID="txtdesignation" runat="server" required="true" class="form-control" onKeyPress="return ValidateAlpha(event);" placeholder="Designation"></asp:TextBox>
                                        <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-form-label">Phone No. <span class="red">*</span></label>
                                        <asp:TextBox ID="txtPhone" runat="server"  class="form-control" MaxLength="12" placeholder="Contact No" data-toggle="tooltip" data-placement="right" title="like 0xxx-xxxxxxx" TabIndex="6"></asp:TextBox>
                                    </div>
                                
                                    <div class="form-group">
                                        <label class="col-form-label">Username <span class="red">*</span></label>
                                   <asp:TextBox ID="txtEmail" OnTextChanged="txtEmail_TextChanged" AutoPostBack="true" runat="server" class="form-control" required="true" placeholder="Email Address" data-toggle="tooltip" data-placement="right" title="like asdf123@gmial.com" TabIndex="7"></asp:TextBox>
                                          <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>  
                                    </div>
                                   
                                



                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label">Name <span class="red">*</span></label>
                                        <asp:TextBox ID="txtName" runat="server" class="form-control" required="true" onKeyPress="return ValidateAlpha(event);" placeholder="Name" TabIndex="1"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Address <span class="red">*</span></label>
                                         <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"  onKeyPress="return ValidateAlpha(event);" placeholder="Address" ></asp:TextBox>
                                    
                                         </div>
                                        <div class="form-group">
                                        <label class="col-form-label">Department <span class="red">*</span></label>

                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" AppendDataBoundItems="True" TabIndex="2">
                                            <asp:ListItem>--Select Department--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="selectDept" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                                    </div>
                                                                      
                                    <div class="form-group">
                                        <label class="col-form-label">Password <span class="red">*</span></label>
                                        <asp:TextBox ID="txtPassword" runat="server" required="true" class="form-control" MaxLength="8" placeholder="Password" data-toggle="tooltip" data-placement="right" title="mix 8 character" TabIndex="8"></asp:TextBox>
                                    </div>

                                </div>                              
                            </div>
                        </div>
                         <div class="border-top">
                                    <div class="card-body text-right">
                                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success btn-lg" Text="Add Faculty" OnClick="btnsubmit_Click" />
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                    </div>
                     
                <%--  ///////////////////////////////////////--%>
            </div>





        </ContentTemplate>
          <Triggers>
                   <asp:PostBackTrigger ControlID="btnsubmit" />
         
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
           $('#<%=txtPhone.ClientID%>').keydown(function () {

               //allow  backspace, tab, ctrl+A, escape, carriage return
               if (event.keyCode == 8 || event.keyCode == 9
                                 || event.keyCode == 27 || event.keyCode == 13
                                 || (event.keyCode == 65 && event.ctrlKey === true))
                   return;
               if ((event.keyCode < 48 || event.keyCode > 57))
                   event.preventDefault();
           });

           //allow only alphbeates to name textbox 
              $('#txtName', 'txtdesignation', 'txtaddress').bind('keypress');

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

       
           $(function () {
               $("[id*=btnsubmit]").click(function () {
                   var ddlDepartment = $("[id*=ddlDepartment]");
                   if (ddlDepartment.val() == "--Select Department--") {
                       //If the "Please Select" option is selected display error.
                       alert("Please select Department!");
                       return false;
                   }
                   return true;
               });
           });


    </script>


</asp:Content>

