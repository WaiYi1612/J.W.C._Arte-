<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignInType.aspx.cs" Inherits="WAD.SignIn_SignUp.SignInType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-3 p-3">
        <asp:Label ID="Label1" class="h1" runat="server" Text="Login"></asp:Label>
        <br />
        
        
        <br />
        <table class="container" style="width: 100%;">
            <tr class="row">
                <td class="col-md-4">
                    <asp:Image class="img-thumbnail bg-transparent" ID="Image1" runat="server" ImageUrl="~/Assets/Images/customer.png" style="width:300px;height:300px;vertical-align:middle; text-align:center;"/>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Customer" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="This is where people can view and buy arts in the gallery."></asp:Label>
                    <br />
                    <asp:Button ID="Button1" class="rounded-pill btn btn-primary" runat="server" PostBackUrl="~/SignIn_SignUp/SignIn.aspx?type=Customer" Text="Customer Sign In"/>
                </td>
                <td class="col-md-4">
                    <asp:Image class="img-thumbnail bg-transparent" ID="Image2" runat="server" ImageUrl="~/Assets/Images/artist.png" style="width:300px;height:300px;" />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Artist" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Artist get to show their talents and get to sell their artwork."></asp:Label>
                    <br />
                    <asp:Button ID="Button2" class="rounded-pill btn btn-primary" runat="server" PostBackUrl="~/SignIn_SignUp/SignIn.aspx?type=Artist" Text="Artist Sign In" />
                </td>
                <td class="col-md-4 align-self-center">
                    <asp:Image class="img-thumbnail bg-transparent" ID="Image3" runat="server"  ImageUrl="~/Assets/Images/user.png" style="width:300px;height:300px;"/>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Don't have an account?" Font-Bold="true"></asp:Label>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Join the community of art selling and buying."></asp:Label>
                    <br />
                    <asp:Button ID="Button3" class="rounded-pill btn btn-primary" runat="server" Text="Sign Up Here" PostBackUrl="~/SignIn_SignUp/SignUp.aspx" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
