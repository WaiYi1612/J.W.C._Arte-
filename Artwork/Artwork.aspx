<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="WAD.Artwork.Artwork" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link href="../Assets/StyleSheets/Artwork.css" rel="stylesheet" type="text/css" />
    <div style="background-color:#E9E8E2">
        <%--<div class="artworkpage" style="background-color: #ffffff">--%>
        <br />
        &nbsp;
        <%-- <h1 class="display-2">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp <b>Artwork</b></h1>--%>
        <%-- <img src="/Assets/Images/Artwork.png" class="img-fluid" alt="Artwork Image" />--%>



        <asp:SqlDataSource ID="dtCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gallery]"></asp:SqlDataSource>
        <div class="table-responsive-xl">
            <div class="container">
                <div class="row justify-content-md-center">

                    <table>
                        <tr>
                            <td rowspan="2" class="col-sm-4" style="text-align: left"><b>Category</b>&nbsp;
                                <asp:DropDownList ID="ddgallery" runat="server" DataSourceID="dtCategory" CssClass="categoryList" DataTextField="name" DataValueField="gallery_id" OnSelectedIndexChanged="ddgallery_SelectedIndexChanged" BackColor="#E9E8E2"></asp:DropDownList>
                            </td>

                            <td class="col-sm-5"><b>Price</b>
                                &nbsp;&nbsp;
                                <asp:TextBox ID="ttmin" runat="server" Width="108px" CssClass="priceTextBox" placeholder="minimun price"></asp:TextBox>
                                &nbsp;-&nbsp;
                                <asp:TextBox ID="ttmax" runat="server" Width="108px" CssClass="priceTextBox" placeholder="maximum price"></asp:TextBox>
                                <br />
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="ttmax" ErrorMessage="Price should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">Price should be integer</asp:RangeValidator>
                                <br />
                                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="ttmin" ErrorMessage="Price should be integer" MaximumValue="100000" MinimumValue="1" Type="Integer" ForeColor="Red">Price should be integer</asp:RangeValidator>


                            </td>


                            <td rowspan="2" class="col-sm-4" style="text-align: left">
                                <asp:LinkButton ID="btnSearch" runat="server" OnClick="LinkButton1_Click" type="button" class="btn btn-outline-secondary"><i class="fa fa-search" aria-hidden="true">&nbsp;<b style="font-family:'Open Sans', sans-serif;">Search</b></i></asp:LinkButton>
                           
                                    </td>
                            <tr>
                                <td class="col-sm-5"><b>Size</b>                                
                                    <div slider id="slider-distance">
                                        <div>
                                            <div inverse-left style="width: 70%;"></div>
                                            <div inverse-right style="width: 70%;"></div>
                                            <div range style="left: 30%; right: 40%;"></div>
                                            <span thumb style="left: 30%;"></span>
                                            <span thumb style="left: 60%;"></span>
                                            <div sign style="left: 30%;">
                                                <span id="value">30</span>
                                            </div>
                                            <div sign style="left: 60%;">
                                                <span id="value">60</span>
                                            </div>
                                        </div>
                                        <input type="range" tabindex="0" name="txtSize" id="txtSize" value="30" max="100" min="0" step="1" oninput="
  this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
  var children = this.parentNode.childNodes[1].childNodes;
  children[1].style.width=value+'%';
  children[5].style.left=value+'%';
  children[7].style.left=value+'%';children[11].style.left=value+'%';
  children[11].childNodes[1].innerHTML=this.value;" />

                                        <input type="range" tabindex="0" name="txtSize0" id="txtSize0" value="60" max="100" min="0" step="1" oninput="
  this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
  var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
  var children = this.parentNode.childNodes[1].childNodes;
  children[3].style.width=(100-value)+'%';
  children[5].style.right=(100-value)+'%';
  children[9].style.left=value+'%';children[13].style.left=value+'%';
  children[13].childNodes[1].innerHTML=this.value;" />
                                    </div>
                                </td>
                            </tr>
                        <tr>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <%--<td class="auto-style1">&nbsp;</td>
                            <td class="col-sm">&nbsp;</td>--%>
                        </tr>
                    </table>


                    <div class="row justify-content-center">
                        <asp:Label ID="txtno" runat="server" class="text-monospace"></asp:Label>
                        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="artwork_id" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="datalist1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="1207px">
                                <ItemTemplate>
                                    &nbsp;
                                <div class="card-decks">
                                    <div class="card" style="width: 390px">
                                        <asp:Image CssClass="card-img-top" ID="Image1" runat="server" Style="width: 380px; height: 350px; vertical-align: middle; margin: 5px 5px;" ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                                        <br />
                                        &nbsp;
       <div class="card-body">
          <b> ID</b>
           <asp:Label CssClass="card-title" ID="artwork_idLabel" runat="server" Text='<%# Eval("artwork_id") %>' />
           <br />
           <b>NAME</b>
            <asp:Label CssClass="card-text" ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
           <br />
           <br />
           <asp:LinkButton ID="btnArtS" runat="server" OnClick="btnArtS_Click" type="button" CssClass="btn btn-outline-dark">Select</asp:LinkButton>
           <br />
           <br />
       </div>
                                    </div>
                                </div>
                                </ItemTemplate>
                            </asp:DataList>


                            <br />



                        </asp:Panel>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>




<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style2 {
            position: relative;
            width: 115%;
            -ms-flex-preferred-size: 0;
            flex-basis: 0;
            -ms-flex-positive: 1;
            flex-grow: 1;
            max-width: 100%;
            padding-left: 15px;
            padding-right: 15px;
        }

        .auto-style3 {
            width: 115%
        }
    </style>
</asp:Content>





