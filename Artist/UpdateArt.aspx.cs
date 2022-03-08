using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace WAD.Artwork
{
    public partial class UpdateArt : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadImages();

                //artword id should be get from artsit page choices (use query stirng can refer to art details)
                string ID = Request.QueryString["id"];
                int intID = Convert.ToInt32(ID);
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Artwork] WHERE ([artwork_id] = @artid)", con);
                cmd.Parameters.AddWithValue("@artid", intID);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                rdr.Read();
                txtName.Text = rdr["name"].ToString();
                txtHeight.Text = rdr["size_height"].ToString();
                txtWidth.Text = rdr["size_width"].ToString();
                txtPrice.Text = rdr["price"].ToString();
                txtQuantity.Text = rdr["quantity"].ToString();
                ddCategory.Text = rdr["gallery_id"].ToString();

                rdr.Close();
                con.Close();
            }

        }

        private void LoadImages()
        {

            string ID = Request.QueryString["id"];
            int intID = Convert.ToInt32(ID);
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Artwork] WHERE ([artwork_id] = @artid)", con);
            cmd.Parameters.AddWithValue("@artid", intID);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            con.Close();

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            //need to put art ID

            SqlCommand cmd = new SqlCommand("update [dbo].[Artwork] set name=@name, size_height=@height, size_width=@width, price=@price, quantity=@quantity, updated_at=@updated, gallery_id=@gallery where artwork_id=3", con);

            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@price", int.Parse(txtPrice.Text));
            cmd.Parameters.AddWithValue("@height", int.Parse(txtHeight.Text));
            cmd.Parameters.AddWithValue("@width", int.Parse(txtWidth.Text));
            cmd.Parameters.AddWithValue("@quantity", int.Parse(txtQuantity.Text));
            cmd.Parameters.AddWithValue("@updated", DateTime.Today);
            cmd.Parameters.AddWithValue("@gallery", ddCategory.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            //cmd.Dispose();

            con.Close();
            //back to artist profile page
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            //back to artist profile page
            Response.Redirect("ArtistProfile.aspx");
        }
    }
}