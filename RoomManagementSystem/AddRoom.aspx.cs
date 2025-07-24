using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RoomManagementSystem
{
    public partial class AddRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
                lblError.Text = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] roomImageBytes = null;

                if (fuRoomImage.HasFile)
                {
                    roomImageBytes = fuRoomImage.FileBytes;
                }

                string connStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("AddRoom", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@RoomNumber", txtRoomNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoomType", ddlRoomType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@RoomImage", (object)roomImageBytes ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@IsAvailable", ddlIsAvailable.SelectedValue);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        lblMessage.Text = "Room added successfully!";
                        ClearFields();
                    }
                    else
                    {
                        lblError.Text = "Room insertion failed.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }

        private void ClearFields()
        {
            txtRoomNumber.Text = "";
            ddlRoomType.SelectedIndex = 0;
            txtPrice.Text = "";
            txtDescription.Text = "";
            ddlIsAvailable.SelectedIndex = 0;
        }


        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageRooms.aspx");
        }
    }
}
