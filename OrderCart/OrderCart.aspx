<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderCart.aspx.cs" Inherits="WAD.OrderCart.OrderCart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h2 style="text-align: center"><u>Order Cart</u></h2>


    <p>
        &nbsp;
    </p>

    <h5 style="text-align: center">Order Artworks Details :</h5>

    <!--Table-->
    <div class="table-responsive-xl">
        <!-- Table 3-->

        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Cart Id" ShowHeaderWhenEmpty="True" EmptyDataText="No cart item" AutoGenerateColumns="False"
            OnRowDeleting="OnRowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Cart Id" HeaderText="Order Id"  InsertVisible="False" ReadOnly="True" SortExpression="Cart Id" /> 
                <asp:BoundField DataField="Artwork Name" HeaderText="Artwork Name" SortExpression="Artwork Name" />
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Art" runat="server" Height="100px" Width="100px"
                            ImageUrl='<%#"data:Image/png;Base64,"+Convert.ToBase64String((byte[])Eval("image")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Added Date" HeaderText="Added DateTime" SortExpression="Added Date" />
                <asp:BoundField DataField="Price (MYR)" HeaderText="Price (MYR)" SortExpression="Price (MYR)" DataFormatString="{0:N2}" FooterStyle-HorizontalAlign="Right" />
                <asp:TemplateField HeaderText="Drop">
                    <ItemTemplate>
                        <div style="text-align: center">
                            <asp:LinkButton runat="server"
                                OnClientClick="return confirm('Are you sure to delete?');"
                                CommandName="Delete"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
      
        
        <p>
            &nbsp;
        </p>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="400px" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" >
           <Fields>  
            <asp:BoundField DataField="Total Order Price (MYR)" HeaderText="Total Order Price (MYR)" DataFormatString="{0:N2}" />  
                </Fields> 
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </div>



    <p>
        &nbsp;
    </p>
    <!-- button -->
      <p>
        &nbsp;
    </p>
       <p>
        &nbsp;
    </p>
    <div class="text-right">
        <asp:LinkButton ID="directPaymentBtn" runat="server" CssClass="btn btn-group" Style="background-color: #ff8b3d; border-radius: 20px; width: 200px; text-align: center;" OnClick="directPaymentBtn_Click"> <i class="fa fa-money" aria-hidden="true" style="margin:auto; width: 15px;"></i>Go to Payment &nbsp; </asp:LinkButton>
    </div>
    <br />
   
 
      <p>
        &nbsp;
    </p>
    
   
</asp:Content>
