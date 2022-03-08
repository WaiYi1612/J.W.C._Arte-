using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAD.Artwork
{
    public partial class ArtworkDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT status FROM [Artwork] WHERE ([artwork_id] = @artid)", con);
            cmd.Parameters.AddWithValue("@artid", intID);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            rdr.Read();
            string stat = rdr["status"].ToString();
            rdr.Close();
            con.Close();
            if (!stat.Equals("available"))
            {
                btnOrderCart.Visible = false;
                btnWish.Visible = false;
                btnOrderCart.OnClientClick = "";
            }
            else
                btnOrderCart.OnClientClick = "addCart()";
        }


        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void btnWish_Click(object sender, EventArgs e)
        {
            //customerID
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                int userId = int.Parse(Request.Cookies["userId"].Value);
                string sql = "INSERT INTO WishList VALUES (@Artwork,@Customer)";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@Artwork", intID);
                    cmd.Parameters.AddWithValue("@Customer", userId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void btnCart_Click1(object sender, EventArgs e)
        {
            //Called the id from other table
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);

            string custId = Request.QueryString["Id"];
            int customer = Convert.ToInt32(custId);

            //string Price = Request.QueryString["Price"];
            //decimal price = (decimal)Convert.ToDouble(Price);


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
                    cmd.Parameters.AddWithValue("@artwork_id", intID);
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
            }
            updateUnitPrice();
        }

        public void updateUnitPrice()
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
    }
}