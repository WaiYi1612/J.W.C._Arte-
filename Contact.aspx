<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WAD.ContactForm" %>

<%@ Register Src="~/Controls/ContactForm.ascx" TagPrefix="uc1" TagName="ContactForm" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterNavBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightNavBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-3 p-3">
        <div class="container d-flex flex-column justify-content-center">
            <div class="d-inline-flex p-2" style="border-radius: 15px;">
                <uc1:ContactForm runat="server" ID="cf1" />
            </div>
        </div>
    </div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
  


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
