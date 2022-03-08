using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control centerNav = new Control(), rightNav = new Control();
            if (Roles.IsUserInRole("Artist"))
            {
                centerNav = LoadControl("~/Controls/MasterPage/Center/ArtistNavBar.ascx");
                rightNav = LoadControl("~/Controls/MasterPage/Right/ArtistNavBar.ascx");
            }
            else if (Roles.IsUserInRole("Customer"))
            {
                centerNav = LoadControl("~/Controls/MasterPage/Center/CustomerNavBar.ascx");
                rightNav = LoadControl("~/Controls/MasterPage/Right/CustomerNavBar.ascx");
            }
            else
            {
                centerNav = LoadControl("~/Controls/MasterPage/Center/GeneralNavBar.ascx");
                rightNav = LoadControl("~/Controls/MasterPage/Right/GeneralNavBar.ascx");
            }
            CenterNavBar.Controls.Clear();
            CenterNavBar.Controls.Add(centerNav);

            RightNavBar.Controls.Clear();
            RightNavBar.Controls.Add(rightNav);
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            FormsAuthentication.SignOut();

            //Remove User related data upon logout
            if (Request.Cookies["userId"] != null)
                Response.Cookies["userId"].Expires = DateTime.Now.AddDays(-1);

            if (Request.Cookies["1stLogin"] != null)
                Response.Cookies["1stLogin"].Expires = DateTime.Now.AddDays(-1);

            if (Request.Cookies["address"] != null)
                Response.Cookies["address"].Expires = DateTime.Now.AddDays(-1);

            if (Request.Cookies["image"] != null)
                Response.Cookies["image"].Expires = DateTime.Now.AddDays(-1);

            if (Request.Cookies["favArtGenre"] != null)
                Response.Cookies["favArtGenre"].Expires = DateTime.Now.AddDays(-1);

            Session.Abandon();
            Response.Redirect("~/HomePage/HomePage.aspx", true);
        }
    }
}