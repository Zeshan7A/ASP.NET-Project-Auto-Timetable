<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProfeile.aspx.cs" Inherits="UpdateProfeile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

           <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact" >
      <div class="container">       
          <%--data-aos="fade-up" data-aos-delay="100"  data-aos="fade-up"--%>
        <div class="row" >        
              <div class="col-lg-12">
            <div class="team member shadow">
                   <div class="card">
                    <div class="card-body">
                <div class="row" style="padding-left: 22px; padding-right: 22px;">
                  
                    <div class="col-md-12">
                        <div class="border-bottom" style="margin-bottom: 1rem;">
                            <h4 class="card-title text-center"><span style="color: #27a9e3;">Update Profile</span></h4>
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

                        <asp:Button ID="btnUpdate" CssClass="btn btn-success btn-lg" runat="server" Text="Submit" OnClick="btnUpdate_Click"  />
                      
                    </div>

                        </div>
                         </div>
                </div>
             

            </div>
          </div>
         

        </div>

      
      </div>
    </section><!-- End Contact Section -->

</asp:Content>

