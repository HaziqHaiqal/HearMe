<%@ Page Title="Register" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.vb" Inherits="HearMe.Register" %>

<%@ Import Namespace="HearMe" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <br />
    <h2 style="text-align: center"><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal" style="margin: 20px 20px 20px 20px">
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="mdl-textfield__label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="mdl-textfield__input" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:Label runat="server" CssClass="mdl-textfield__label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="uNameTxt" CssClass="mdl-textfield__input" />
            </div>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="mdl-textfield__label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="mdl-textfield__input" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="mdl-textfield__label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="mdl-textfield__input" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10 text-center" style="margin-top: 50px;">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" Style="width: 40%;" />
            </div>
            <br />
            <div class="col-md-offset-2 col-md-10 text-center">
                <asp:Button runat="server" OnClientClick="javascript:window.history.go(-1); return false;" Text="Login" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" Style="background-color: #D72729; width: 40%;" />
            </div>
        </div>
    </div>
</asp:Content>
