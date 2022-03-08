using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD.Artist
{
    public partial class ArtistProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Dictionary<string, string> favouriteGenre;
                favouriteGenre = new Dictionary<string, string>();
                string artistArtGenre = "<ul>";
                int artGenre = 0;
                int userId = int.Parse(Request.Cookies["userId"].Value);
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();

                //Fetch from Cookies
                UserProfile.r1l2 = User.Identity.Name;

                //Should not overwrite image path if empty
                if (Request.Cookies["image"].Value.Length > 0)
                    UserProfile.profileUri = Request.Cookies["image"].Value;

                if (Request.Cookies["address"].Value.Length > 0)
                    UserProfile.r2l2 = Request.Cookies["address"].Value;
                else
                    UserProfile.r2l2 = "-";

                //User's Facourite Art Genre
                string strSelect = "SELECT DISTINCT  [ArtGenre].artGenreName, [ArtGenre].Id FROM [FavouriteGenre] RIGHT JOIN [Artist] ON [Artist].id =[FavouriteGenre].user_id LEFT JOIN [ArtGenre] ON [ArtGenre].Id =[FavouriteGenre].artgenre_id WHERE [FavouriteGenre].user_id = @id";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@id", userId);
                SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

                if (dtrInfo.HasRows)//has record(s)
                {
                    while (dtrInfo.Read())
                    {
                        artGenre++;
                        artistArtGenre += "<li>" + dtrInfo["artGenreName"] + "</li>";
                        favouriteGenre.Add(dtrInfo["Id"].ToString(), dtrInfo["artGenreName"].ToString());
                    }
                }
                artistArtGenre += "</ul>";

                if (artGenre == 0)
                    artistArtGenre = "-";

                UserProfile.r4l2 = artistArtGenre;
                //Save favourite genre to
                string test = string.Join(";", favouriteGenre)
                                                                    .Replace("[", "")
                                                                    .Replace("]", "");
                System.Diagnostics.Debug.WriteLine("Test1 " + test);
                HttpCookie cookie = new HttpCookie("favArtGenre", test); //Make into CSV
                Response.Cookies.Add(cookie);

                //Artwork Datasource
                strSelect = "SELECT Artwork.artwork_id, Artwork.name, Artwork.image,  vw_aspnet_Users.UserName, Total_Artwork FROM (SELECT  COUNT(*) AS Total_Artwork FROM [Artwork]  WHERE artist_id = @id) AS Total_Artwork, [Artwork] INNER JOIN Artist ON Artwork.artist_id=Artist.id INNER JOIN vw_aspnet_Users ON Artist.userid=vw_aspnet_Users.UserId WHERE artist_id = @id";
                cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@id", userId);
                dtrInfo = cmdSelect.ExecuteReader();

                if (dtrInfo.HasRows)//has record(s)
                {
                    DataList1.DataSource = dtrInfo;
                    DataList1.DataBind();
                    //Alternative to show empty datalist message
                    lblNoRecord.Visible = DataList1.Items.Count == 0;
                }

                //Get Total Artwork
                strSelect = "SELECT  COUNT(*) AS Total_Artwork FROM [Artwork]  WHERE artist_id = @id";
                cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@id", userId);
                UserProfile.r3l2 = cmdSelect.ExecuteScalar().ToString();
                con.Close();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int intID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
            Response.Redirect("~/Artist/UpdateArt.aspx?id=" + intID);
        }

        void Page_Error()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Invalid Role", "alert('" + Server.GetLastError().Message + "');", true);
            Server.ClearError();
        }
    }
}