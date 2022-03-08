using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace WAD.SignIn_SignUp
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            MembershipUser Newuser = Membership.GetUser(CreateUserWizard1.UserName);
            Guid newuserid = (Guid)Newuser.ProviderUserKey;
            DropDownList accountType = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("AccountType");
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string strInsert = "";

            con.Open();

            if (accountType.SelectedIndex == 0)
            {
                //Artist
                strInsert = "Insert Into Artist(userid) Values (@id)";
            }
            else
            {
                //Customer
                strInsert = "Insert Into Customer(userid) Values (@id)";
            }
            Roles.AddUserToRole(CreateUserWizard1.UserName, accountType.SelectedItem.Value);
            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            cmdInsert.Parameters.AddWithValue("@id", newuserid);
            cmdInsert.ExecuteNonQuery();
            con.Close();
        }
    }
}