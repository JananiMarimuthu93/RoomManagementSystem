using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace RoomManagementSystem
{
    public partial class Signup:Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                lblRegisterStatus.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!ValidateInputs())
                return;

            string connection = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connection))
            {
                try
                {
                    conn.Open();

                    if (IsUserExists(conn, txtEmail.Text.Trim(), txtUsername.Text.Trim()))
                    {
                        lblRegisterStatus.Text = "Email or Username already exists.";
                        return;
                    }

                    RegisterUser(conn);
                    Response.Redirect("Login.aspx",false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (SqlException)
                {
                    lblRegisterStatus.Text = "Database error occurred.";
                }
                catch (Exception)
                {
                    lblRegisterStatus.Text = "Unexpected error.Please try again.";
                }
            }
        }

        private bool ValidateInputs()
        {
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();

            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblRegisterStatus.Text = "All fields are required.";
                return false;
            }

            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblRegisterStatus.Text = "Invalid email format.";
                return false;
            }

            if (!Regex.IsMatch(phone, @"^\d{10}$"))
            {
                lblRegisterStatus.Text = "Enter a valid 10-digit phone number.";
                return false;
            }

            if (txtPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                lblRegisterStatus.Text = "Password and Confirm Password must match.";
                return false;
            }

            return true;
        }

        private bool IsUserExists(SqlConnection conn,string email,string username)
        {
            string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email=@Email OR Username=@Username";

            using (SqlCommand cmd = new SqlCommand(checkQuery, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Username", username);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private void RegisterUser(SqlConnection conn)
        {
            string insertQuery = @"
                INSERT INTO Users (FullName, Email, PhoneNumber, Username, Password)
                VALUES (@FullName, @Email, @PhoneNumber, @Username, @Password)";

            using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
            {
                cmd.Parameters.AddWithValue("@FullName",txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.ExecuteNonQuery();
            }
        }
    }
}
