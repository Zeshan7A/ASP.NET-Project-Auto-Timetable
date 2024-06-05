<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCourse.aspx.cs" Inherits="testpage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container-fluid" style="background-color: #e1ecf4;">
                <div class="row" style="padding: 10px;">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Department</label>
                
                            <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                             <asp:ListItem>--Select Department--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Dept_Name] FROM [Department]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Course Schemas</label>
                              <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                               <asp:ListItem>--Select Course Schema--</asp:ListItem>
                              </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Course_Schema] FROM [CourseSchema]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <asp:Button ID="btnViewCourse" runat="server" CssClass="btn btn-lg btn-success m-t-20" Text="View Courses" OnClick="btnViewCourse_Click"/>
                        </div>
                    </div>
                </div>
                <hr />


                <div class="container">

                <asp:Repeater ID="RepeaterSemester" runat="server" OnItemDataBound="RepeaterSemester_ItemDataBound">               
                    <ItemTemplate>                        
                        <table>
                            <thead>
                                <div class="row" style=" background: #e1ecf4; ">
                                    
                                    <div class="col-md-12 text-center" style="margin-bottom: 0px; margin-top: 42px;font-size: x-large;">
                                        <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester") %>' />
                                    </div>
                                </div>                              
                               
                            </thead>                   
                                <asp:Panel ID="pnlOrders" runat="server">
                                    <asp:Repeater ID="RepeaterCourse" OnItemDataBound="RepeaterCourse_ItemDataBound" runat="server">
                                        <HeaderTemplate>
                                           <div class="table-responsive" >
                                            <table class="customers">
                                                <tr>
                                                    <th>Course Code</th>
                                                    <th>Title</th>
                                                    <th>Credit Hour</th>                                                  
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCourseCode" runat="server" Text='<%# Eval("Course_Code") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCourseTitle" runat="server" Text='<%# Eval("Title") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblCredt_Hour" runat="server" Text='<%# Eval("Credit_Hour") %>' />
                                                    </td>                                                
                                                </tr>   
                                            </tbody>                                         
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <tr style="background-color: whitesmoke; font-weight: bold;">
                                                <td colspan="2" style="text-align:right;">Total Credit hours: &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="lbTotalCH" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                           <%-- </table>--%>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </asp:Panel>                                                                                       
                       <%-- </tr>--%>
                    </ItemTemplate>
                    <FooterTemplate>                          
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
               
                     </div>


              <%--  <div class="text-left" style="padding-bottom: 25px; padding-left: 15px;">
                    <hr />
                    <asp:Button ID="ButtonBack" CssClass="btn btn-lg btn-success" runat="server" Text="Go Back to previous Semesters" OnClick="ButtonBack_Click" />
                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
        
    </div>
</asp:Content>

