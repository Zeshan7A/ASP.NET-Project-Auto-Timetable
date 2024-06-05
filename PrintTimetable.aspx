<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrintTimetable.aspx.cs"  Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       
    <link href="assets/libs/bootstrap/dist/css/tablecss.css" rel="stylesheet" />
       <script type="text/javascript">  
        function PrintDiv() {  
            var divContents = document.getElementById("printdivcontent").innerHTML;  
            var printWindow = window.open('', '', 'height=950,width=900');  
            printWindow.document.write('<html><head><title>TimeTable Print</title>');
            printWindow.document.write('<link  href="dist/css/style.min.css" rel="stylesheet" type="text/css" />');
            printWindow.document.write('<link  href="assets/libs/bootstrap/dist/css/tablecss.css" rel="stylesheet" type="text/css" />');
            printWindow.document.write('</head><body >');  
            printWindow.document.write(divContents);
            printWindow.document.write('<small style="margin-left:365px;">Developed & Designed by Zeshan Ahmad Khan & Naseeb Ali Khan </small>');
            printWindow.document.write('</body></html>');  
            printWindow.document.close();  
            printWindow.print();

        }  
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <asp:DropDownList ID="mddlsemester" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="mddlsemester_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true">
                    <asp:ListItem>--Select Semester--</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                <asp:Button ID="btnViewCourse" runat="server" Visible="false" CssClass="btn btn-lg btn-success m-t-20" Text="View Courses" OnClick="btnViewCourse_Click" />
                <div class="container">
                    <input type="button" class="btn btn-danger btn-lg" onclick="PrintDiv();" value="Print Now" />
                    <div id="printdivcontent">
                        <asp:Repeater ID="RepeaterSemester" runat="server" OnItemDataBound="RepeaterSemester_ItemDataBound1">
                            <ItemTemplate>
                                <table>
                                    <thead>
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <asp:Label ID="lbldeptment" runat="server" Font-Size="XX-Large" Text="Department of  " />
                                                <p>
                                                    <asp:Label ID="lblclg" runat="server" Font-Bold="true" Text="Govt. Post-Graduate College, Bannu." />
                                                </p>

                                                <p>
                                                    <asp:Label ID="Label3" runat="server" Font-Underline="true" Text="TimeTable for " />
                                                </p>
                                            </div>
                                            <div class="col-md-12 text-center" style="margin-bottom: 0px; margin-top: 0px; font-size: x-large;">
                                                <asp:Label ID="lblSemester"  runat="server" Text='<%# Eval("Semester") %>'  />
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
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>

    </div>


  


</asp:Content>

