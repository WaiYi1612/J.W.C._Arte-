<%@ Page Language="C#" Title="" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArtistProfileSettings.aspx.cs" Inherits="WAD.ArtistUserProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/Controls/ProfileSettings/UserProfile.ascx" TagPrefix="uc1" TagName="UserProfile" %>

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
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <%--<li class="nav-item">
                <a class="nav-link" id="pills-back-tab" role="tab" aria-controls="pills-profile" aria-selected="false">
                    <asp:LinkButton ID="LinkButton1" CssClass="" runat="server" PostBackUrl="~/Customer/CustomerProfile.aspx"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back</asp:LinkButton></a>
            </li>--%>
            <li class="nav-item"> 
                <a class="nav-link active" id="pills-home-tab"  data-toggle="tab" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab"  data-toggle="tab" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Password</a>
            </li>
        </ul>
        <div class="container d-flex flex-column justify-content-center">
            <div class="d-inline-flex p-2 bg-white" style="border-radius: 15px;">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <uc1:UserProfile runat="server" ID="UserProfile" />
                        <div class="container">
                            <table>
                                <tr>
                                    <td style="width: 350px;">
                                        <br />
                                    </td>
                                    <td style="width: 350px;">
                                        <asp:Button class="rounded-pill btn btn-primary btn-lg btn-block" ID="Button3" runat="server" Text="Save Changes" OnClick="Button3_Click" />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">


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
                                    <asp:ChangePassword ID="ChangePassword1" runat="server"></asp:ChangePassword>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
