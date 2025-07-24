using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace RoomManagementSystem
{
    public partial class ManageRooms : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRooms();
                BindRooms();
                GetAvailableRoomsCount();
            }
        }

        private void LoadRooms()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT RoomID, RoomNumber, RoomType, Price, Description, RoomImage, IsAvailable FROM Rooms";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewRooms.DataSource = dt;
                    GridViewRooms.DataBind();
                }
            }
        }

        protected void GridViewRooms_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int roomId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditRoom")
            {
                Response.Redirect($"EditRoom.aspx?RoomID={roomId}");
            }
            else if (e.CommandName == "DeleteRoom")
            {
                DeleteRoom(roomId);
            }
        }

        private void DeleteRoom(int roomId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Rooms WHERE RoomID = @RoomID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@RoomID", roomId);
                    con.Open();
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblStatus.Text = "Room deleted successfully.";
                        LoadRooms();
                    }
                    else
                    {
                        lblStatus.Text = "Delete failed.";
                    }
                }
            }
        }

        private void BindRooms()
        {
            string query = "SELECT * FROM Rooms";
            string priceFilter = ddlPriceFilter.SelectedValue;

            if (priceFilter != "All")
            {
                switch (priceFilter)
                {
                    case "Below1000":
                        query += " WHERE Price < 1000";
                        break;
                    case "1000to3000":
                        query += " WHERE Price BETWEEN 1000 AND 3000";
                        break;
                    case "Above3000":
                        query += " WHERE Price > 3000";
                        break;
                }
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRooms.DataSource = dt;
                GridViewRooms.DataBind();
            }
        }

        private void GetAvailableRoomsCount()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("GetAvailableRoomCount", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    lblAvailableRooms.Text = "Available Rooms: " + result.ToString();
                }
                else
                {
                    lblAvailableRooms.Text = "No available rooms.";
                }
            }
        }


        protected void ddlPriceFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRooms(); 
        }
    }
}
