<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="WAD.Artwork.AddArtwork" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--<div class="row justify-content-md-center">--%>
    
        <table class="auto-style2 center">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">
                    <asp:HiddenField ID="hfArtworkID" runat="server" />
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Image:</td>
                <td class="auto-style3">
                    <asp:Label ID="artistName" runat="server" align="left" valign="top" Style="font-weight: bold;">Artist</asp:Label>
                </td>
                <td class="auto-style1">
                    <br />
                    <asp:Label ID="lblName" runat="server" align="right" valign="top"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:FileUpload ID="artUpload" runat="server" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="artUpload" Display="Dynamic" ErrorMessage="Art picture is required." ForeColor="Red">Art picture is required.</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style3" align="left" valign="top" style="font-weight: bold;">Category</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="gallery_id" CssClass="txtStyle">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gallery]"></asp:SqlDataSource>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Name</td>
                <td class="auto-style1">

                    <asp:TextBox ID="txtArt" runat="server" class="txtStyle"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtArt" Display="Dynamic" ErrorMessage="Art name is required." ForeColor="Red">Art name is required.</asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Height</td>
                <td class="auto-style1">

                    <asp:TextBox ID="txtHeight" runat="server" class="txtStyle"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHeight" Display="Dynamic" ErrorMessage="Height column should be insert" ForeColor="Red">Height column should be insert</asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtHeight" ErrorMessage="The height should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">The height should be integer</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Width</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtWidth" runat="server" class="txtStyle"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtWidth" Display="Dynamic" ErrorMessage="Width should be insert" ForeColor="Red">Width should be insert</asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtWidth" ErrorMessage="The width should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">The width should be integer</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Quantity</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtQuant" runat="server" class="txtStyle"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuant" Display="Dynamic" ErrorMessage="Art quantity for sold not inserted" ForeColor="Red">Art quantity for sold not inserted</asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtQuant" ErrorMessage="The quantity should be integer" MaximumValue="100" MinimumValue="1" Type="Integer" ForeColor="Red">The quantity should be integer</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Price</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPrice" runat="server" class="txtStyle"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Art price for sold not inserted" ForeColor="Red">Art price for sold not inserted</asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="The price should be integer" MaximumValue="1000000" MinimumValue="1" Type="Integer" ForeColor="Red">The price should be integer</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style4" align="left" valign="top" style="font-weight: bold;">Date</td>
                <td class="auto-style1">
                    <asp:Label ID="lblDate" runat="server" Text="Label"><span id="datetime"></span></asp:Label>
                    <script>
                        var dt = new Date();
                        document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
                    </script>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td colspan="3" class="auto-style2">
                    <table>
                        <tr>
                            <td style="width:310px;">&nbsp;</td>
                            <td style="width:150px;">
                                <asp:LinkButton ID="btnAdd" runat="server" type="button" class="btn btn-outline-secondary" OnClick="btnAdd_Click"><i class="fa fa-plus" aria-hidden="true"></i>Add</asp:LinkButton>
                            </td>
                            <td class="size2">
                                <asp:LinkButton ID="btnClear" runat="server" OnClick="btnClear_Click1" type="button" class="btn btn-outline-secondary"><i class="fa fa-circle-o-notch" aria-hidden="true"></i>Clear</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    <%--</div>--%>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 311px;
        }

        .txtStyle {
            border-style: none;
            border-bottom: 1px solid black;
            background-color: transparent;
        }
        .center{
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style2 {
            height: 34px;
        }
    </style>
</asp:Content>
