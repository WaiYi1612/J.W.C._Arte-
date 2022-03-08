<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtworkDetails.aspx.cs" Inherits="WAD.Artwork.ArtworkDetails" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="background-color:#E9E8E2">
        <div class="table-responsive-xl">
            <div class="container">
                <div class="row justify-content-md-center">
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artwork_id], [name], [image], [price], [status], [size_height], [size_width] FROM [Artwork] WHERE ([artwork_id] = @artwork_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="artwork_id" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <asp:ListView ID="ListView1" runat="server" DataKeyNames="artwork_id" DataSourceID="SqlDataSource1">
                                    <AlternatingItemTemplate>
                                        <span style="">

                                            <asp:Image ID="Art" runat="server" Height="500px" Width="500px"
                                                ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                            <br />
                                            artwork_id:
                                <asp:Label ID="artwork_idLabel" runat="server" Text='<%# Eval("artwork_id") %>' />
                                            <br />
                                            name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                            <br />
                                            price:
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                            <br />
                                            status:
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                            <br />
                                            size_height:
                                <asp:Label ID="size_heightLabel" runat="server" Text='<%# Eval("size_height") %>' />
                                            <br />
                                            size_width:
                                <asp:Label ID="size_widthLabel" runat="server" Text='<%# Eval("size_width") %>' />
                                            <br />
                                            <br />
                                        </span>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <span style="">

                                            <asp:Image ID="Art" runat="server" Height="500px" Width="500px"
                                                ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                            <br />
                                            artwork_id:
                                <asp:Label ID="artwork_idLabel1" runat="server" Text='<%# Eval("artwork_id") %>' />
                                            <br />
                                            name:
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                            <br />
                                            price:
                                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                                            <br />
                                            status:
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                            <br />
                                            size_height:
                                <asp:TextBox ID="size_heightTextBox" runat="server" Text='<%# Bind("size_height") %>' />
                                            <br />
                                            size_width:
                                <asp:TextBox ID="size_widthTextBox" runat="server" Text='<%# Bind("size_width") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            <br />
                                            <br />
                                        </span>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <span>No data was returned.</span>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <span style="">image:
                                <asp:Image ID="Art" runat="server" Height="500px" Width="500px"
                                    ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                            <br />
                                            name:
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                                            <br />
                                            price:
                                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                                            <br />
                                            status:
                                <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
                                            <br />
                                            size_height:
                                <asp:TextBox ID="size_heightTextBox" runat="server" Text='<%# Bind("size_height") %>' />
                                            <br />
                                            size_width:
                                <asp:TextBox ID="size_widthTextBox" runat="server" Text='<%# Bind("size_width") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            <br />
                                            <br />
                                        </span>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <span style="">

                                            <asp:Image ID="Art" runat="server" Height="500px" Width="500px"
                                                ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                            <br />


                                            <b>Artwork ID:</b>

                                            <asp:Label ID="artwork_idLabel" runat="server" Text='<%# Eval("artwork_id") %>' />
                                            <br />

                                            <b>Name:</b>
                                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                            <br />
                                            <b>Price:</b>
                                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                            <br />
                                            <b>Status:</b>
                                            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                            <br />
                                            <b>Size Height:</b>
                                            <asp:Label ID="size_heightLabel" runat="server" Text='<%# Eval("size_height") %>' />
                                            <br />
                                            <b>Size Width:</b>
                                            <asp:Label ID="size_widthLabel" runat="server" Text='<%# Eval("size_width") %>' />
                                            <br />
                                            <br />

                                        </span>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div id="itemPlaceholderContainer" runat="server" style="">
                                            <span runat="server" id="itemPlaceholder" />
                                        </div>
                                        <div style="">
                                        </div>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <span style="">

                                            <asp:Image ID="Art" runat="server" Height="500px" Width="500px"
                                                ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                            <br />
                                            ArtworkID:
                                <asp:Label ID="artwork_idLabel" runat="server" Text='<%# Eval("artwork_id") %>' />
                                            <br />
                                            Artwork Name:
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                            <br />
                                            Artwork Price:
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                            <br />
                                            Status:
                                <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                                            <br />
                                            Height:
                                <asp:Label ID="size_heightLabel" runat="server" Text='<%# Eval("size_height") %>' />
                                            <br />
                                            Width:
                                <asp:Label ID="size_widthLabel" runat="server" Text='<%# Eval("size_width") %>' />
                                            <br />
                                            <br />
                                        </span>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:LinkButton ID="btnWish" type="button" class="btn btn-outline-warning" runat="server" OnClick="btnWish_Click"><i class="fa fa-heart" aria-hidden="true"></i> &nbsp;Save to Wish List</asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="btnOrderCart" type="button" class="btn btn-outline-danger" runat="server" OnClick="btnCart_Click1" OnClientClick="addCart()" OnTick="CodeBehindFunction"><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;Add to Order Cart</asp:LinkButton>
                                            <div id="snackbar">Add to Cart ✔️ </div>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            width: 350px;
        }

        /* The snackbar - position it at the bottom and in the middle of the screen */
        #snackbar {
            visibility: hidden; /* Hidden by default. Visible on click */
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #fff; /* White text color */
            color: #333; /* Black background color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 50%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

            /* Show the snackbar when clicking on a button (class added with JavaScript) */
            #snackbar.show {
                visibility: visible; /* Show the snackbar */
                /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
                -webkit-animation: fadein 0.5s, fadeout 0.5s 5.5s;
                animation: fadein 0.5s, fadeout 0.5s 5.5s;
            }

        /* Animations to fade the snackbar in and out */
        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 1;
            }

            to {
                bottom: 50px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 1;
            }

            to {
                bottom: 50px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 50px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 1;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 50px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 1;
            }
        }
        .auto-style2 {
            width: 321px;
        }
    </style>
    <script>
        function addCart() {
            // Get the snackbar DIV
            var x = document.getElementById("snackbar");

            // Add the "show" class to DIV
            x.className = "show";

            // After 3 seconds, remove the show class from DIV
            setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
        }
    </script>
</asp:Content>

