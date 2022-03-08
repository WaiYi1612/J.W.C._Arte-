<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WAD.Payment.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;
    </p>
    <h2 style="position: inherit; z-index: auto; text-align: center">&nbsp;<u>Payment</u></h2>
    <!-- Receipt Table -->
    <asp:GridView ID="GridView1"  HorizontalAlign="Center" Width="650px"
        runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Order Id" HeaderText="Order Id" ItemStyle-Width="80" >
                <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Artwork Name" HeaderText="Artwork Name" ItemStyle-Width="150">
                <ItemStyle Width="350px" HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Price (MYR)" HeaderText="Price (MYR)" ItemStyle-Width="150" HeaderStyle-HorizontalAlign ="Right"  DataFormatString="{0:n}" >
                <ItemStyle Width="100px" HorizontalAlign="Right"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

        <HeaderStyle BackColor="#e8d9c3" ForeColor="#000000" Font-Bold="True" HorizontalAlign="Center"></HeaderStyle>

        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <!-- Total Payment Fees Table -->
    <p>
        &nbsp;
        <asp:DetailsView ID="PaymentDetailView" runat="server" AutoGenerateRows="False" Height="50px" Width="650px" CaptionAlign="Right" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Shipment Price (MYR)" HeaderText="Shipment Price (MYR)" ReadOnly="True" SortExpression="Shipment Price (MYR)" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Total Artwork Price (MYR)" HeaderText="Total Artwork Price (MYR)" ReadOnly="True" SortExpression="Total Artwork Price (MYR)" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:n}">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Total Amount (MYR)" HeaderText="Total Amount (MYR)" ReadOnly="True" SortExpression="Total Amount (MYR)" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(OrderCart.shipment_Price) AS [Shipment Price (MYR)], SUM(OrderCart.quantity * Artwork.price) AS [Total Artwork Price (MYR)], SUM(OrderCart.shipment_Price) + SUM(OrderCart.quantity * Artwork.price) AS [Total Amount (MYR)] FROM Artwork INNER JOIN OrderCart ON Artwork.artwork_id = OrderCart.artwork_id WHERE(OrderCart.status = 'unpaid')"></asp:SqlDataSource>--%>
    </p>
    <table class="auto-style1" style="width: 650px; height: 100px; margin: 0 auto;">
        <tr>
            <td width="300px"><strong>Payment Method</strong></td>
            <td>
                <asp:RadioButtonList ID="radPayMethod" runat="server" RepeatDirection="Horizontal" Width="250px">
                    <asp:ListItem>&nbsp;Visa </asp:ListItem>
                    <asp:ListItem>&nbsp;Master </asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please select payment method.<br />" ControlToValidate="radPayMethod" runat="server" ForeColor="Red" Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td width="300px"><strong>Credit Card Number</strong>
            </td>
            <td>
                <asp:TextBox ID="txtCCNum" runat="server" MaxLength="100" TextMode="Number" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3"
                    runat="server"
                    ControlToValidate="txtCCNum"
                    Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ID="cvCreditCardNumberValidator"
                    ControlToValidate="txtCCNum"
                    ErrorMessage="Invalid credit card number." CssClass="error"
                    Display="Dynamic" OnServerValidate="ValidateCreditCardNumber"
                    ClientValidationFunction="validateCreditCardNumber"
                    ValidationGroup="Card"
                    ValidateEmptyText="True" ForeColor="Red">
                </asp:CustomValidator>
                <script type="text/javascript">
                    function validateCreditCardNumber(sender, args) {
                        var patt = new RegExp("[^0-9 -]+");
                        if (patt.test(args.Value) == true) {
                            args.IsValid = false;
                        } else {
                            var temp = String(args.Value).replace(/[^0-9]/g, "");
                            if (temp.length < 10) {
                                args.IsValid = false;
                                return;
                            }

                            var s1 = 0;
                            var s2 = 0;

                            var reverse = temp.split("").reverse().join("");
                            for (var i = 0; i < reverse.length; i++) {
                                var digit = parseInt(reverse.charAt(i), 10);
                                if (i % 2 == 0) {
                                    s1 += digit;
                                } else {
                                    s2 += 2 * digit;
                                    if (digit >= 5) {
                                        s2 -= 9;
                                    }
                                }
                            }

                            args.IsValid = ((s1 + s2) % 10 == 0);
                        }
                    }
                </script>
            </td>
        </tr>
        <tr>
            <td width="300px"><strong>Transaction Date</strong>
            </td>
            <td>
                <asp:Label ID="lblDate" runat="server" Text="Label"><span id="datetime"></span></asp:Label>
                <script>
                    var dt = new Date();
                    document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
                </script>
            </td>
        </tr>
        <tr>
            <td width="300px"><strong>Delivery Address</strong>
            </td>
            <td>
                <asp:TextBox ID="txtdeliveryAdd" runat="server" TextMode="MultiLine" MaxLength="200" Rows="4" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4"
                    runat="server"
                    ControlToValidate="txtdeliveryAdd"
                    Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2"
                    runat="server"
                    ValidationExpression="(.*?)([\d]*)((?:\s[^\d,]*)*)[\s,]*(\s[\w]*)$"
                    ControlToValidate="txtdeliveryAdd"
                    ErrorMessage="Input valid delivery address" ForeColor="Red">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="300px"><strong>Send Receipt E-mail</strong>
            </td>
            <td>
                <asp:TextBox ID="txtRemail" runat="server" TextMode="Email" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2"
                    runat="server"
                    ControlToValidate="txtRemail"
                    Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1"
                    runat="server"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtRemail"
                    ErrorMessage="Input valid email address" ForeColor="Red">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <p>
        &nbsp;
    </p>

    <!-- button -->
    <div class="text-center">
        <asp:LinkButton ID="confirmPay" runat="server" CssClass="btn btn-group" Style="background-color: #ff8b3d; border-radius: 20px; width: 150px;" OnClick="confirmPayBtn_Click" OnClientClick="Confirm Pay?"><i class="fa fa-check-circle-o" ara-hidden="true" style="margin:auto; width: 15px;"></i> Confirm Pay &nbsp; </asp:LinkButton>
    </div>

    <br />
    <div class="text-center">
        <%--<asp:LinkButton ID="discardPay" runat="server" CssClass="btn btn-group" Style="background-color: #C1C1C1; border-radius: 20px; width: 150px;"  PostBackUrl="/OrderCart/OrderCart.aspx" OnClick="discardPayBtn_Click1" ><i class="fa fa-shopping-cart" aria-hidden="true" style="margin:auto; width: 15px;"></i> Back To Cart &nbsp; </asp:LinkButton>--%>
    </div>

    <p>
        &nbsp;
    </p>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
