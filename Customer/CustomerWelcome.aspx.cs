using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WAD.Customer
{
    public partial class CustomerWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                if (Request.Cookies["1stLogin"].Value.Equals("1"))
                    Response.Redirect("~/Customer/CustomerProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<string> selectedValues = ArtGenrePreference1.GetCheckboxItem;
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            //Insert into customer_favouritegenre
            string strInsert = "Insert Into FavouriteGenre(user_id, artgenre_id) Values (@user_id, @artgenre_id)";
            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            foreach (string s in selectedValues)
            {
                cmdInsert.Parameters.AddWithValue("@user_id", userId);
                cmdInsert.Parameters.AddWithValue("@artgenre_id", s);
                cmdInsert.ExecuteNonQuery();
                cmdInsert.Parameters.Clear();
            }
            //Update first_time_login
            string strUpdate = "Update Customer SET first_time_login =1 WHERE Id=@cus_id";
            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@cus_id", userId);
            cmdUpdate.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Customer/CustomerProfile.aspx"); //TODO: Change to customer homepage
        }
    }
}