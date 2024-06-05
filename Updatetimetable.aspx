<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Updatetimetable.aspx.cs" Inherits="Updatetimetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         function openModal() {
             $('#exampleModal').modal('show');
         }
    </script>
     <style>
        .tab
        {
            border-collapse: collapse;
            line-height: 2rem;
            /*font-size: 1rem;*/
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid bg-white">

        <!-- Modal -->
          <div class="modal fade bd-example-modal-lg" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                                  <div class="modal-body">
                            
                                <div class="form-group">
                                    <label class="col-form-label">Professor</label>
                                    <asp:DropDownList ID="mddlProfessor" CssClass="form-control" runat="server"  AppendDataBoundItems="false">                                        
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Semester</label>
                                    <asp:DropDownList ID="mddlsemester" CssClass="form-control" runat="server" DataSourceID="SqlDataSource8" AutoPostBack="true"  OnSelectedIndexChanged="mddlsemester_SelectedIndexChanged" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true"  >                                      
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label class="col-form-label">Subject</label>
                                    <asp:DropDownList ID="mddlsubject" CssClass="form-control" AppendDataBoundItems="false" runat="server">                                     
                                    </asp:DropDownList>

                                </div>

                                <div class="form-group">
                                    <label class="col-form-label">Class time</label>
                                    <asp:TextBox ID="txttimem" CssClass="form-control" runat="server" placeholder="Class time"></asp:TextBox>
                                </div>
                         
                           
                                <div class="form-group">
                                    <label class="col-form-label">Semester Year</label>
                                    <asp:TextBox ID="txtyearm" CssClass="form-control" runat="server" placeholder="Semester Year...Fall or Spring"></asp:TextBox>
                                </div>
                           
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success btn-lg" Text="Update" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Popup -->






             <!-- filter row -->
 <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Professor</label>
        <asp:DropDownList ID="sddlprofessor" CssClass="form-control" AutoPostBack="true" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="sddlprofessor_SelectedIndexChanged1">
        </asp:DropDownList>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Current_Session</label>
        <asp:DropDownList ID="ddlSemesterYear" class="form-control" AppendDataBoundItems="true" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlSemesterYear_SelectedIndexChanged" DataSourceID="SelectCurrentSession" DataTextField="Current_Session" DataValueField="Current_Session">
            <asp:ListItem>--Select Current Session--</asp:ListItem>         
        </asp:DropDownList>
        <asp:SqlDataSource ID="SelectCurrentSession" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT Current_Session FROM Class WHERE Class_Code=(SELECT max(Class_Code) FROM Class)"></asp:SqlDataSource>
    </div>
     <div class="form-group col-md-4">
      <label for="inputPassword4">Semester</label>
         <asp:DropDownList ID="sddlsemester" CssClass="form-control" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource4" DataTextField="Semester" DataValueField="Semester" AppendDataBoundItems="true" OnSelectedIndexChanged="sddlsemester_SelectedIndexChanged">
             <asp:ListItem>--Select Semester--</asp:ListItem>
         </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Semester] FROM [Semester]"></asp:SqlDataSource>
     </div>
  </div>
                <!--filter row-->


        
            <!-- gridview -->
                <div class="row">
                    <div class="col-md-12">
                        <div style="width: 100%; overflow-x: scroll; box-shadow: 0px 0px 10px 0px; margin-top: 1.3rem;">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed tab" OnRowCommand="GridView1_RowCommand" AllowPaging="true" AutoGenerateColumns="false" DataKeyNames="Class_Code" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

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
                                    <asp:TemplateField HeaderText="Class Code">
                                        <ItemTemplate>
                                            <asp:Label ID="classCode" Text='<%#Eval("Class_Code") %>' runat="server"></asp:Label>
                                        </ItemTemplate>                                    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Professor">
                                        <ItemTemplate>
                                            <asp:Label ID="lbname" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class">
                                        <ItemTemplate>
                                            <asp:Label ID="lbtitle" Text='<%#Eval("Title") %>' runat="server"></asp:Label>
                                             <asp:HiddenField ID="courscode" runat="server" Value='<%# Eval("Course_Code") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Hours">
                                        <ItemTemplate>
                                            <asp:Label ID="lbhour" Text='<%#Eval("Credit_Hour") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class time">
                                        <ItemTemplate>
                                            <asp:Label ID="lbtime" Text='<%#Eval("Class_Time") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semester">
                                        <ItemTemplate>
                                            <asp:Label ID="lbsemester" Text='<%#Eval("Semester") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semester_Year">
                                        <ItemTemplate>
                                            <asp:Label ID="lbCurrentSession" Text='<%#Eval("Current_Session") %>' runat="server"></asp:Label>
                                            <asp:HiddenField ID="pr" runat="server" Value='<%# Eval("Class_Code") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnedit" ImageUrl="~/assets/images/customimages/edit.png" runat="server" CommandName="slt" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'  ToolTip="Select Record" Width="35px" Height="35px" />
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/customimages/Delete.png" runat="server" CommandName="Delete" ToolTip="Delete Record" Width="35px" Height="35px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <PagerSettings Mode="Numeric"
                                    Position="Bottom"
                                    PageButtonCount="10" />

                                <PagerStyle BackColor="LightBlue"
                                    Height="30px"
                                    VerticalAlign="Bottom" Font-Size="X-Large" CssClass="GridPager"
                                    HorizontalAlign="Center" />

                            </asp:GridView>
                        </div>
                        <div class="text-right">
                            <asp:Button ID="btnReset" runat="server" CssClass="btn btn-primary" Text="Reset"/>
                        </div>

                    </div>
                </div>
          <!-- gridview -->



    </div> <!--Container-fluid-->  
</asp:Content>

