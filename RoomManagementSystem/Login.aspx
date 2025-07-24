<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RoomManagementSystem.Login" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .login-container 
        {
            max-width: 400px;
            margin: auto;
            margin-top: 80px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .form-label 
        {
            font-weight: 500;
        }

        .btn-custom 
        {
            background-color: #0066cc;
            color: white;
        }

        .btn-custom:hover 
        {
            background-color: #004b99;
        }

        .logo 
        {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <div class="text-center mb-3">
            <img src="./images/icon.jpeg" alt="Logo" class="logo mb-2" />
            <h3>SphereStay</h3>
        </div>

        <h4 class="text-center mb-4">Login</h4>

        <div class="mb-3">
            <asp:Label runat="server" Text="Email:" AssociatedControlID="txtEmail" CssClass="form-label" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
        </div>

        <div class="mb-3">
            <asp:Label runat="server" Text="Password:" AssociatedControlID="txtPassword" CssClass="form-label" />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
        </div>

        <asp:Label ID="lblLoginStatus" runat="server" CssClass="text-danger mb-2 d-block" />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom w-100 mt-2" OnClick="btnLogin_Click" />

        <div class="text-center mt-3">
            <span>New here?</span>
            <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="Signup.aspx">Create an account</asp:HyperLink>
        </div>
    </div>
</asp:Content>
