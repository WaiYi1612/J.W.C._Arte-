using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;


namespace WAD.Customer
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Dictionary<string, string> favouriteGenre;
            favouriteGenre = new Dictionary<string, string>();
            string cusArtGenre = "<ul>";
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
            string strSelect = "SELECT DISTINCT [ArtGenre].artGenreName, [ArtGenre].Id FROM [FavouriteGenre] RIGHT JOIN [Customer] ON [Customer].Id =[FavouriteGenre].user_id LEFT JOIN [ArtGenre] ON [ArtGenre].Id =[FavouriteGenre].artgenre_id WHERE [FavouriteGenre].user_id = @id";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", userId);
            SqlDataReader dtrInfo = cmdSelect.ExecuteReader();

            if (dtrInfo.HasRows)
            {
                while (dtrInfo.Read())
                {
                    cusArtGenre += "<li>" + dtrInfo["artGenreName"] + "</li>";
                    favouriteGenre.Add(dtrInfo["Id"].ToString(), dtrInfo["artGenreName"].ToString());
                }
            }
            cusArtGenre += "</ul>";

            if (artGenre == 0)
                cusArtGenre = "-";

            UserProfile.r3l2 = cusArtGenre;
            //Save favourite genre to cookie
            HttpCookie cookie = new HttpCookie("favArtGenre", string.Join(";", favouriteGenre)
                                                                    .Replace("[", "")
                                                                    .Replace("]", "")
                                                                    ); //Make into CSV
            Response.Cookies.Add(cookie);

            //Wishlist Datasource
            string strSelect2 = "SELECT WishList.artwork_id, Artwork.name, Artwork.image, vw_aspnet_Users.UserName FROM WishList INNER JOIN Artwork ON WishList.artwork_id = Artwork.artwork_id INNER JOIN Artist ON Artwork.artist_id=Artist.id INNER JOIN vw_aspnet_Users ON Artist.userid=vw_aspnet_Users.UserId WHERE (WishList.cust_id = @cust_id)";
            SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);

            cmdSelect2.Parameters.AddWithValue("@cust_id", userId);
            SqlDataReader dtrInfo2 = cmdSelect2.ExecuteReader();

            if (dtrInfo2.HasRows)//has record(s)
            {
                DataList1.DataSource = dtrInfo2;
                DataList1.DataBind();
                //Alternative to show empty datalist message
                lblNoRecord.Visible = DataList1.Items.Count == 0;
            }

            con.Close();

        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int intID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);

            System.DateTime today = System.DateTime.Now;
            int quantity = 1;
            string status = "unpaid";

            //insert id
            int userId = int.Parse(Request.Cookies["userId"].Value);

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "INSERT INTO [OrderCart] VALUES (@quantity,@artwork_id,@date,@shipment_Price,@status,@unit_price,@cusid)";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@artwork_id", intID);  //need to write query for insert
                    cmd.Parameters.AddWithValue("@date", today);
                    cmd.Parameters.AddWithValue("@shipment_Price", 10.00);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@unit_price", 10.00);
                    //insert id
                    cmd.Parameters.AddWithValue("@cusid", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                string sqldelete = "DELETE FROM WishList WHERE artwork_id=@artwork_id and cust_id=@cusid";
                using (SqlCommand cmd = new SqlCommand(sqldelete, con))
                {
                    cmd.Parameters.AddWithValue("@artwork_id", intID);
                    cmd.Parameters.AddWithValue("@cusid", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Response.Redirect("/Customer/CustomerProfile.aspx");
            }
            UpdateUnitPrice();
        }

        public void UpdateUnitPrice()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string updatequery3 = "UPDATE OrderCart SET unit_price = Artwork.price FROM OrderCart INNER JOIN Artwork ON OrderCart.artwork_id = Artwork.artwork_id AND OrderCart.artwork_id = Artwork.artwork_id";
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(updatequery3, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        void Page_Error()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Invalid Role", "alert('" + Server.GetLastError().Message + "');", true);
            Server.ClearError();
        }
    }
}
