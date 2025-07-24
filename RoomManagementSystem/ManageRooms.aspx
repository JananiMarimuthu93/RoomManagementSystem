<%@ Page Title="Manage Rooms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="RoomManagementSystem.ManageRooms" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .table-container 
        {
            max-width: 1100px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h3.text-center 
        {
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
        }

        .room-img 
        {
            height: 80px;
            width: 100px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-dashboard,
        .btn-success 
        {
            margin-bottom: 15px;
            font-weight: 500;
        }

        .btn-dashboard 
        {
            background-color: #6c757d;
            color: white;
            padding: 6px 14px;
            border-radius: 5px;
            border: none;
        }

        .btn-success 
        {
            background-color: #28a745;
            padding: 6px 14px;
            border: none;
            float: right;
            border-radius: 5px;
        }

        .btn-edit, .btn-delete 
        {
            padding: 5px 12px;
            margin-right: 6px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        .btn-edit 
        {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-edit:hover 
        {
            background-color: #0056b3;
        }

        .btn-delete 
        {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        .btn-delete:hover 
        {
            background-color: #bd2130;
        }

        .table th 
        {
            background-color: #f8f9fa;
            color: #333;
            font-weight: 600;
        }

        .text-success 
        {
            font-weight: bold;
            margin-top: 20px;
        }

        .float-right 
        {
            float: right;
        }

        .form-group label 
        {
             margin-right: 10px;
        }


        @media (max-width: 768px) 
        {
            .btn-success, .btn-dashboard 
            {
                width: 100%;
                margin-bottom: 10px;
                float: none;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="table-container">
        <h3 class="text-center">Manage Rooms</h3>

        <asp:Button ID="btnBackToDashboard" runat="server" Text="← Back to Dashboard"
            PostBackUrl="Dashboard.aspx" CssClass="btn-dashboard" />

        <asp:Button ID="Button1" runat="server" Text="➕ Add Room"
            PostBackUrl="AddRoom.aspx" CssClass="btn btn-success" />

        <div class="clearfix mb-3"></div>

        <div class="form-group mb-3">
            <label for="ddlPriceFilter"><strong>Filter by Price:</strong></label>
            <asp:DropDownList ID="ddlPriceFilter" runat="server" AutoPostBack="true" CssClass="form-control w-25 d-inline-block ml-2"
                OnSelectedIndexChanged="ddlPriceFilter_SelectedIndexChanged">
                <asp:ListItem Text="-- All Prices --" Value="All" />
                <asp:ListItem Text="Below ₹1000" Value="Below1000" />
                <asp:ListItem Text="₹1000 - ₹3000" Value="1000to3000" />
                <asp:ListItem Text="Above ₹3000" Value="Above3000" />
            </asp:DropDownList>
        </div>

        <asp:Label ID="lblAvailableRooms" runat="server" CssClass="info-label" />

        <asp:GridView ID="GridViewRooms" runat="server" AutoGenerateColumns="False"
                      CssClass="table table-bordered table-hover"
                      OnRowCommand="GridViewRooms_RowCommand"
                      DataKeyNames="RoomID">
            <Columns>
                
                <asp:BoundField DataField="RoomNumber" HeaderText="Room No" />
                <asp:BoundField DataField="RoomType" HeaderText="Type" />
                <asp:BoundField DataField="Price" HeaderText="Price (₹)" DataFormatString="{0:N2}" />
                <asp:BoundField DataField="Description" HeaderText="Description" />

                <asp:TemplateField HeaderText="Available">
                    <ItemTemplate>
                        <%# (Eval("IsAvailable")?.ToString().ToLower() == "yes") ? "Yes" : "No" %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgRoom" runat="server" CssClass="room-img"
                            ImageUrl='<%# Eval("RoomImage") != DBNull.Value ? "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("RoomImage")) : "~/Images/no-image.png" %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit" CommandName="EditRoom"
                            CommandArgument='<%# Eval("RoomID") %>' CssClass="btn-edit" />

                        <asp:Button runat="server" Text="Delete" CommandName="DeleteRoom"
                            CommandArgument='<%# Eval("RoomID") %>' CssClass="btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete this room?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        
        <asp:Label ID="lblStatus" runat="server" CssClass="text-success d-block" />
    </div>
</asp:Content>
