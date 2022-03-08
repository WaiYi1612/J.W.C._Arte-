<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.ascx.cs" Inherits="WAD.Controls.UserProfile" %>
<table style="width: 100%;">
    <tr>
        <td rowspan="4" class="col-4">
            <asp:Image class="img-thumbnail bg-transparent rounded-circle" ID="Image1" runat="server" />

        </td>
        <td class="col-2" style="text-align: right">
            <asp:Label ID="Label3" style="font-weight: bold;" runat="server"></asp:Label></td>
        <td class="col-4">
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: right" class="col-2">
            <asp:Label ID="Label1" style="font-weight: bold;" runat="server"></asp:Label></td>
        <td class="col-4">
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="col-2" style="text-align: right">
            <asp:Label ID="Label2" style="font-weight: bold;" runat="server"></asp:Label></td>
        <td class="col-4">
            <asp:Label ID="lblTotalArtwork" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="col-2" style="text-align: right">
            <asp:Label ID="Label4" style="font-weight: bold;" runat="server"></asp:Label></td>
        <td class="col-4">
            <asp:Label ID="lblGenre" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="col-4">&nbsp;</td>
        <td class="col-6" colspan="2" style="text-align: center">
            <asp:Button class="rounded-pill btn btn-primary btn-lg btn-block" ID="Button1" runat="server"  />
        </td>
    </tr>
    <tr>
        <td class="col-4">&nbsp;</td>
        <td class="col-6" colspan="2" style="text-align: center">
            <asp:Button class="rounded-pill btn btn-primary btn-lg btn-block" ID="Button2" runat="server"  />
        </td>
    </tr>
</table>
