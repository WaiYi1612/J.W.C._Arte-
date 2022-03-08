<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtistWelcome.aspx.cs" Inherits="WAD.Artist.ArtistWelcome" %>

<%@ Register Src="../Controls/ArtGenrePreference.ascx" TagName="ArtGenrePreference" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <div class="my-3 p-3 col-md-3">
            <uc1:ArtGenrePreference ID="ArtGenrePreference1" question="Welcome artist, what type of art will you be uploading?" runat="server" />
            <asp:Button ID="Button1" class="rounded-pill btn btn-primary" runat="server" OnClick="Button1_Click" Text="Submit" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
