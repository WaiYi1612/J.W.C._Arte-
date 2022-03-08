<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactForm.ascx.cs" Inherits="WAD.Controls.ProfileSettings.ContactForm" %>

<script type="text/javascript">
    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
</script>

<div class="controls">
    <div class="row flex-column flex-row">
        <div class="col-md-12">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Message"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox1" CssClass="flex-column" runat="server" MaxLength="1000" Rows="4" Width="550px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Message Cannot be empty" ForeColor="Red" ControlToValidate="TextBox1" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                <br />
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" ForeColor="Green" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Button ID="Button1" CssClass="btn btn-success btn-send flex-column" runat="server" OnClick="Button1_Click" Text="Send Message" />
        </div>
    </div>
</div>
