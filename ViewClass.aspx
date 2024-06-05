<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="ViewClass.aspx.cs" Inherits="ViewClass" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <div class="container-fluid" style="background-color:#f8f9fc;">
            <div class="row">
                <div class="col-sm-4 text-left">
                     Lecturer:<asp:Label ID="lbllecturer" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                </div>
                 <div class="col-sm-4 text-center">
                      <div class="text-center">
                    <h2 style="font-family: cursive; color: #27a9e3;" >My Classes</h2>
                </div>
                </div>
                 <div class="col-sm-4 text-right">
                      Current Session:<asp:Label ID="lblcurrentsession" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                </div>
            </div>       
            <hr />
             <div class="row">
                 <asp:Repeater ID="rptrclass" OnItemDataBound="rptrclass_ItemDataBound" runat="server">
                     <ItemTemplate>
                         <div class="col-md-6 col-lg-4 col-xlg-4">
                             <div class="card card-hover shadow" style="height: 180px;">
                                 <div class="box text-center">
                                     <h2 class="font-light"><%#Eval("Title")%> </h2>
                                        <h6><%#Eval("Semester")%></h6>
                                     <asp:HiddenField ID="hfclasscode" Value='<%#Eval("Class_Code")%> ' runat="server" />
                                    <p>  <span style="color:red;">Timing: </span><asp:Label ID="lblday" runat="server" ></asp:Label><%-- <span style="color:red;">Time:</span><h6><asp:Label ID="lblhour" runat="server"></asp:Label></h6>--%></p>
                                     <p>Dept: <%#Eval("Dept_Name") %></p>
                                     <%--<asp:Repeater ID="innerRepeater" OnItemDataBound="innerRepeater_ItemDataBound" runat="server">
                                         <ItemTemplate>
                                             <span style="color:red;">Days:</span><h6><%#Eval("Day")%></h6> <span style="color:red;">Time:</span><h6><%#Eval("Hour")%></h6>
                                         </ItemTemplate>
                                     </asp:Repeater>--%>
                                 </div>
                             </div>
                         </div>
                     </ItemTemplate>
                 </asp:Repeater>
             </div>
                    
                               
            
           
            </div> <!-- End Container fluid  -->  




</asp:Content>

