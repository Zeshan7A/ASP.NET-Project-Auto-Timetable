<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterPage.master" AutoEventWireup="true" CodeFile="StudentDashboard.aspx.cs" Inherits="StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container-fluid" style="background-color:#f8f9fc;">
            <div class="row">
                <div class="col-sm-4 text-left">
                     Current Semester:<asp:Label ID="lblsemester" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                </div>
                 <div class="col-sm-4 text-center">
                      <div class="text-center">
                    <h2 style="font-family:cursive;">Student Dashboard</h2>
                </div>
                </div>
                 <div class="col-sm-4">

                </div>
            </div>
        
            <hr />
           <div class="row">
                  <div class="col-md-6 col-lg-3 col-xlg-3">
                      <a href="ViewTimetableStd.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light">
                                    <i class="fa-2x">
                      <img src="assets/images/customimages/book.png" />
                                    </i></h1>
                                <h6>Timetable</h6>
                            </div>
                        </div>
                          </a>
                    </div>
                  <!-- Column -->
                     <div class="col-md-6 col-lg-3 col-xlg-3">
                         <a href="UpdateProfeile.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light"><i class="fa-2x">
                      <img src="assets/images/customimages/graduated%20(1).png" />
                                                       </i></h1>
                                <h6>Update Profile</h6>
                            </div>
                        </div>
                                                     </a>
                    </div>        
           </div>                                        
            
            <!-- End Container fluid  -->  
            </div>

</asp:Content>

