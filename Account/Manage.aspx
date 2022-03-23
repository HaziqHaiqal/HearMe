<%@ Page Title="Edit Profile" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Manage.aspx.vb" Inherits="HearMe.Manage" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Import Namespace="HearMe" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align: center; margin-top: 10px"><%: Title %></h2>

    <div>
        <asp:PlaceHolder runat="server" ID="SuccessMessagePlaceHolder" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <%--                <h4 style="text-align: center">Change your account settings</h4>--%>
                <hr />

                <div class="container">
                    <div class="picture-container">
                        <div class="picture">
                            <img src="https://lh3.googleusercontent.com/LfmMVU71g-HKXTCP_QWlDOemmWg4Dn1rJjxeEsZKMNaQprgunDTtEuzmcwUBgupKQVTuP0vczT9bH32ywaF7h68mF-osUSBAeM6MxyhvJhG6HKZMTYjgEv3WkWCfLB7czfODidNQPdja99HMb4qhCY1uFS8X0OQOVGeuhdHy8ln7eyr-6MnkCcy64wl6S_S6ep9j7aJIIopZ9wxk7Iqm-gFjmBtg6KJVkBD0IA6BnS-XlIVpbqL5LYi62elCrbDgiaD6Oe8uluucbYeL1i9kgr4c1b_NBSNe6zFwj7vrju4Zdbax-GPHmiuirf2h86eKdRl7A5h8PXGrCDNIYMID-J7_KuHKqaM-I7W5yI00QDpG9x5q5xOQMgCy1bbu3St1paqt9KHrvNS_SCx-QJgBTOIWW6T0DHVlvV_9YF5UZpN7aV5a79xvN1Gdrc7spvSs82v6gta8AJHCgzNSWQw5QUR8EN_-cTPF6S-vifLa2KtRdRAV7q-CQvhMrbBCaEYY73bQcPZFd9XE7HIbHXwXYA=s200-no" class="picture-src" id="wizardPicturePreview" title="">
                            <asp:FileUpload ID="wizard" runat="server" />
                        </div>
                    </div>
                </div>
                <br />
                <div class="form-horizontal" style="margin: 20px 20px 20px 5px">
                    <br />
                    <asp:Label runat="server" CssClass="col-md-2 control-label">Username</asp:Label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="uNameTxt" CssClass="form-control" />
                    </div>
                    <hr />
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" placeholder="" TextMode="Email" />
                    </div>
                    <hr />
                    <asp:Label runat="server"  CssClass="col-md-2 control-label">Phone Number</asp:Label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="PhoneNo" CssClass="form-control" />
  <%--                      <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" />
                        &nbsp;--%>
                    </div>
                    <hr />
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-12">
                       <%-- <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />--%>
                        <dd>
                            <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                            <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                        </dd>
                    </div>
                    <hr />

                    <div class="col-md-12 text-center">
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" Style="background-color: #3F51B5; border-color: #3F51B5; width:35%; margin-top:5%; font-size:18.5px" Text="Update" />
                    </div>
                </div>






                <%--<dl class="dl-horizontal" style="margin-left: 20px">--%>
                <%--                <dt>Password:</dt>
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" id="sample3">
                    <label class="mdl-textfield__label" for="sample3">•••••••</label>
                </div>--%>


                <%--                    <dt>External Logins:</dt>
                    <dd><%:LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                    </dd>
                    <hr />--%>
                <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                --%>

                <%--                <dt>Phone Number:</dt>
                <div class="mdl-textfield mdl-js-textfield">
                    <input class="mdl-textfield__input" type="text" pattern="[0-9]{10}|[0-9]{11}" id="sample4">
                    <label class="mdl-textfield__label" for="sample4">01164368645</label>
                    <span class="mdl-textfield__error">Input is not a number!</span>--%>
            </div>

            <%--                    If HasPhoneNumber Then--%>

            <%--                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>--%>

            <%--Else--%>

            <%--                <dd>
                    <asp:Label Text="" ID="PhoneNumber" runat="server" />
                    <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" />
                    &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                </dd>--%>


            <%--End If --%>
            <%--                    <dt>Two-Factor Authentication:</dt>
                    <dd>
                        <p>
                            There are no two-factor authentication providers configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                            for details on setting up this ASP.NET application to support two-factor authentication.
                        </p>--%>
            <% If TwoFactorEnabled Then %>
            <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
            --%>
            <% Else %>
            <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
            --%>
            <% End If %>
            <%--</dd>--%>

            <%--                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10 text-center">
                        <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" Style="width: 40%;" />
                    </div>
                </div>--%>
    </dl>
        </div>
    </div>
    </div>
</asp:Content>

