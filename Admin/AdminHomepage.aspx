<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="WAD.Admin.AdminHomepage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 100px;
        }
    </style>
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
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <%--<li class="nav-item">
                <a class="nav-link" id="pills-back-tab" role="tab" aria-controls="pills-profile" aria-selected="false">
                    <asp:LinkButton ID="LinkButton1" CssClass="" runat="server" PostBackUrl="~/Customer/CustomerProfile.aspx"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back</asp:LinkButton></a>
            </li>--%>
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="tab" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Change Password</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab" data-toggle="tab" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Application User</a>
            </li>
        </ul>
        <div class="container d-flex flex-column justify-content-center">
            <div class="d-inline-flex p-2 bg-white" style="border-radius: 15px;">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <table>
                            <tr>
                                <td style="width: 350px;">
                                    <br />
                                </td>
                                <td>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <asp:ChangePassword ID="ChangePassword2" runat="server"></asp:ChangePassword>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        <table class="align-content-center" style="align-items: center;">
                            <tr>
                                <td style="width:250px;">
                                    <br />
                                </td>
                                <td class="auto-style1" style="text-align: right;">Delete User: </td>
                                <td>
                                    <asp:DropDownList ID="ddlUsers1" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;<asp:Button ID="deleteUserBtn" runat="server" OnClick="deleteUserBtn_Click" Text="Delete" AutoPostBack="True" />
                                </td>
                                
                            </tr>

                            <tr>
                                <td style="width:250px;">
                                    <br />
                                </td>
                                <td class="auto-style1" style="text-align: right;">Roles: </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    &nbsp;<asp:Button ID="createRoleBtn" runat="server" OnClick="createRoleBtn_Click" Text="Create Role" />
                                    &nbsp;

                                </td>
                                
                            </tr>

                            <tr>
                                <td style="width:250px;">
                                    <br />
                                </td>
                                <td class="auto-style1" style="text-align: right;">Role list</td>
                                <td>
                                    <asp:DropDownList ID="ddlRoles0" runat="server">
                                    </asp:DropDownList>
                                    <asp:Button ID="deleteRoleBtn0" runat="server" OnClick="deleteRoleBtn_Click" Text="Delete Role" />
                                </td>
                                
                            </tr>

                            <tr>
                                <td style="width:250px;">
                                    <br />
                                </td>
                                <td class="auto-style1" style="text-align: right;">Assign user to role</td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="ddlUsers0" runat="server">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlRoles1" runat="server">
                                    </asp:DropDownList>
                                    &nbsp;<asp:Button ID="assignRoleBtn" runat="server" OnClick="assignRoleBtn_Click" Text="Assign" AutoPostBack="True" />
                                    &nbsp;<asp:Button ID="unassignRoleBtn" runat="server" OnClick="unassignRoleBtn_Click" Text="Unassign" AutoPostBack="True" /><br />
                                </td>
                                                                   
                            </tr>
                            </Table>

                        <table>
                            <tr>
                                <td style="width:250px;">
                                    <br />
                                </td>
                                <td>
                                <td class="auto-style1">
                                    <div class="container d-flex flex-column">
                                        <div class="d-inline-flex p-2 bg-white" style="border-radius: 15px;">
                                            <div class="row justify-content-md-center">
                                                <asp:GridView ID="GridView1" CssClass="GridPosition" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                                                    <Columns>
                                                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                                                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                                        <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [vw_aspnet_Users].UserId,[vw_aspnet_Users].UserName, [vw_aspnet_Roles].RoleName 
From [vw_aspnet_UsersInRoles] 
right join [vw_aspnet_Users] on [vw_aspnet_Users].UserId=[vw_aspnet_UsersInRoles].UserId 
left join [vw_aspnet_Roles] on [vw_aspnet_Roles].RoleId=[vw_aspnet_UsersInRoles].RoleId"></asp:SqlDataSource>


                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <style type="text/css">
        .GridPosition {
            /*position: relative;
            left: 220px;*/
            /*    top: 300px;
            height:50px;
            width: 600px;*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
