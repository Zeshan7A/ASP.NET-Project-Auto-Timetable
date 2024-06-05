<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsPromotion.aspx.cs" Inherits="StudentsPromotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" onload="Add()" Runat="Server">

      <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="container-fluid">
                                <div class="card-body">
                                    <div class="border-bottom" style="margin-bottom: 2rem;">
                                        <h4 class="card-title text-center"><span style="color: #27a9e3;">Student Promotion</span></h4>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 text-center mt-2">
                                            <label class="col-form-label badge badge-primary text-center">Student's Current Semester</label>
                                            <asp:Repeater ID="rptrCurrentSemstr" OnItemDataBound="rptrCurrentSemstr_ItemDataBound" runat="server">
                                                <ItemTemplate>
                                                    <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <asp:Label ID="lbleCurrentSemesters" runat="server" CssClass="col-form-label form-control" Text='<%#Eval("Semester") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                           <%--  <div class="row mt-3">
                                                        <div class="col-md-12">
                                                            <asp:Label ID="lblsemester1" runat="server" CssClass="col-form-label form-control" Text=''></asp:Label>
                                                        </div>
                                                   <div class="col-md-12">
                                                            <asp:Label ID="lblsemester2" runat="server" CssClass="col-form-label form-control" Text=''></asp:Label>
                                                        </div>
                                                   <div class="col-md-12">
                                                            <asp:Label ID="lblsemester3" runat="server" CssClass="col-form-label form-control" Text=''></asp:Label>
                                                        </div>
                                                   <div class="col-md-12">
                                                            <asp:Label ID="lblsemester4" runat="server" CssClass="col-form-label form-control" Text=''></asp:Label>
                                                        </div>
                                                    </div>--%>
                                        </div>

                                        <div class="col-md-6 text-center mt-2">
                                            <label class="col-form-label badge badge-success">Next Semester</label>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mt-3">
                                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                                            <asp:ListItem>--Select Semester--</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <div class="mt-3">
                                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                                            <asp:ListItem>--Select Semester--</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="mt-3">
                                                        <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                                            <asp:ListItem>--Select Semester--</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="mt-3">
                                                        <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" AppendDataBoundItems="True">
                                                            <asp:ListItem>--Select Semester--</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                     <hr />
                                <div class="text-right">
                                    <asp:Button ID="btnAdd" OnClick="btnAdd_Click" runat="server" CssClass="btn btn-success btn-lg" Text="Promote Student" />
                                </div>
                                </div>

                               
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
  
</asp:Content>

