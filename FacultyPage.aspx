<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="FacultyPage.aspx.cs" Inherits="FacultyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="container-fluid m-t-25">
       <%-- <div class="row">
            <div class="col-md-6 col-lg-4 col-xlg-3">
                <div class="card card-hover">
                    <div class="box bg-success text-center">
                        <h1 class="font-light text-white"><i class="fas fa-user fa-2x"></i></h1>
                        <h6 class="text-white">Faculty</h6>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label class="col-form-label">Department</label>
                    <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" TabIndex="4" AppendDataBoundItems="True" DataSourceID="selectDept" DataTextField="Dept_Name" DataValueField="Dept_Name">
                        <asp:ListItem>--Select Department--</asp:ListItem>                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="selectDept" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label class="col-form-label">Session</label>
                    <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control" TabIndex="4" AppendDataBoundItems="True" DataSourceID="selectSession" DataTextField="Session_ID" DataValueField="Session_ID">
                        <asp:ListItem>--Select Session--</asp:ListItem>                     
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="selectSession" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Session_ID] FROM [Session] ORDER BY [Session_ID] DESC"></asp:SqlDataSource>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label class="col-form-label">Semester</label>
                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" TabIndex="4" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged">
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
            </div>
            <div class="col">
                <div class="form-group">
                    <label class="col-form-label">Current Session</label>
                    <asp:DropDownList ID="ddlCurrentSession" runat="server" CssClass="form-control" TabIndex="4" AppendDataBoundItems="True" DataSourceID="selectCurrentSession" DataTextField="Current_Session" DataValueField="Current_Session">
                        <asp:ListItem>--Select Current Session--</asp:ListItem>
                     
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="selectCurrentSession" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [Current_Session] FROM [Class] ORDER BY Current_Session DESC "></asp:SqlDataSource>
                </div>
            </div>
            <div class="col">
                <div class="form-group">
                    <label class="col-form-label">Course</label>
                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" TabIndex="4" AppendDataBoundItems="true">
                        <asp:ListItem>--Select Course--</asp:ListItem>
                       
                    </asp:DropDownList>
                </div>
            </div>
        </div>
       <%-- <div class="row">
            <div class="col-md-4">
                <asp:Calendar ID="Calendar1" CssClass="form-control" runat="server"></asp:Calendar>
            </div>
        </div>--%>

         <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 0px">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-hover tab"   AutoGenerateColumns="false" DataKeyNames="Std_RegNo" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="stdName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Roll No">
                                <ItemTemplate>
                                    <asp:Label ID="Coursetitle" Text='<%#Eval("RollNo") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                           <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                <%--    <asp:Label ID="Status" Text='<%#Eval("Status") %>' runat="server"></asp:Label>--%>
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                        <asp:ListItem>--Mark Attandance--</asp:ListItem>
                                        <asp:ListItem>Present</asp:ListItem>
                                        <asp:ListItem>Absent</asp:ListItem>
                                    </asp:DropDownList>
                                     <asp:HiddenField ID="stdRegNo" runat="server" Value='<%# Eval("Std_RegNo") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                           <%-- <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnedit" ImageUrl="~/assets/images/customimages/edit.png" runat="server" CommandName="select" ToolTip="Select Record" Width="30px" Height="30px" />
                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/customimages/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete Record" Width="30px" Height="30px" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
                </div>
              


    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

