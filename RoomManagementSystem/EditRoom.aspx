<%@ Page Title="Edit Room" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRoom.aspx.cs" Inherits="RoomManagementSystem.EditRoom" %>

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

        <h2>Edit Room Details</h2>

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
        </asp:DropDownList><br />

        <asp:Label Text="Price:" runat="server" AssociatedControlID="txtPrice" />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" /><br />

        <asp:Label Text="Description:" runat="server" AssociatedControlID="txtDescription" />
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" /><br />

        <asp:Label Text="Upload New Image:" runat="server" AssociatedControlID="fuNewImage" />
        <asp:FileUpload ID="fuNewImage" runat="server" CssClass="form-control" /><br />
        <asp:Image ID="imgPreview" runat="server" Width="150px" Visible="false" /><br /><br />

        <asp:Label Text="Availability:" runat="server" AssociatedControlID="ddlIsAvailable" />
        <asp:DropDownList ID="ddlIsAvailable" runat="server" CssClass="form-control">
            <asp:ListItem Text="Yes" Value="Yes" />
            <asp:ListItem Text="No" Value="No" />
        </asp:DropDownList><br />

        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" Text="Update Room" runat="server" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnBack" CssClass="btn btn-secondary" Text="Back" runat="server" OnClick="btnBack_Click" />
    </div>
</asp:Content>
