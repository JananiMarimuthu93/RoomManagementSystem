<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="RoomManagementSystem.Signup" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .signup-container {
            max-width: 500px;
            margin: auto;
            margin-top: 80px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .form-label { font-weight: 500; }
        .btn-custom { background-color: #0066cc; color: white; }
        .btn-custom:hover { background-color: #1e7e34; }
        .logo {
            width: 90px; height: 90px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        .text-danger { color: red; }
        .text-success { color: green; }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="signup-container">
        <div class="text-center mb-3">
            <img src="./images/icon.jpeg" alt="Logo" class="logo mb-2" />
            <h3>SphereStay</h3>
        </div>

        <h4 class="text-center mb-4">Create Your Account</h4>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <div class="mb-3">
            <asp:Label Text="Full Name:" AssociatedControlID="txtFullName" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="txtFullName" ErrorMessage="Full Name is required." CssClass="text-danger" Display="Dynamic" runat="server" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Email Address:" AssociatedControlID="txtEmail" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" runat="server" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Phone Number:" AssociatedControlID="txtPhone" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Username:" AssociatedControlID="txtUsername" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-danger" Display="Dynamic" runat="server" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Password:" AssociatedControlID="txtPassword" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
            <asp:RequiredFieldValidator ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic" runat="server" />
        </div>

        <div class="mb-3">
            <asp:Label Text="Confirm Password:" AssociatedControlID="txtConfirmPassword" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
            <asp:RequiredFieldValidator ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required." CssClass="text-danger" Display="Dynamic" runat="server" />
            <asp:CompareValidator ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match." CssClass="text-danger" Display="Dynamic" runat="server" />
        </div>

        <asp:Label ID="lblRegisterStatus" runat="server" CssClass="mb-2 d-block text-danger" />

        <div class="text-center">
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-custom w-100" OnClick="btnRegister_Click" />
        </div>

        <div class="text-center mt-3">
            <span>Already have an account?</span>
            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink>
        </div>
    </div>
</asp:Content>
