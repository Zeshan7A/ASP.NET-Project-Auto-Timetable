<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="UpdateAttandance.aspx.cs" Inherits="UpdateAttandance" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
       <link href="dist/css/calendercss.css" rel="stylesheet" />
      <style>
        .tab
        {
            border-collapse: collapse;
            line-height: 2rem;
            font-size: 1rem;
            text-align: center;
            /*background-color:rgba(0,0,0,0.05);*/
        }

        .borderless td, .borderless th
        {
            border: none;
        }
          .dropdown-menu
          {
              min-width:6rem ;
          }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <asp:UpdatePanel ID="UpdatePanel1" EnableViewState="true" runat="server">
       
        <ContentTemplate>
     <div class="container-fluid" style="background-color: #f8f9fc;">
            <div class="row" style="padding: 18px 10px 0 10px;">
                <div class="col-sm-4 text-left">
                     Lecturer:<asp:Label ID="lbllecturer" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                 <div class="col-sm-4 text-center">
                      <div class="text-center">
                    <h3 style="font-family: cursive; color: #27a9e3;">Delete & Update Attandance</h3>
                </div>
                </div>
                 <div class="col-sm-4 text-right">
                      Current Session:<asp:Label ID="lblcurrentsession" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                </div>
            </div>       
            <hr />



         <div class="row" style="margin-top:40px;">
             <div class="col-sm-3" style="padding-bottom:80px;"> 
                    <div class="form-group">
                     <label for="exampleInputEmail1">Current Session</label>
                    <asp:DropDownList ID="ddlcurrentsession" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="True" TabIndex="4" DataSourceID="selectcurrentsession" DataTextField="Current_Session" DataValueField="Current_Session" OnSelectedIndexChanged="ddlcurrentsession_SelectedIndexChanged">
                        <asp:ListItem>--Select Current Session--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="selectcurrentsession" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT Current_Session FROM Class WHERE Class_Code=(SELECT max(Class_Code) FROM Class)"></asp:SqlDataSource>
                </div>
                     
                   <div class="form-group">
                     <label for="exampleInputEmail1">Session</label>
                    <asp:DropDownList ID="ddlsession" runat="server" CssClass="form-control" AutoPostBack="true" TabIndex="4" DataSourceID="selectingSession" DataTextField="Session_ID" DataValueField="Session_ID" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsession_SelectedIndexChanged">
                        <asp:ListItem>--Select Session--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="selectingSession" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Session_ID] FROM [Session] ORDER BY  [Session_ID] DESC"></asp:SqlDataSource>
                       <asp:Label ID="lblsession" runat="server" ForeColor="Red" Text=""></asp:Label>
                         </div>
                     <div class="form-group">
                     <label for="exampleInputEmail1">Semester</label>
                    <asp:DropDownList ID="ddlsemester" runat="server" CssClass="form-control" AppendDataBoundItems="true"  AutoPostBack="true" OnSelectedIndexChanged="ddlsemester_SelectedIndexChanged">
                                <asp:ListItem>--Select Semester--</asp:ListItem>               
                    </asp:DropDownList>
                </div>
                 <div class="form-group">
                     <label for="exampleInputEmail1">Subject</label>
                     <asp:DropDownList ID="ddlsubject" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true" TabIndex="4" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
                         <asp:ListItem>--Select Subject--</asp:ListItem>
                     </asp:DropDownList>
                 </div>
                 <div class="form-group">
                     <label>Select Date</label>
                     <asp:TextBox  ID="txtdate" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtdate_TextChanged" runat="server"></asp:TextBox>
                     <asp:ImageButton ID="imgPopup" runat="server" ImageUrl="~/assets/images/customimages/calendar.png"  Width="40px" Height="40px" />
                     <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" CssClass="cal_Theme1" TargetControlID="txtdate" Format="dd/MM/yyyy" />

                 </div>
                    <asp:Button ID="btnshow" runat="server" CssClass="btn btn-success btn-lg" Text="Show" OnClick="btnshow_Click"/>
                 
             </div>
             <div class="col-sm-9" id="grdviewrow" runat="server" visible="false">
                 <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 20px 0px" >
                     <asp:GridView ID="GridView1" OnRowDataBound="GridView1_RowDataBound" runat="server"  CssClass="table table-bordered table-condensed table-hover tab" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                         <FooterStyle BackColor="White" ForeColor="#000066" />
                         <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                         <RowStyle ForeColor="#000066" />
                         <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F1F1F1" />
                         <SortedAscendingHeaderStyle BackColor="#007DBB" />
                         <SortedDescendingCellStyle BackColor="#CAC9C9" />
                         <SortedDescendingHeaderStyle BackColor="#00547E" />
                         <PagerSettings Mode="Numeric"
                             Position="Bottom"
                             PageButtonCount="10" />

                         <PagerStyle BackColor="LightBlue"
                             Height="30px" CssClass="GridPager"
                             VerticalAlign="Bottom" Font-Size="X-Large"
                             HorizontalAlign="Center" />
                         <Columns>
                             <%--<asp:TemplateField HeaderText="Reg No.">
                                 <ItemTemplate>
                                     <asp:Label ID="hfStdRegNo" Text='<%#Eval("Std_RegNo") %>' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>--%>
                             <asp:TemplateField HeaderText="Roll No">
                                 <ItemTemplate>
                                     <asp:HiddenField ID="hfStdRegNo" runat="server" Value='<%# Eval("Std_RegNo") %>' />
                                     <asp:Label ID="RollNo" Text='<%#Eval("RollNo") %>' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Name">
                                 <ItemTemplate>
                                     <asp:Label ID="stdname" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Session">
                                 <ItemTemplate>
                                     <asp:Label ID="session" Text='<%#Eval("Session") %>' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Subject">
                                 <ItemTemplate>
                                     <asp:Label ID="lblesubject" Text='' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Subject">
                                 <ItemTemplate>
                                     <asp:Label ID="lbldate" Text='<%#Eval("EnrollDate") %>' runat="server"></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>                         
                             <asp:TemplateField HeaderText="Status">
                                 <ItemTemplate>
                                     <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>' Visible = "false" />
                                     <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AppendDataBoundItems="true">                                         
                                         <asp:ListItem>Present</asp:ListItem>
                                         <asp:ListItem>Absent</asp:ListItem>
                                         <asp:ListItem>Leave</asp:ListItem>
                                     </asp:DropDownList>
                                       <asp:HiddenField ID="enrollid" runat="server" Value='<%# Eval("enrolid") %>' />
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                      <%--<asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>--%>   
                                     <%--<asp:LinkButton runat="server" ID="btnRun" Text="<i class='fa fa-pencil-square'></i>  </asp:LinkButton>     
                                                        <asp:LinkButton runat="server" ID="LinkButton1" Text="<i class='fa fa-pencil-square'></i>" 
             --%>
                                  
                                     <asp:LinkButton CommandName="editt" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' runat="server" ID="LinkButton2" class="btn btn-mini"> <i class="fa fa-edit fa-2x" style="color:green;"  aria-hidden="true"></i>
                                         </asp:LinkButton>
                                      
                                     <asp:LinkButton runat="server" CommandName="dlt" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' ID="btnSubmit" class="btn btn-mini"> <i class="fa fa-trash fa-2x"  style="color:red;" aria-hidden="true">

                                        </i></asp:LinkButton>
                     
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>

                 </div>
                 <div>
                 </div>
                 <div class="d-flex justify-content-center">
                     <asp:Button ID="btnsubmitAttandance" runat="server" CssClass="btn btn-success btn-lg" OnClick="btnsubmitAttandance_Click" Text="Submit Attandance"></asp:Button>
                 </div>
             </div>

         </div>

        <%-- gridview--%>
           

         </div> <%--end container--%>
        </ContentTemplate>
       
    </asp:UpdatePanel>


</asp:Content>

