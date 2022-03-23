<%@ Page Title="Phone Number" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="AddPhoneNumber.aspx.vb" Inherits="HearMe.AddPhoneNumber" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align: center; margin-top:10px"><%: Title %></h2>

    <div class="form-horizontal">
<%--        <h4>Add a phone number</h4>--%>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <div class="form-group" style="margin:20px 20px 20px 20px">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label" style="text-align: center">Phone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Phone" style="margin-left: 40px"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                    CssClass="text-danger" ErrorMessage="The PhoneNumber field is required." />
            </div>
        </div>
        <div class="form-group text-center">
            <div class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                <asp:Button runat="server" OnClick="PhoneNumber_Click"
                    Text="Submit" CssClass="btn btn-default" style="color:white; font-size:1.2em"/>
            </div>
        </div>
    </div>
</asp:Content>
