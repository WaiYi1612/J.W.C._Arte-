<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerNavBar.ascx.cs" Inherits="WAD.Controls.MasterPage.Right.CustomerNavBar" %>
<li class="nav-item" style="position: absolute; right: 240px; top: 30px;">
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/OrderCart/OrderCart.aspx" Style="color: #696969;" ><i class='fa fa-shopping-cart' aria-hidden='true'></i> Cart</asp:LinkButton>
</li>
<li class="nav-item" style="position: absolute; right: 170px; top: 30px;">
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Customer/CustomerProfile.aspx" Style="color: #696969;"> <i class="fa fa-user" aria-hidden="true"></i> Profile</asp:LinkButton>
</li>
