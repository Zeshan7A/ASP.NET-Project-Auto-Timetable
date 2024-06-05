<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="LecturerDashboard.aspx.cs" Inherits="LecturerDashboard" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
            <!-- Container fluid rgba(0,0,0,0.05);   -->
            <!-- ============================================================== --> 
        <div class="container-fluid" style="background-color:#f8f9fc;">
            <div class="row">
                <div class="col-sm-4 text-left">
                     Lecturer:<asp:Label ID="lbllecturer" runat="server" CssClass="form-control-lg" Text=""></asp:Label> 
                </div>
                 <div class="col-sm-4 text-center">
                      <div class="text-center">
                    <h2 style="font-family: cursive; color: #27a9e3;">Lecturer Dashboard</h2>
                </div>
                </div>
                 <div class="col-sm-4">

                </div>
            </div>
        
            <hr />
           <div class="row">
                  <div class="col-md-6 col-lg-3 col-xlg-3">
                      <a href="ViewClass.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light">
                                    <i class="fa-2x">
                                        <img src="assets/images/customimages/testingimage/reading-book.png" />
                                    </i>

                                </h1>
                                <h6>My Class</h6>
                            </div>
                        </div>
                      </a>
                    </div>
                <div class="col-md-6 col-lg-3 col-xlg-3">
                    <a href="UpdateFacultyProfile.aspx">
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
               <div class="col-md-6 col-lg-3 col-xlg-3">
                    <a href="ViewTimetableFaculty.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light"><i class="fa-2x">
                                    <img src="assets/images/customimages/book.png" />
                                </i></h1>
                                <h6>View Timetable</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <%--  <!-- Column -->
                     <div class="col-md-6 col-lg-3 col-xlg-3">
                          <a href="Attandance.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light">
                                    <i class="fa-2x">
                     <img src="assets/images/customimages/testingimage/attendance.png" />
                                    </i></h1>
                                <h6>Attandance</h6>
                            </div>
                        </div>
                            </a>
                    </div>
               <!-- Column -->
                   <div class="col-md-6 col-lg-3 col-xlg-3">
                        <a href="Midterm.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light">
                                    <i class="fa-2x">
                   <img src="assets/images/customimages/testingimage/test.png" />
                                    </i></h1>
                                <h6>Marking</h6>
                            </div>
                        </div>
                            </a>
                    </div>
               <!-- Column -->
                    <div class="col-md-6 col-lg-3 col-xlg-3 ">
                        <a href="midawardlist.aspx">
                        <div class="card card-hover shadow">
                            <div class="box text-center">
                                <h1 class="font-light">
                                    <i class="fa-2x">
<img src="assets/images/customimages/testingimage/completed-task%20(1).png" />
                                    </i> </h1>
                                <h6>Awardlists</h6>
                            </div>
                        </div>
                    </a>
                            </div>--%>
           </div>
                    

                    
            
            <!-- End Container fluid  -->  
            </div>

</asp:Content>

