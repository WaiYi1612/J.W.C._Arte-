using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace WAD.Artwork
{
    public partial class AddArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string username = User.Identity.Name;
            lblName.Text = username;
        }


        public void Clear()
        {
            hfArtworkID.Value = "";
            txtArt.Text = txtPrice.Text = txtQuant.Text = txtHeight.Text = txtWidth.Text = "";

        }


        protected void btnClear_Click1(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string status = "";
            byte[] bytes;
            using (BinaryReader img = new BinaryReader(artUpload.PostedFile.InputStream))
            {
                bytes = img.ReadBytes(artUpload.PostedFile.ContentLength);
            }
            if (int.Parse(txtQuant.Text) > 0)
                status = "available";
            else status = "not available";
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                int userId = int.Parse(Request.Cookies["userId"].Value);
                string sql = "INSERT INTO Artwork VALUES (@Name, @image,@status,@price,@published,@height,@width,@quantity,@added,@updated,@artist,@gallery)";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtArt.Text);
                    cmd.Parameters.AddWithValue("@image", bytes);
                    cmd.Parameters.AddWithValue("status", status);
                    cmd.Parameters.AddWithValue("@price", int.Parse(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@published", DateTime.Today);
                    cmd.Parameters.AddWithValue("@height", int.Parse(txtHeight.Text));
                    cmd.Parameters.AddWithValue("@width", int.Parse(txtWidth.Text));
                    cmd.Parameters.AddWithValue("@quantity", int.Parse(txtQuant.Text));
                    cmd.Parameters.AddWithValue("@added", DateTime.Today);
                    cmd.Parameters.AddWithValue("@updated", DateTime.Today);
                    //artist id
                    cmd.Parameters.AddWithValue("@artist", userId);
                    cmd.Parameters.AddWithValue("@gallery", ddCategory.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri); //Why need this?
        }
    }
}