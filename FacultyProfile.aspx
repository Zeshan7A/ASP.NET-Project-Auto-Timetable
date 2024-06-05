<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMasterPage.master" AutoEventWireup="true" CodeFile="FacultyProfile.aspx.cs" Inherits="FacultyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
/*Profile card 4*/
.profile-card-4 .card-img-block{
      float: left;
    width: 100%;
    height: 293px;
    overflow: hidden;
}
.profile-card-4 .card-body{
    position:relative;
}
.profile-card-4 .profile {
      border-radius: 50%;
    position: absolute;
    top: -75px;
    left: 45%;
    width: 200px;
    border: 2px solid rgba(255, 255, 255, 1);
    margin-left: -48px;
}
.profile-card-4 .card-img-block{
    position:relative;
}

.profile-card-4 h5{
        font-size: larger;
    /*color:#d90be1;*/
}
.profile-card-4 .card-text{
    font-weight:300;
    font-size:15px;
}
.profile-card-4 .icon-block{
    float:left;
    width:100%;
}
.profile-card-4 .icon-block a{
    text-decoration:none;
}
.profile-card-4 i {
  display: inline-block;
    font-size: 16px;
    color: #d90be1;
    text-align: center;
    border: 1px solid #d90be1;
    width: 30px;
    height: 30px;
    line-height: 30px;
    border-radius: 50%;
    margin:0 5px;
}
.profile-card-4 i:hover {
  /*background-color:#d90be1;
  color:#fff;*/
}
        .card .card-title
        {
            margin-bottom:0px;
            margin-top:80px;
        }
        @media (max-width: 766px)
        {
            .profile-card-4 .card-img-block{
      float: left;
    width: 100%;
    height: 353px;
    overflow: hidden;
}
            .profile-card-4 .profile {
      border-radius: 50%;
    position: absolute;
    top: -270px;
    left: 40%;
    width: 160px;
    border: 2px solid rgba(255, 255, 255, 1);
    margin-left: -48px;
}
           .card .card-title
        {
            margin-bottom:0px;
            margin-top:-143px;
        }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container br">
    <%--<div class="row">
    	<div class="col-md-12">
                        
            <div class="form">
                <div class="form-row">
                    <div class="form-group col-md-6">

                        <label for="first_name">
                            <h4>First name</h4>
                        </label>
                        <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                    </div>

                    <div class="form-group col-md-6">

                        <label for="last_name">
                            <h4>Last name</h4>
                        </label>
                        <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">



                        <label for="phone">
                            <h4>Phone</h4>
                        </label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                    </div>


                    <div class="form-group col-md-6">
                        <div class="col-xs-6">
                            <label for="mobile">
                                <h4>Mobile</h4>
                            </label>
                            <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">
                            <h4>Email</h4>
                        </label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                    </div>

                    <div class="form-group col-md-6">


                        <label for="email">
                            <h4>Location</h4>
                        </label>
                        <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="password">
                            <h4>Password</h4>
                        </label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                    </div>

                    <div class="form-group col-md-6">

                        <div class="col-xs-6">
                            <label for="password2">
                                <h4>Verify</h4>
                            </label>
                            <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                        </div>
                    </div>

                    <div class="form-group ">
                        <div class="col-xs-12">
                            <br>
                            <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>Save</button>
                            <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i>Reset</button>
                        </div>
                    </div>
                </div>

                <hr>
            </div>
               
                </div>
                
            </div>--%>
        
            
            <div class="row">
    		<!--Profile Card 4-->
    		<div class="col-md-12 mt-4">
    		    <div class="card profile-card-4 br">
                    <div class="card-img-block">
                        <img class="img-fluid card-img-top" src="assets/images/background/Dept22.jpg" alt="Card image cap">
                    </div>
                    <div class="card-body pt-5">
                        <img src="https://randomuser.me/api/portraits/women/14.jpg" alt="profile-image" class="profile"/>
                       
                        <div class="card-title text-center">
                            Prof_Num: <asp:Label ID="Label1" CssClass="col-form-label" runat="server" Text=""></asp:Label>
                            Name: <asp:Label ID="Label2" runat="server"  CssClass="col-form-label" Text=""></asp:Label>
                        </div>
                        
                        <p class="card-text text-center">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       
                           <div class="row m-t-30">
    	<div class="col-md-12">
                        
            <div class="form">
                <div class="form-row">
                    <div class="form-group col-md-6">

                        <label for="first_name">
                            <h4>First name</h4>
                        </label>
                        <input type="text" class="form-control" name="first_name" id="Text1" placeholder="first name" title="enter your first name if any.">
                    </div>

                    <div class="form-group col-md-6">

                        <label for="last_name">
                            <h4>Last name</h4>
                        </label>
                        <input type="text" class="form-control" name="last_name" id="Text2" placeholder="last name" title="enter your last name if any.">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">



                        <label for="phone">
                            <h4>Phone</h4>
                        </label>
                        <input type="text" class="form-control" name="phone" id="Text3" placeholder="enter phone" title="enter your phone number if any.">
                    </div>


                    <div class="form-group col-md-6">
                        <div class="col-xs-6">
                            <label for="mobile">
                                <h4>Mobile</h4>
                            </label>
                            <input type="text" class="form-control" name="mobile" id="Text4" placeholder="enter mobile number" title="enter your mobile number if any.">
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">
                            <h4>Email</h4>
                        </label>
                        <input type="email" class="form-control" name="email" id="email1" placeholder="you@email.com" title="enter your email.">
                    </div>

                    <div class="form-group col-md-6">


                        <label for="email">
                            <h4>Location</h4>
                        </label>
                        <input type="email" class="form-control" id="Email2" placeholder="somewhere" title="enter a location">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="password">
                            <h4>Password</h4>
                        </label>
                        <input type="password" class="form-control" name="password" id="password1" placeholder="password" title="enter your password.">
                    </div>

                    <div class="form-group col-md-6">

                        <div class="col-xs-6">
                            <label for="password2">
                                <h4>Verify</h4>
                            </label>
                            <input type="password" class="form-control" name="password2" id="password3" placeholder="password2" title="enter your password2.">
                        </div>
                    </div>

                </div>
                
                    <div class="text-right">
                    
                            <button class="btn btn-lg btn-success" type="submit">Update Profile</button>
                        
                    </div>
            </div>
               
                </div>
                
            </div>
        



                    </div>
                </div>
    		</div>
    	</div>

        </div> <%--container end--%>

</asp:Content>

