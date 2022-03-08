<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtistNavBar.ascx.cs" Inherits="WAD.Controls.MasterPage.Right.ArtistNavBar" %>
<li class="nav-item" style="position: absolute; right: 240px; top: 30px;">
    <asp:LinkButton ID="LinkButton2" runat="server" Text="<i class='fa fa-plus' aria-hidden='true'></i> Add Artwork" PostBackUrl="~/Artist/AddArtwork.aspx" Style="color: #696969;" />
</li>
<li class="nav-item" style="position: absolute; right: 170px; top: 30px;">
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Artist/ArtistProfile.aspx" Style="color: #696969;"> <i class="fa fa-user" aria-hidden="true"></i> Profile</asp:LinkButton>
</li>
