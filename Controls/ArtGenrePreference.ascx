<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtGenrePreference.ascx.cs" Inherits="WAD.Controls.ArtGenrePreference" %>
<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();
    });
</script>

    <asp:Label class="h4" ID="Label1" runat="server" Text=""></asp:Label>
<%--
<form id="form1" runat="server">
    <select id="ddlGenre" class="mdb-select md-form" multiple searchable='<%#Eval("searchHere") %>' name="genre">
        <option value="" disabled selected name="Genre">
            <asp:Label class="h4" ID="Label3" runat="server" Text=""></asp:Label></option>
        <option value="1">USA</option>
        <option value="2">Germany</option>
        <option value="3">France</option>
        <option value="3">Poland</option>
        <option value="3">artGenreName</option>
    </select>
    <asp:Label ID="Label2" class="mdb-main-label" runat="server">Label example</asp:Label>
    <asp:Button ID="Button1" class="btn-save btn btn-primary btn-sm" runat="server" />
</form>

<asp:Repeater ID="Repeater1" runat="server" DataSourceID="ArtGenreDataSource">
    <ItemTemplate>
        <option value="3"><%#DataBinder.Eval(Container.DataItem, "artGenreName" ) %></option>
    </ItemTemplate>
</asp:Repeater>--%>

<%--<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="ArtGenreDataSource" DataTextField='<option value="3">artGenreName</option>' DataValueField="Id" />--%>

<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="ArtGenreDataSource" DataTextField="artGenreName" DataValueField="Id" />
<asp:SqlDataSource ID="ArtGenreDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ArtGenre]" />
