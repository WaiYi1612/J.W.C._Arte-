using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD
{
    public partial class CustomerUserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["image"].Value.Length > 0)
                    UserProfile.profileUri = Request.Cookies["image"].Value;

                UserProfile.r1t1 = Request.Cookies["address"].Value;

                if (Request.Cookies["favArtGenre"].Value.Length > 0)
                    UserProfile.favouriteGenre = Request.Cookies["favArtGenre"].Value.Split(';')
                                                                        .Select(part => part.Split(','))
                                                                        .Where(part => part.Length == 2)
                                                                        .ToDictionary(sp => sp[0], sp => sp[1]);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Update Database
                bool updateState = true;
                Dictionary<string, string> originalFavArtGenre, updatingFavArtGenre;
                List<string> addedFavArtGenre = new List<string>(), removedFavArtGenre = new List<string>();
                int userId = int.Parse(Request.Cookies["userId"].Value);
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();

                originalFavArtGenre = Request.Cookies["favArtGenre"].Value.Split(';')
                                                                        .Select(part => part.Split(','))
                                                                        .Where(part => part.Length == 2)
                                                                        .ToDictionary(sp => sp[0], sp => sp[1]);
                updatingFavArtGenre = UserProfile.GetCheckboxItem();

                //find removed
                foreach (KeyValuePair<string, string> kvp in originalFavArtGenre)
                {
                    if (!updatingFavArtGenre.ContainsKey(kvp.Key))
                        removedFavArtGenre.Add(kvp.Key);
                }

                //find added
                foreach (KeyValuePair<string, string> kvp in updatingFavArtGenre)
                {
                    if (!originalFavArtGenre.ContainsKey(kvp.Key))
                        addedFavArtGenre.Add(kvp.Key);
                }

                //Update User Profile
                string strUpdate = "Update Customer SET image=@image, address=@address WHERE Id = @id";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                cmdUpdate.Parameters.AddWithValue("@image", UserProfile.profileUri);
                cmdUpdate.Parameters.AddWithValue("@address", UserProfile.r1t1);
                cmdUpdate.Parameters.AddWithValue("@id", userId);

                int updateStatus = cmdUpdate.ExecuteNonQuery();

                if (updateStatus <= 0)
                    updateState = false;

                //Add User's Facourite Art Genre
                foreach (string s in addedFavArtGenre)
                {
                    strUpdate = "Insert Into FavouriteGenre (artgenre_id,user_id) Values (@art_id,@id)";
                    cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@art_id", s);
                    cmdUpdate.Parameters.AddWithValue("@id", userId);

                    updateStatus = cmdUpdate.ExecuteNonQuery();

                    if (updateStatus <= 0)
                        updateState = false;
                }

                //Delete User's Facourite Art Genre
                foreach (string s in removedFavArtGenre)
                {
                    strUpdate = "Delete From FavouriteGenre Where  artgenre_id=@art_id AND user_id = @id";
                    cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@art_id", s);
                    cmdUpdate.Parameters.AddWithValue("@id", userId);

                    updateStatus = cmdUpdate.ExecuteNonQuery();

                    if (updateStatus <= 0)
                        updateState = false;
                }

                con.Close();

                //Update Cookies
                Response.Cookies["image"].Value = UserProfile.profileUri;
                Response.Cookies["address"].Value = UserProfile.r1t1;
                Response.Cookies["favArtGenre"].Value = string.Join(";", updatingFavArtGenre)
                                                                            .Replace("[", "")
                                                                            .Replace("]", "");

                if (updateState)
                    UserProfile.Success();
                else
                    UserProfile.Fail();
            }
        }
    }
}