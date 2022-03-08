using System;
using System.Web.UI;


namespace WAD.Controls
{
    public partial class UserProfile : System.Web.UI.UserControl
    {
        public string profileUri = "~/Assets/Images/Profiles/empty-profile-male.png", r1l1 = "", r1l2 = "", r2l1 = "", r2l2 = "", r3l1 = "", r3l2 = "", r4l1 = "", r4l2 = "", btn1Text = "", btn2Text = "", btn1Redirect = "", btn2Redirect = "";
        public bool btn1Visible = false, btn2Visible = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Image1.ImageUrl = profileUri;
                Label3.Text = r1l1;
                lblName.Text = r1l2;
                Label1.Text = r2l1;
                lblAddress.Text = r2l2;
                Label2.Text = r3l1;
                lblTotalArtwork.Text = r3l2;
                Label4.Text = r4l1;
                lblGenre.Text = r4l2;

                Button1.Text = btn1Text;
                Button1.PostBackUrl = btn1Redirect;
                Button1.Visible = btn1Visible;

                Button2.Text = btn2Text;
                Button2.PostBackUrl = btn2Redirect;
                Button2.Visible = btn2Visible;
            }
        }
    }
}