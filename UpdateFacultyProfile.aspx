<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="UpdateFacultyProfile.aspx.cs" Inherits="UpdateFacultyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
       <div class="card">
                        <div class="card-body">
                               <div class="border-bottom" style="margin-bottom: 2rem;">
                                        <h4 class="card-title text-center"><span style="color: #27a9e3;">Update Profile</span></h4>
                                    </div>
                            <div class="row" style="padding-left: 22px; padding-right: 22px;">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-form-label">Personal Number/ID <span class="red">*</span> </label>
                                        <asp:TextBox ID="txtPersonalNum" ReadOnly="true" runat="server" required="true" class="form-control" placeholder="Personal Number/ID"></asp:TextBox>
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
                                   <asp:TextBox ID="txtEmail" runat="server" class="form-control" required="true" placeholder="Email Address" data-toggle="tooltip" data-placement="right" title="like asdf123@gmial.com" TabIndex="7"></asp:TextBox>

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
                                        <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-success btn-lg" Text="Update Now" OnClick="btnUpdate_Click" />
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                    </div>
   

</asp:Content>

