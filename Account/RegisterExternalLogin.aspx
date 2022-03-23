<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="RegisterExternalLogin.aspx.vb" Inherits="HearMe.RegisterExternalLogin" Async="true" %>

<%@ Import Namespace="HearMe" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<h2 style="text-align: center; margin-top:4%">Register with your <%: ProviderName %></h2>

    <asp:PlaceHolder runat="server">
        <div class="form-horizontal" style="margin:20px 20px 20px 20px">
            <hr />
            <br />
            <h4>Association Form</h4>
            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                You've authenticated with <strong><%: ProviderName %></strong>. Please enter an email below for the current site
                and click the Log in button.
            </p>

            <div class="form-group" style="margin-top:10%">
                <asp:Label runat="server" AssociatedControlID="email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="Email is required" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="email" CssClass="text-error" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10" style="margin-top:20%; margin-left:35%; width:10%; height:5%">
                    <asp:Button runat="server" Text="Log in" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" OnClick="LogIn_Click" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
