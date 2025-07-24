<%@ Page Title="Welcome to Room Management System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RoomManagementSystem._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .welcome-section 
        {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 80vh;
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
            padding: 50px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .welcome-logo 
        {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        .welcome-title 
        {
            font-size: 3rem;
            font-weight: 700;
            color: #003366;
        }

        .welcome-msg 
        {
            font-size: 1.2rem;
            color: #444;
            margin-top: 15px;
        }

        .btn-get-started 
        {
            margin-top: 30px;
            padding: 12px 28px;
            font-size: 1.1rem;
            border-radius: 8px;
        }

        @keyframes fadeIn 
        {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="welcome-section mt-5">
        <img src="./images/icon.jpeg" alt="Room Management Logo" class="welcome-logo" />
        <h1 class="welcome-title">Welcome to Room Management System</h1>
        <p class="welcome-msg">
            This platform allows you to manage rooms efficiently and perform various database operations such as adding, editing, viewing, and deleting room details.
        </p>
        <p class="welcome-msg">
            Sign in to access the room dashboard and start managing your room records now.
        </p>
        <a href="Logout.aspx" class="btn btn-primary btn-get-started">Sign in to get started</a>
    </div>

</asp:Content>
