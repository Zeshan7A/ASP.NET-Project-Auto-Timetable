<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h3><span>Student Registration Form</span></h3>
        </div>
          <%--data-aos="fade-up" data-aos-delay="100"  data-aos="fade-up"--%>
        <div class="row" >       
              <div class="col-lg-12">
            <div class="team member shadow">
                   <div class="card">
                    <div class="card-body">
                <div class="row" style="padding-left: 22px; padding-right: 22px;">
                  
                    <div class="col-md-12">
                      <%--  <div class="border-bottom" style="margin-bottom: 1rem;">
                            <h4 class="card-title text-center"><span style="color: #27a9e3;">Add New Students</span></h4>
                        </div>--%>
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
                             <asp:TextBox ID="txtsession"  runat="server" CssClass="form-control"  placeholder="Session" ></asp:TextBox>
                        
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Roll No <span class="red">*</span></label>
                            <asp:TextBox ID="txtRollNo" runat="server"  class="form-control" MaxLength="3" placeholder="Roll No" TabIndex="5"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Email <span class="red">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server"  OnTextChanged="txtEmail_TextChanged" AutoPostBack="true" class="form-control" placeholder="Email Address" data-toggle="tooltip" data-placement="right" title="like asdf123@gmial.com" TabIndex="7"></asp:TextBox>
                            <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>  

                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Password <span class="red">*</span></label>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"  class="form-control" placeholder="Password" MaxLength="8" data-toggle="tooltip" data-placement="right" title="mix 8 character" TabIndex="8"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-md-2 text-left">
                        <asp:HyperLink ID="HyperLink2"  NavigateUrl="~/Bootstrap/Home.aspx" CssClass="btn btn-danger btn-lg" runat="server">Cancel</asp:HyperLink>
                    </div>
                    <div class="col-md-10 text-right">

                        <asp:Button ID="btnSubmit" CssClass="btn btn-success btn-lg" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
                        <asp:HyperLink ID="HyperLink1"  NavigateUrl="~/login.aspx" CssClass="btn btn-primary btn-lg" runat="server">Go login</asp:HyperLink>
                        
                    </div>

                        </div>
                         </div>
                </div>
             

            </div>
          </div>
         

        </div>

      
      </div>
    </section><!-- End Contact Section -->
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="assets/libs/jquery/dist/jquery.min.js"></script>
   
    <script>
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
                   //allow only number in contact textbox
           $('#<%=txtRollNo.ClientID%>').keydown(function () {

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

