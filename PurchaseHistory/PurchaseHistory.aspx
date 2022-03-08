<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="WAD.PurchaseHistory.PurchaseHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center"><u>Purchase History</u></h2>


    <p>
        &nbsp;
    </p>

    <h5 style="text-align: center">Purchased Details :</h5>
     <!--Table-->
    <div class="table-responsive-xl">
        <!-- Table 3-->

        <asp:GridView ID="GridViewPH" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText="No cart item" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="Order Id"  InsertVisible="False" ReadOnly="True" SortExpression="OrderId" /> 
                <asp:BoundField DataField="name" HeaderText="Artwork Name" SortExpression="Artwork Name" />
                <asp:BoundField DataField="unit_price" HeaderText="Price (MYR)" SortExpression="Price (MYR)" />
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="Status" DataFormatString="{0:N2}" FooterStyle-HorizontalAlign="Right" />
                <asp:BoundField DataField="date" HeaderText="Date and Time" SortExpression="Date and Time" />
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
    <%--    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderId, artwork_id, unit_price, status, date FROM OrderCart ORDER BY date DESC">
        </asp:SqlDataSource>--%>
      <p>
        &nbsp;
    </p>  
    </div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
     <br />
    <br />
    <br />
    <%--<br />--%>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
