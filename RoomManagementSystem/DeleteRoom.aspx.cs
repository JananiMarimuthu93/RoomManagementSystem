using System;
using System.Configuration;
using System.Data.SqlClient;

namespace RoomManagementSystem
{
    public partial class DeleteRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roomId = Request.QueryString["RoomID"];
            if (!string.IsNullOrEmpty(roomId))
            {
                string connStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Rooms WHERE RoomID = @RoomID", conn))
                {
                    cmd.Parameters.AddWithValue("@RoomID",Convert.ToInt32(roomId));
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("ViewRooms.aspx");
        }
    }
}
