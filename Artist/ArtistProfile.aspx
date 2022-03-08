<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WAD.Artist.ArtistProfile" %>

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
        <uc1:UserProfile runat="server" ID="UserProfile" r1l1="Artist Name:" r2l1="Artist Address:" r3l1="Total Artwork:" r4l1="Artist Genre:" btn1Text="Edit Profile" btn1Redirect="~/Artist/ArtistProfileSettings.aspx" btn1Visible="true" />
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="tab" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
                    <asp:Label ID="Label1" runat="server">Your Artwork</asp:Label></a>
            </li>
        </ul>
        <div class="tab-content bg-white" id="nav-tabContent">
            <div class="row justify-content-md-center">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="artwork_id" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            &nbsp;<asp:Image ID="Image2" runat="server" Width="231px" Height="250px" Style="margin: 10px 40px;" ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                            <br />
                            <div style="margin: 10px 50px;">
                                Name:
                                <asp:Label ID="nameLabel" runat="server" Text=' <%# Eval("name") %>' />
                                <br />
                                Artist :
                                <asp:Label ID="artwork_idLabel" runat="server" Text=' <%# Eval("UserName") %>' />
                                <br />
                            </div>
                            <asp:LinkButton class="rounded-pill btn btn-primary btn-lg btn-block" Width="231px" Style="margin: 10px 40px" runat="server" ID="LinkButton1" Text="<i class='fa fa-pencil-square-o' aria-hidden='true'></i> Update Artwork" />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' runat="server" ID="lblNoRecord" Text="Your haven't upload any artwork. Add one artwork ">
                        <asp:LinkButton runat='server' ID='LinkButton2' PostBackUrl='~/Artist/AddArtwork.aspx' Text='here' /></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
