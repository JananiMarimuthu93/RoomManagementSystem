<%@ WebHandler Language="C#" Class="RoomImageHandler" %>

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public class RoomImageHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int roomId;
        if (int.TryParse(context.Request.QueryString["RoomID"], out roomId))
        {
            string conStr = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT RoomImage FROM Rooms WHERE RoomID = @RoomID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@RoomID", roomId);
                con.Open();
                
                var result = cmd.ExecuteScalar();
                if (result != DBNull.Value && result != null)
                {
                    byte[] imageBytes = (byte[])result;
                    context.Response.ContentType = "image/jpeg";
                    context.Response.BinaryWrite(imageBytes);
                }
                else
                {
                    context.Response.StatusCode = 404;
                }
            }
        }
        else
        {
            context.Response.StatusCode = 400; // Bad Request
        }
    }

    public bool IsReusable => false;
}