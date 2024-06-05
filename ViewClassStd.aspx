<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterPage.master" AutoEventWireup="true" CodeFile="ViewClassStd.aspx.cs" Inherits="ViewClassStd" %>

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




        .checkbox-menu li label {
    display: inline;
    padding: 3px 10px;
    clear: both;
    font-weight: normal;
    line-height: 1.42857143;
    color: #333;
    white-space: nowrap;
    margin:0;
    transition: background-color .4s ease;
}
.checkbox-menu li input {
    margin: 0px 5px;
    top: 2px;
    position: relative;
}

.checkbox-menu li.active label {
    background-color: #cbcbff;
    font-weight:bold;
}

.checkbox-menu li label:hover,
.checkbox-menu li label:focus {
    background-color: #f5f5f5;
}

.checkbox-menu li.active label:hover,
.checkbox-menu li.active label:focus {
    background-color: #b8b8ff;
}


        /*.dropdown-menu
        {
            max-width:0px ! important;
        }*/

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
     <div class="container">
                           <div class="row">
                    <div class="col-md-12">
        <%--<asp:Button ID="btnViewCourse" runat="server" CssClass="btn btn-lg btn-success m-t-20" Text="View Courses" OnClick="btnViewCourse_Click"/>--%>
                       <%--  <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-info m-t-20" Text="Click Me" OnClick="Button1_Click"/>--%>
                            <div class="container">

                                <asp:Repeater ID="RepeaterSemester" runat="server" OnItemDataBound="RepeaterSemester_ItemDataBound1">
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
                                                <asp:Repeater ID="RepeaterCourse" OnItemDataBound="RepeaterCourse_ItemDataBound1" runat="server">
                                                    <HeaderTemplate>
                                                        <div class="table-responsive">
                                                            <table class="customers">
                                                                <tr>
                                                                    <th>Professor</th>
                                                                    <th>Subject</th>
                                                                    <th>Day  & Time</th>
                                                                    <%-- <th>Hour</th>
                                                    <th>Credit Hour</th>
                                                    <th>daytime</th>--%>
                                                                </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                                                                    <asp:Label ID="lbccode" Visible="false" runat="server" Text='<%# Eval("Class_Code") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblCourseTitle" runat="server" Text='<%# Eval("Title") %>' />
                                                                    <%--<asp:Literal runat="server" ID="Literal2" Text='<%# this.title %>'></asp:Literal>--%>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblday" runat="server" />
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
               
                     </div>
                        </div>
                         </div>
                
    </div>

</asp:Content>

