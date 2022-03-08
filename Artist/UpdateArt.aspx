<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateArt.aspx.cs" Inherits="WAD.Artwork.UpdateArt" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style7">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="artwork_id" class="auto-style8" GridLines="None">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Art" runat="server" Height="300px" Width="300px"
                                    ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </td>

            <td>
                <table class="auto-style10">
                    <tr>
                        <td class="auto-style9"></td>
                        <tr>
                            <td class="auto-style2" align="left" valign="top" style="font-weight:bold;">Category</td>
                            <td>
                                <asp:DropDownList ID="ddCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="gallery_id" CssClass="txtStyle">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gallery]">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="artwork_id" QueryStringField="id" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <br />
                                <br />                                
                            </td>

                        </tr>
                    <tr>
                        <td class="auto-style2" align="left" valign="top" style="font-weight:bold;">Name</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" class="txtStyle"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Art name is required." ForeColor="Red">Art name is required.</asp:RequiredFieldValidator>
                            <br />
                            <br />                                
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style2" align="left" valign="top" style="font-weight:bold;">Height</td>
                        <td>
                            <asp:TextBox ID="txtHeight" runat="server" class="txtStyle"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHeight" Display="Dynamic" ErrorMessage="Height column should be insert" ForeColor="Red">Height column should be insert</asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtHeight" ErrorMessage="The height should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">The height should be integer</asp:RangeValidator>
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style3" align="left" valign="top" style="font-weight:bold;">Width</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtWidth" runat="server" class="txtStyle"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtWidth" Display="Dynamic" ErrorMessage="Width should be insert" ForeColor="Red">Width should be insert</asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtWidth" ErrorMessage="The width should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">The width should be integer</asp:RangeValidator>
                        </td>
                        <td class="auto-style4"></td>
                    </tr>
                    <tr>
                        <td class="auto-style5" align="left" valign="top" style="font-weight:bold;">Quantity</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtQuantity" runat="server" class="txtStyle"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Art quantity for sold not inserted" ForeColor="Red">Art quantity for sold not inserted</asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtQuantity" ErrorMessage="The quantity should be integer" MaximumValue="100" MinimumValue="1" Type="Integer" ForeColor="Red">The quantity should be integer</asp:RangeValidator>
                        </td>
                        <td class="auto-style6"></td>
                    </tr>
                    <tr>
                        <td class="auto-style2" align="left" valign="top" style="font-weight:bold;">Price</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" class="txtStyle"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Art price for sold not inserted" ForeColor="Red">Art price for sold not inserted</asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="The price should be integer" MaximumValue="1000000" MinimumValue="1" Type="Integer" ForeColor="Red">The price should be integer</asp:RangeValidator>
                        </td>

                    </tr>

                    <tr>
                        <td class="auto-style2">
                            <asp:LinkButton ID="BtnUpdate" runat="server" type="button" class="btn btn-outline-secondary" OnClick="BtnUpdate_Click"><i class="fa fa-plus" aria-hidden="true"></i>Update</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="BtnCancel" runat="server" type="button" class="btn btn-outline-secondary" OnClick="BtnCancel_Click" PostBackUrl="~/Artist/ArtistProfile.aspx">Cancel</asp:LinkButton>
                        </td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style2 {
            width: 168px;
        }

        .auto-style3 {
            width: 168px;
            height: 66px;
        }

        .auto-style4 {
            height: 66px;
        }

        .auto-style5 {
            width: 168px;
            height: 96px;
        }

        .auto-style6 {
            height: 96px;
        }

        .auto-style7 {
            width: 472px;
        }

        .auto-style8 {
            margin-left: 0px;            
        }

        .auto-style9 {
            height: 55px;
        }

        .auto-style10 {
            width: 100%;
            margin-bottom: 20px;
        }

        .txtStyle {
            border-style: none;
            border-bottom: 1px solid black;
            background-color: transparent;
        }        
        
    </style>
</asp:Content>

