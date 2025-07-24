<%@ Page Title="Add Room" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="RoomManagementSystem.AddRoom" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        .form-container 
        {
            max-width: 600px;
            margin: 40px auto;
            padding: 25px;
            border: 1px solid #ccc;
            border-radius: 15px;
            background-color: #f9f9f9;
        }
        .form-container h2 
        {
            text-align: center;
            margin-bottom: 25px;
        }
    </style>

    <div class="form-container">

        <h2>Add New Room</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" /><br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red" /><br /><br />

        <asp:Label Text="Room Number:" runat="server" AssociatedControlID="txtRoomNumber" />
        <asp:TextBox ID="txtRoomNumber" runat="server" CssClass="form-control" /><br />

       <asp:Label Text="Room Type:" runat="server" AssociatedControlID="ddlRoomType" />
       <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="form-control">
            <asp:ListItem Text="--Select Room Type--" Value="" />
            <asp:ListItem Text="Single" />
            <asp:ListItem Text="Double" />
            <asp:ListItem Text="Standard" />
            <asp:ListItem Text="Premium" />
            <asp:ListItem Text="Presidential Suite" />
            <asp:ListItem Text="Deluxe" />
            <asp:ListItem Text="Suite" />
       </asp:DropDownList>


        <asp:Label Text="Price:" runat="server" AssociatedControlID="txtPrice" />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" /><br />

        <asp:Label Text="Description:" runat="server" AssociatedControlID="txtDescription" />
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" /><br />

        <asp:Label Text="Upload Image:" runat="server" AssociatedControlID="fuRoomImage" />
        <asp:FileUpload ID="fuRoomImage" runat="server" CssClass="form-control" /><br />

        <asp:Label Text="Availability:" runat="server" AssociatedControlID="ddlIsAvailable" />
        <asp:DropDownList ID="ddlIsAvailable" runat="server" CssClass="form-control">
            <asp:ListItem Text="Yes" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />
        </asp:DropDownList><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Add Room" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnDashboard" runat="server" Text="Back" CssClass="btn btn-secondary" OnClick="btnDashboard_Click" />
    </div>
</asp:Content>