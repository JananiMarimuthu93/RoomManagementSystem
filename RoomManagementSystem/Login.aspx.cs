using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace RoomManagementSystem
{
    public partial class Login:Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                lblLoginStatus.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(email)||string.IsNullOrWhiteSpace(password))
            {
                lblLoginStatus.Text = "Please enter both Email and Password.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string query = @"
                        SELECT UserId, FullName 
                        FROM Users 
                        WHERE Email = @Email AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); 

                        using (SqlDataReader read = cmd.ExecuteReader())
                        {
                            if (read.Read())
                            {
                                Session["UserId"] = read["UserId"];
                                Session["FullName"] = read["FullName"].ToString();
                                Response.Redirect("Dashboard.aspx");
                            }
                            else
                            {
                                lblLoginStatus.Text = "Invalid email or password.";
                            }
                        }
                    }
                }
            }
            catch (SqlException)
            {
                lblLoginStatus.Text = "Database error. Please try again.";
            }
            catch (Exception)
            {
                lblLoginStatus.Text = "Login failed. Please try later.";
            }
        }
    }
}
