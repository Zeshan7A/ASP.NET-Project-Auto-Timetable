<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteUpdateFaculty.aspx.cs" Inherits="DeleteUpdateFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1"  runat="server">
        <ContentTemplate>
            <!-- Modal Popup -->
            <div id="mymodal" class="modal fade bd-example-modal-lg" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="H1">Update Faculty Info.</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Personal Number/ID</label>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ReadOnly="true" placeholder="Personal Num/ID"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Faculty Name</label>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Designation</label>
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" placeholder="Designation"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Department</label>
                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                            <asp:ListItem>--Select Department--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">UserName</label>
                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Password</label>
                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Contact No</label>
                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" placeholder="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Address</label>
                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                                    </div>
                                
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" Text="Submit" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Popup -->
            <div class="container-fluid pt-3">

                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="container-fluid">
                                <div class="card-body">
                                    <div class="border-bottom" style="margin-bottom: 2rem;">
                                        <h4 class="card-title text-center"><span style="color: #27a9e3;">Search Faculty </span><small class="small">to update & delete</small> </h4>
                                    </div>
                                 
                                   <%-- style="margin-bottom: 2rem;"--%>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group row">
                                              <asp:DropDownList ID="DropDownList1" CssClass="col-sm-12 form-control" AutoPostBack="true" runat="server"   AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem>--Select Department--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                                           
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList3" CssClass="col-sm-12 form-control" runat="server" AppendDataBoundItems="true">
                                                        <asp:ListItem>--Select Lecturer--</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                 <asp:Button ID="btnsearch" CssClass="btn btn-success btn-lg" Text="Search" runat="server" OnClick="btnsearch_Click" />

                                            </div>
                                        </div>
                                       
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 2px">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed tab" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" DataKeyNames="Prof_Num" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

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
                                                    <asp:TemplateField HeaderText="Prof. Num">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ProfNum" Text='<%#Eval("Prof_Num") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>                                   
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Designation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" Text='<%#Eval("Designation") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" Text='<%#Eval("Address") %>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Contact No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" Text='<%#Eval("ContactNo") %>' runat="server"></asp:Label>
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
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Department">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label7" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:Label>
                                                            <asp:HiddenField ID="pr" runat="server" Value='<%# Eval("Prof_Num") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                              

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnedit" ImageUrl="~/assets/images/customimages/edit.png" runat="server" CommandName="select" ToolTip="Select Record" Width="40px" Height="40px" />
                                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/customimages/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete Record" Width="40px" Height="40px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <br />
                                        <div class="text-right">
                                            <asp:Button ID="btnreset" Text="Reset" runat="server" CssClass="btn btn-primary" OnClick="btnreset_Click" />
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>

    </asp:UpdatePanel>
    <script>

        $(function () {
            $("[id*=btnsearch]").click(function () {
                var ddlDepartment = $("[id*=DropDownList1]");
                var ddlLecturer = $("[id*=DropDownList3]");
                if (ddlDepartment.val() == "--Select Department--" && ddlLecturer.val()=="--Select Lecturer--") {
                    //If the "Please Select" option is selected display error.
                    alert("Please select both Department & Lecturer!");
                    return false;
                }
                return true;
            });
        });
    </script>
</asp:Content>

