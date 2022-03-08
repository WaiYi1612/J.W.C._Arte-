<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="WAD.Customer.CustomerProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/Controls/UserProfile.ascx" TagPrefix="uc1" TagName="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');
            if (activeTab) {
                $('#pills-tab a[href="' + activeTab + '"]').tab('show');
            }
        });
    </script>
    <div class="container my-3 p-3">
        <uc1:UserProfile runat="server" ID="UserProfile" r1l1="Name:" r2l1="Address:" r3l1="Interested Genre:" btn1text="View Purchase History" btn1redirect="~/PurchaseHistory/PurchaseHistory.aspx" btn1visible="true" btn2text="Edit Profile" btn2redirect="~/Customer/CustomerProfileSettings.aspx" btn2visible="true" />
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="tab" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
                    <asp:Label ID="Label1" runat="server">Your Artwork</asp:Label></a>
            </li>
        </ul>
        <div class="tab-content bg-white" id="nav-tabContent">
            <div class="row justify-content-md-center">
            <div class="tab-pane fade show active" id="nav-wishlist" role="tabpanel" aria-labelledby="nav-wishlist-tab">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="artwork_id" OnItemCommand="DataList1_ItemCommand" Width="90%">
                    <ItemTemplate>
                        <br />
                        <br />

                        &nbsp;<asp:Image ID="Image2" runat="server" Width="231px" Height="250px" Style="margin:10px 40px;" ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />

                        <br />
                        <div Style="margin:10px 50px;">
                        Name:
                                <asp:Label ID="nameLabel" runat="server"  Text=' <%# Eval("name") %>' />
                        <br />
                        Artist :
                                <asp:Label ID="artwork_idLabel" runat="server" Text=' <%# Eval("UserName") %>' />
                        <br />
                        </div>
                        <asp:LinkButton runat="server" Style="margin:10px 40px;" class="rounded-pill btn btn-primary btn-lg btn-block" ID="LinkButton1" Text="<i class='fa fa-shopping-cart' aria-hidden='true'></i> Add To Order Cart" Height="38px" Width="221px" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' runat="server" ID="lblNoRecord" Text="Your wishlist is empty. Explore some of the artwork ">
                    <asp:LinkButton runat='server' ID='LinkButton2' PostBackUrl='~/Artwork/Artwork.aspx' Text='here' /></asp:Label></div><div class="tab-pane fade" id="nav-follower" role="tabpanel" aria-labelledby="nav-follower-tab">
                <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" DataKeyField="Expr1" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <br />
                        <br />
                        &nbsp;<asp:Image ID="Image2" runat="server" Width="231px" Height="250px" ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                        <br />
                        name: <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        <br />
                        artwork_id: <asp:Label ID="artwork_idLabel" runat="server" Text='<%# Eval("artwork_id") %>' />
                        <br />
                        <asp:LinkButton runat="server" Width="231px" ID="LinkButton1" Text="<i class='icon-shopping-cart'></i> Add To Order Cart" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT WishList.artwork_id, Artwork.artwork_id AS Expr1, Artwork.name, Artwork.image, WishList.cust_id FROM WishList INNER JOIN Artwork ON WishList.artwork_id = Artwork.artwork_id WHERE (WishList.cust_id = 1)"></asp:SqlDataSource>
                <br />
                <asp:Label Visible='<%# bool.Parse((DataList2.Items.Count==0).ToString()) %>'
                    runat="server" ID="Label2" Text="Your followed none. Explore some talented artist <a href=''>here</a>"></asp:Label></div></div></div></div></asp:Content><asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">                        
</asp:Content>
