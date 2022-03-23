<%@ Page Title="Log in" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="HearMe.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container body-content new1">
        <h2 style="text-align: center"><%: Title %></h2>

        <div class="row">
            <div class="col-md-8">
                <section id="loginForm">
                    <div class="form-horizontal">
                        <!--                    <h4>Welcome to HearMe</h4>
-->
                        <hr />
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>

                        </asp:PlaceHolder>
                        <div class="form-group text-center">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Username</asp:Label>
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" style="margin-left: 9%" />
                                <!--                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
-->
                            </div>
                        </div>

                        <div class="form-group text-center">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" style="margin-left: 9%" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>

                        <!--                          <label for="phone">Enter phone number:</label><br><br>
                          <input type="tel" id="phone" name="phone" placeholder="0123456789" pattern="[0-9]{10}|[0-9]{11}" required><br><br>
                          <small>Format: 0123456789</small><br><br>
-->

                        <!--                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox text-center">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
-->
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10 text-center">
                                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="width: 40%;" />
                            </div>
                        </div>
                    </div>
                    <p style="margin-top: 10%">
                        <asp:Label runat="server" AssociatedContolID="RegisterHyperLink">Don't have an account?</asp:Label>
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Sign up</asp:HyperLink>
                    </p>
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>

            <div class="col-md-4">
                <section id="socialLoginForm">
                    <uc:openauthproviders runat="server" id="OpenAuthLogin" />
                </section>
            </div>
        </div>
    </div>
</asp:Content>
