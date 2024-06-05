<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Dashboard</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <%--<ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>--%>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
        <div class="container-fluid">
                <div class="text-center">
                    <h1>
                        <asp:Label ID="lbldeptName" ForeColor="LightBlue" runat="server" Text=""></asp:Label> Department Admin</h1>
                </div>

           <div class="row">
                  <div class="col-md-6 col-lg-3 col-xlg-3">
                      <a href="DeleteUpdateFaculty.aspx">
                              <div class="card card-hover">
                            <div class="box text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                                  <img src="assets/images/customimages/presentation.png" />
                                                                  </i></h1>
                                <h6>Faculty</h6>
                            </div>
                        </div>
                      </a>
                    
                    </div>
                  <!-- Column -->
                     <div class="col-md-6 col-lg-3 col-xlg-3">
                           <a href="DeleteUpdateStd.aspx">
                        <div class="card card-hover">
                            <div class="box bg-white text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                      <img src="assets/images/customimages/graduated%20(1).png" />
                                                                  </i></h1>
                                <h6>Students</h6>
                            </div>
                        </div>
                               </a>
                    </div>
               <!-- Column -->
                   <div class="col-md-6 col-lg-3 col-xlg-3">
                       <a href="Course.aspx">
                        <div class="card card-hover">
                            <div class="box text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                   <img src="assets/images/customimages/books.png" />
                                                                  </i></h1>
                                <h6>Subjects</h6>
                            </div>
                        </div>
                           </a>
                    </div>
               <!-- Column -->
                    <div class="col-md-6 col-lg-3 col-xlg-3">
                        <a href="timetable.aspx">
                        <div class="card card-hover">
                            <div class="box  text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                   <img src="assets/images/customimages/book.png" />
                                                                  </i></h1>
                                <h6 >Timetable</h6>
                            </div>
                        </div>
                            </a>
                    </div>
           </div>
                    
              
           <%--<div class="row">
                  <div class="col-md-6 col-lg-3 col-xlg-3">
                      <a href="StudentsPromotion.aspx">
                        <div class="card card-hover">
                            <div class="box text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                      <img src="assets/images/customimages/graduation-hat.png" />
                                                                  </i></h1>
                                <h6>Promate Student</h6>
                            </div>
                        </div>
                          </a>
                    </div>
                  <!-- Column -->
                     <div class="col-md-6 col-lg-3 col-xlg-3">
                         <a href="PrintDMCs.aspx">
                        <div class="card card-hover">
                            <div class="box  text-center">
                                <h1 class="font-light text-white"><i class="fa-2x">
                      <img src="assets/images/customimages/printer.png" />
                                                                  </i> </h1>
                                <h6>Prints DMCs</h6>
                            </div>
                        </div>
                             </a>
                    </div>
          
           </div>
               <hr />--%>
                 
             <div class="row d-none">
                    <div class="col-md-6">
                        <h6>Enable or Disable Student Registration</h6>
                        <div class="btn-group" role="group" aria-label="Basic example">
                           <asp:Button ID="Button1" runat="server" CssClass="btn btn-rounded" Text="On" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" CssClass="btn  btn-rounded" Text="Off" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
                    
                                            
            <!-- End Container fluid  -->  
            </div>
           
            </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>

