using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD.SignIn_SignUp
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button lbButton = Login1.FindControl("LoginButton") as Button;
            this.Form.DefaultButton = lbButton.UniqueID;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = Login1.UserName;
            string strSelect = "";
            string pageUrl = "";
            bool rememberMe = Login1.RememberMeSet, storeUserId = true;
            string loginType = Request.QueryString["type"] ?? "";

            if (Membership.ValidateUser(userName, Login1.Password))
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();

                //RememberMe after login
                FormsAuthentication.SetAuthCookie(userName, rememberMe);

                if (Roles.IsUserInRole(userName, "Admin") && Roles.GetAllRoles().Contains(loginType))
                {
                    pageUrl = "~/Admin/AdminHomepage.aspx";
                    storeUserId = false;
                }
                else if (Roles.IsUserInRole(userName, "Customer") && loginType.Equals("Customer"))
                {
                    pageUrl = "~/Customer/CustomerWelcome.aspx";
                    strSelect = "Select Customer.Id,Customer.address,Customer.image,Customer.first_time_login from Customer inner join vw_aspnet_Users on Customer.userid = vw_aspnet_Users.UserId  and vw_aspnet_Users.UserName = @username";
                }
                else if (Roles.IsUserInRole(userName, "Artist") && loginType.Equals("Artist"))
                {
                    pageUrl = "~/Artist/ArtistWelcome.aspx";
                    strSelect = "Select Artist.Id, Artist.address,Artist.image,Artist.first_time_login from Artist inner join vw_aspnet_Users on Artist.userid = vw_aspnet_Users.UserId  and vw_aspnet_Users.UserName = @username";
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Invalid Role", "alert('" + "Your username aren't assigned with this role" + "');", true);
                    storeUserId = false;
                }
                if (storeUserId)
                {
                    try
                    {
                        SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                        cmdSelect.Parameters.AddWithValue("@username", userName);
                        SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

                        if (dtrInfo.HasRows)//has record(s)
                        {
                            while (dtrInfo.Read())
                            {
                                HttpCookie cookie1 = new HttpCookie("userId", dtrInfo["Id"] == null ? "" : dtrInfo["Id"].ToString());
                                HttpCookie cookie2 = new HttpCookie("address", dtrInfo["address"] == null ? "" : dtrInfo["address"].ToString());
                                HttpCookie cookie3 = new HttpCookie("image", dtrInfo["image"] == null ? "" : dtrInfo["image"].ToString());
                                HttpCookie cookie4 = new HttpCookie("1stLogin", dtrInfo["first_time_login"] == null ? "" : dtrInfo["first_time_login"].ToString());
                                Response.Cookies.Add(cookie1);
                                Response.Cookies.Add(cookie2);
                                Response.Cookies.Add(cookie3);
                                Response.Cookies.Add(cookie4);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Invalid Role", "alert('" + ex.Message + "');", true);
                    }
                }
                con.Close();
                Response.Redirect(pageUrl);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}