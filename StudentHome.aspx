<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterPage.master" AutoEventWireup="true" CodeFile="StudentHome.aspx.cs" Inherits="StudentHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

    <div class="container">
            <%-- ////////////////////////////////////////--%>
        
                <div class="container" style="background-color: #e1ecf4;"> 
                    <div class="row align-items-center" >                 
                      <div class="col-md-12" style="padding-top:2rem;">
                          
                            <h4 class="card-title text-center"><span style="color: #27a9e3;">My Paper Marks Details</span></h4>                      
                    </div>
                        </div>
                    <hr />
                    <div class="container">
                         <div > <%--style="max-width: 100%;  overflow-x: scroll;"--%>
                        <asp:Repeater ID="RepeaterSemester" runat="server" OnItemDataBound="RepeaterSemester_ItemDataBound">
                            <ItemTemplate>
                                <table>
                                    <thead>
                                        <div class="row" style="background: #e1ecf4;">

                                            <div class="col-md-12 text-center" style="margin-bottom: 0px; margin-top: 42px; font-size: x-large;">
                                                <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester") %>' />
                                            </div>
                                        </div>

                                    </thead>
                                    <asp:Panel ID="pnlOrders" runat="server">
                                        <asp:Repeater ID="RepeaterCourse" OnItemDataBound="RepeaterCourse_ItemDataBound" runat="server">
                                            <HeaderTemplate>
                                                <div class="table-responsive">
                                                    <table class="customers">
                                                        <tr>
                                                            <th>Course Code</th>
                                                            <th>Title</th>
                                                            <th>Mid Term Marks</th>
                                                            <th>Final Term Marks</th>
                                                            <th>Internal Marks</th>
                                                            <th>Total Marks</th>
                                                             <th>Status</th>
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
                                                            <asp:Label ID="lblMidmarks" runat="server" Text='<%# Eval("Mid_Term") %>' />
                                                        </td>
                                                         <td>
                                                            <asp:Label ID="lblfinalmarks" runat="server" Text='<%# Eval("Final_Term") %>' />
                                                        </td>
                                                         <td>
                                                            <asp:Label ID="lblinternal" runat="server" Text='<%# Eval("Internal_Marks") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbltotal" runat="server" Text='<%# Eval("Total") %>' />
                                                        </td>
                                                          <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Status") %>' />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </ItemTemplate>
                                            <FooterTemplate>                                             
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
                                    
                             <div class="alert alert-light" role="alert" style="font-size: 1.1rem; text-align:right;">
                                 <b>Semester GPA: 
                                     <asp:Label ID="lblGPA" runat="server" Text="" />
                                 </b>.
                             </div>
                         </div>
                    </div>
                </div>
         

                <%--  ///////////////////////////////////////--%>
    </div>
    
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

