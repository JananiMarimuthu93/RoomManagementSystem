<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RoomManagementSystem.Dashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style>
        .dashboard-container 
        {
            max-width: 600px;
            margin: 80px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.96);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .dashboard-container h3 
        {
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
        }

        .dashboard-btn 
        {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 6px;
            border: none;
            background-color: #0066cc;
            color: white;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .dashboard-btn:hover 
        {
            background-color: #004b99;
            text-decoration: none;
        }

        .logo 
        {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }

        .welcome-msg 
        {
            margin-top: 15px;
            font-size: 18px;
            color: #444;
        }

        .logout-link 
        {
            margin-top: 20px;
            display: inline-block;
            color: #cc0000;
            font-weight: bold;
            text-decoration: underline;
        }

        .logout-link:hover 
        {
            color: #990000;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <div class="dashboard-container">
        <div class="text-center mb-3">
            <img src="./images/icon.jpeg" alt="Logo" class="logo mb-2" />
            <h3>SphereStay-Dashboard</h3>
        </div>

        <p class="welcome-msg">
            Welcome,<strong><%= Session["FullName"] %></strong>!
        </p>

        <a href="ManageRooms.aspx" class="dashboard-btn">🛏️View & Manage Rooms</a>
    </div>
</asp:Content>
