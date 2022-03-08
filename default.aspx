<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WAD.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <asp:Label ID="Label1" runat="server" Text="Error 404"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Sorry, an unknown error has occured"></asp:Label>
    <br />--%>
    <%--   <img src="/ImageAsset_CC/CC404.png" class="img-fluid" alt="HomePage Image" style=" background-size: cover;" />
    <div class="text-center">
        <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" class="rounded-pill btn btn-primary" />
    </div>--%>
    <style>
        body {
            background: #dedede;
        }

        .page-wrap {
            min-height: 100vh;
        }
    </style>

    <div style="background: url(https://images.pexels.com/photos/7578657/pexels-photo-7578657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940)" class="page-holder bg-cover">

    <div class="page-wrap d-flex flex-row align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <span class="display-1 d-block">404</span>
                    <div class="mb-4 lead">The page you are looking for was not found.</div>
                    <a href="/HomePage/HomePage.aspx" class="btn btn-link">Back to Home</a>
                </div>
            </div>
        </div>
    </div>

        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
