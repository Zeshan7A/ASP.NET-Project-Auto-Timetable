<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
       <%--<link href="dist/css/icons.css" rel="stylesheet" />--%>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/newtablogo.png"/>
    <title>Login</title>
    <!-- Custom CSS -->
    <link href="assets/libs/flot/css/float-chart.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <link href="dist/css/style.min.css" rel="stylesheet" />
          <%--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>--%>
    <style>
            body {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 10s ease infinite;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
    </style>
</head>
<body>
   
    <form id="form1" runat="server">
    <div>
      <!-- Login box.scss -->
        <!-- ============================================================== style="background-image: url(assets/images/bg.jpg);background-size: cover;"-->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" >           
            <div class="auth-box  border-top border-secondary" style="border-radius: 20px; background: rgb(0, 0, 0); background: rgba(0, 0, 0, 0.5);">
                <div id="loginform">
                    <div class="text-center" style="padding-top:20px;padding-bottom:20px;" >
                        <span class="db" style="font-size: 2rem; font-weight: bold; color:white;font-family: cursive;"> Here you can login</span>
                    </div>
                    <div class="alert alert-light" role="alert" runat="server" id="ErrorMessageAlert" visible="false" >
                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>   
                    </div>
                    <!-- Form -->
                 <div class="form-horizontal m-t-20" id="Form2" ">
                        <div class="row">
                            <div class="col-12">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white" id="basic-addon1"><i class="ti-user"></i></span>
                                    </div>
                                    <%--<input type="text" class="form-control form-control-lg" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required="">--%>
                                    <asp:TextBox ID="txtusername" class="form-control form-control-lg" EnableViewState="true" placeholder="Username" aria-describedby="basic-addon1" required="" runat="server"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-warning text-white" id="basic-addon2"><i class="ti-key"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtpassword" TextMode="Password" class="form-control form-control-lg" placeholder="Password" aria-describedby="basic-addon1" required="" runat="server"></asp:TextBox>

                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-primary text-white" id="Span2"><i class="ti-user"></i></span>
                                    </div>
                               <asp:DropDownList ID="ddlrole" class="form-control form-control-lg" aria-describedby="basic-addon1"  runat="server">
                                      <asp:ListItem>--Select role--</asp:ListItem>
                                      <asp:ListItem>Dept Admin</asp:ListItem>
                                    <asp:ListItem>Student</asp:ListItem>
                                    <asp:ListItem>Lecturer</asp:ListItem>
                              </asp:DropDownList>
                             </div>
                            </div>
                        </div>
                        <div class="row border-top border-secondary">
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="p-t-20">
                                       <%-- <button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-lock m-r-5"></i> Lost password?</button>
                                       <a href="Default.aspx">Go home</a>  --%>   
                                        <asp:HyperLink ID="HyperLink2"  NavigateUrl="~/Bootstrap/Home.aspx" CssClass="btn btn-danger btn-lg float-left" runat="server">Cancel</asp:HyperLink>
                                      
                                        <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-success btn-lg float-right" Text="login" OnClick="btnlogin_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="recoverform">
                    <div class="text-center">
                        <span class="text-white">Enter your e-mail address below and we will send you instructions how to recover a password.</span>
                    </div>
                    <div class="row m-t-20">
                        <!-- Form -->
                        <div class="col-12" ">
                            <!-- email -->
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-danger text-white" id="Span1"><i class="ti-email"></i></span>
                                </div>
                                <input type="text" class="form-control form-control-lg" placeholder="Email Address" aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <!-- pwd -->
                            <div class="row m-t-20 p-t-20 border-top border-secondary">
                                <div class="col-12">
                                    <a class="btn btn-success" href="#" id="to-login" name="action">Back To Login</a>
                                    <button class="btn btn-info float-right" type="button" name="action">Recover</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
    </div>
    </form>

     <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="assets/libs/flot/excanvas.js"></script>
    <script src="assets/libs/flot/jquery.flot.js"></script>
    <script src="assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="assets/libs/flot/jquery.flot.time.js"></script>
    <script src="assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="dist/js/pages/chart/chart-page-init.js"></script>
</body>
</html>
