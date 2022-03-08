<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.ascx.cs" Inherits="WAD.Controls.ProfileSettings.UserProfile" %>
<style type="text/css">
    .auto-style1 {
        width: 345px;
    }
</style>
<script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>

<div class="container my-3 p-3">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="col-3" style="text-align: center">
                <asp:Image class="img-thumbnail bg-transparent rounded-circle" Style="height: 250px" ID="Image1" runat="server" />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right">
                <asp:Label ID="Label1" Style="font-weight: bold;" runat="server"></asp:Label></td>
            <td class="col-2">
                <asp:TextBox ID="TextBox1" CssClass="d-flex flex-column" TextMode="MultiLine" MaxLength="200" Rows="4" Width="350px" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" CssClass="error" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Address cannot be empty">*</asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right">
                <asp:Label ID="Label2" Style="font-weight: bold;" runat="server"></asp:Label></td>
            <td class="col-2">
                <asp:CheckBoxList ID="CheckBoxList1" RepeatColumns="3" runat="server" RepeatDirection="Horizontal" DataTextField="artGenreName" DataValueField="Id" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="col-3" style="text-align: center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                <br />
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" ForeColor="Green" Visible="false"></asp:Label>
                <br />
                <%-- Button is declared outside of user control--%>
            </td>
        </tr>
    </table>
</div>

