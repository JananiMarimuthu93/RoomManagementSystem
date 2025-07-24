using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace RoomManagementSystem
{
    public partial class EditRoom : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["RoomID"] != null)
                {
                    int roomId = int.Parse(Request.QueryString["RoomID"]);
                    LoadRoomDetails(roomId);
                }
                else
                {
                    lblError.Text = "Invalid Room ID.";
                }
            }
        }

        private void LoadRoomDetails(int roomId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM Rooms WHERE RoomID = @RoomID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@RoomID", roomId);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtRoomNumber.Text = reader["RoomNumber"].ToString();
                    ddlRoomType.SelectedValue = reader["RoomType"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    string availability = reader["isAvailable"].ToString();
                    ddlIsAvailable.SelectedValue = availability == "Yes" ? "Yes" : "No";

                    if (reader["RoomImage"] != DBNull.Value)
                    {
                        byte[] imageData = (byte[])reader["RoomImage"];
                        string base64String = Convert.ToBase64String(imageData);
                        imgPreview.ImageUrl = "data:image/png;base64," + base64String;
                        imgPreview.Visible = true;
                        ViewState["ImageData"] = imageData;
                    }
                    else
                    {
                        imgPreview.Visible = false;
                    }
                }
                else
                {
                    lblError.Text = "Room not found.";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["RoomID"] == null)
            {
                lblError.Text = "No room selected.";
                return;
            }

            int roomId = int.Parse(Request.QueryString["RoomID"]);
            string roomNumber = txtRoomNumber.Text.Trim();
            string roomType = ddlRoomType.SelectedValue;
            decimal price = decimal.Parse(txtPrice.Text.Trim());
            string description = txtDescription.Text.Trim();
            string availability = ddlIsAvailable.SelectedValue;

            byte[] imageData = ViewState["ImageData"] as byte[];

            
            if (fuNewImage.HasFile)
            {
                string extension = Path.GetExtension(fuNewImage.FileName).ToLower();
                if (extension == ".jpg"||extension == ".jpeg"||extension == ".png"||extension == ".gif")
                {
                    using (BinaryReader br = new BinaryReader(fuNewImage.PostedFile.InputStream))
                    {
                        imageData = br.ReadBytes(fuNewImage.PostedFile.ContentLength);
                    }
                }
                else
                {
                    lblError.Text = "Only .jpg, .png, .gif files are allowed.";
                    return;
                }
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"UPDATE Rooms SET RoomNumber=@RoomNumber, RoomType=@RoomType, Price=@Price, 
                                 Description=@Description, isAvailable=@Availability, RoomImage=@ImageData
                                 WHERE RoomID=@RoomID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@RoomNumber", roomNumber);
                cmd.Parameters.AddWithValue("@RoomType", roomType);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Availability", availability);
                cmd.Parameters.AddWithValue("@ImageData", (object)imageData ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@RoomID", roomId);

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblMessage.Text = "Room updated successfully!";
                    lblError.Text = "";
                }
                else
                {
                    lblError.Text = "Update failed.";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRooms.aspx");
        }
    }
}
