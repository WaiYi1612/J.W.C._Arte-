<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WAD.Artwork.Gallery" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="../Assets/StyleSheets/Gallery.css" rel="stylesheet" type="text/css" />

    <div>
        <img src="/Assets/Images/DiscoverArt.png" style="display:block; margin-left:auto; margin-right:auto; height:350px; width:90%;" alt="Gallery Image" />


        <div class="row justify-content-md-center">  
            <asp:DataList ID="DataList1" runat="server" DataKeyField="gallery_id" RepeatDirection="Horizontal" RepeatColumns="3" OnItemCommand="datalist1_ItemCommand">
                <ItemTemplate>
                    <div class="container">
                        <div class="card">

                            <div class="imgBx">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                            </div>
                            <br />
                            <div class="content">
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                                <br />
                                Description:
                                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                <br />
                                <asp:LinkButton Text="See More" ID="btnMore" OnClick="btnMore_Click" runat="server" />
                            </div>
                        </div>

                    </div>


                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>
