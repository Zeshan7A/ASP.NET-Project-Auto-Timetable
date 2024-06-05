<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteUpdateStd.aspx.cs" Inherits="DeleteUpdateFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--  <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>--%>
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
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <!-- Modal Popup -->
            <div id="mymodal" class="modal fade bd-example-modal-lg" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="H1">Update Student Info.</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Reg_No</label>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"  placeholder="Personal Num/ID"></asp:TextBox>
                                        <asp:Label ID="lblerror" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Name</label>
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">RollNo</label>
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" ></asp:TextBox>
                                         <asp:Label ID="lblerror2" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Semester</label>
                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Session</label>
                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                                    </div> 
                                       <div class="form-group col-md-6">
                                        <label class="col-form-label">UserName</label>
                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                    </div>                                                     
                                </div>
                                 <div class="form-row">                                   
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label">Password</label>
                                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
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
    <div class="container-fluid">

        <div class="row">
            <div class="col-12">

                <div class="card">
                    <div class="container-fluid">
                        <div class="card-body">
                            <div class="border-bottom" style="margin-bottom: 2rem;">
                                <h4 class="card-title text-center"><span style="color: #27a9e3;">Search Student </span><small class="small">to update & delete</small> </h4>
                            </div>
                            <div class="container-fluid">
                                <div class="form-row bg-white align-items-center">


                                    <div class="form-group col-md-5">
                                        <label class="col-form-label">Session</label>
                                        <asp:TextBox ID="txtsession" placeholder="Session" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label class="col-form-label">Name</label>
                                        <asp:DropDownList ID="ddlsemester" runat="server" CssClass="form-control"  AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
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
                                    <div class="form-group  col-md-2">

                                        <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-success btn-lg m-t-30" Text="Search" OnClick="btnsearch_Click" />
                                    </div>
                                </div>

                            </div>
                            <hr />
                        </div>

                                <%-- ///////////////searching row///////////////////////--%>
                <div class="container-fluid bg-white">

                    <%-- <div class="row" style="margin-bottom: 2rem;">
                         </div>--%>
                    <div class="border-bottom">
                        <h4 class="card-title text-center"><span style="color: #27a9e3;">OR </span> </h4>
                    </div>
                    <div class="form-row" style="padding: 20px; border-radius: 14px;">
                        <asp:TextBox ID="TextBox6" CssClass="form-control" onkeyup="myFunction()" placeholder="Search by Anything" runat="server"></asp:TextBox>
                      <%--  <input id="Text1" class="form-control" onkeyup="myFunction()" placeholder="Search by Anything" type="text" />--%>
                         </div>
                </div>
                <hr />
                       
                <script type="text/javascript">
                    function myFunction() {
                        $("#<%=GridView1.ClientID%> tr:has(td)").hide();
          var iCounter = 0;
          var sSearchTerm = $('#<%=TextBox6.ClientID%>').val();
          if (sSearchTerm.length == 0) {
              $("#<%=GridView1.ClientID%> tr:has(td)").show();
              return false;
          }

          $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
              var cellText = $(this).text().toLowerCase();
              if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) {
                  $(this).parent().show();
                  iCounter++;
                  return true;
              }
          });

          if (iCounter == 0) {
              alert()
          }
          e.preventDefault();
                    }

                    //gggggggggggg
                    $("#TextBox6").keyup(function (evt) {
                       $("#<%=GridView1.ClientID%> tr:has(td)").hide();
          var iCounter = 0;
          var sSearchTerm = $('#<%=TextBox6.ClientID%>').val();
          if (sSearchTerm.length == 0) {
              $("#<%=GridView1.ClientID%> tr:has(td)").show();
              return false;
          }

          $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
              var cellText = $(this).text().toLowerCase();
              if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) {
                  $(this).parent().show();
                  iCounter++;
                  return true;
              }
          });

          if (iCounter == 0) {
              alert()
          }
          e.preventDefault();
                    });


                </script>





                        <div class="row">
                            <div class="col-md-12">
                                <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 2px">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed tab" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" DataKeyNames="Std_RegNo" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

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
                                            <asp:TemplateField HeaderText="Reg.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="StdRegNo" Text='<%#Eval("Std_RegNo") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Roll_No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRollNo" Text='<%#Eval("RollNo") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDept" Text='<%#Eval("Dept_Name") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Semester">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSemester" Text='<%#Eval("Semester") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Session">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSession" Text='<%#Eval("Session") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UserName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsername" Text='<%#Eval("UserName") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPassword" Text='<%#Eval("Password") %>' runat="server"></asp:Label>
                                                    <asp:HiddenField ID="pr" runat="server"
                                                        Value='<%# Eval("Std_RegNo") %>' />
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

    <%--</ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger EventName="Click" ControlID="btnedit" />

        </Triggers>
    </asp:UpdatePanel>--%>

</asp:Content>

