using System;
using System.Web.UI;

namespace RoomManagementSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                LoginLink.Visible = false;
                SignupLink.Visible = false;
                LogoutLink.Visible = true;
            }
            else
            {
                LoginLink.Visible = true;
                SignupLink.Visible = true;
                LogoutLink.Visible = false;
            }
        }
    }
}
