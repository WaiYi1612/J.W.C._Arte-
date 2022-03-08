<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WAD.HomePage.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>

    <div id="demo" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/ImageAsset_CC/J.jpg" alt="Join us" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>Join Us</h3>
                    <p>We could have such a great time in JWC Arte!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/ImageAsset_CC/W.jpg" alt="Welcome" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>Welcome</h3>
                    <p>Anywhere, anytime, anyone, we're welcome.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/ImageAsset_CC/C.jpg" alt="Celebrate" width="1100" height="500">
                <div class="carousel-caption">
                    <h3>Celebrate</h3>
                    <p>We celebrate for each of you master piece!</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>

    <div class="bg-white py-5">
  <div class="container py-5">
    <div class="row align-items-center mb-5">
      <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-picture-o fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-light">Artwork</h2>
        <p class="font-italic text-muted mb-4">“Art is the only serious thing in the world. And the artist is the only person who is never serious.” ― Oscar Wilde</p><a href="/Artwork/Artwork.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
      <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><img src="https://cf.shopee.com.my/file/5eb33efcc0d9a159c3ae6f1cf3f93ba1" alt="" class="img-fluid mb-4 mb-lg-0"></div>
    </div>
    <div class="row align-items-center">
      <div class="col-lg-5 px-5 mx-auto"><img src="https://i.natgeofe.com/n/7dc91a1d-8d26-408e-97bd-1373119fa260/01_genius_camera_2x3.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
      <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
        <h2 class="font-weight-light">Sign In </h2>
        <p class="font-italic text-muted mb-4">There are 2 role in this website which are buyers and sellers. Pick one to sign in.</p><a href="/SignIn_SignUp/SignInType.aspx" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
      </div>
    </div>
  </div>
</div>

 
</asp:Content>
