using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WAD.Artwork
{

    public partial class Gallery : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            BindRepeater();
        }


        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Gallery.gallery_id, Gallery.name, Gallery.description, Artwork.artwork_id, Artwork.name AS ArtName, Artwork.image FROM Gallery INNER JOIN Artwork ON Gallery.gallery_id = Artwork.gallery_id WHERE Artwork.artwork_id IN (17,21,35)", con);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                    con.Close();
                }
            }
        }

        protected void datalist1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int ID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
            Response.Redirect("Artwork.aspx?ID=" + ID);

        }
        protected void btnMore_Click(object sender, EventArgs e)
        {

        }

    }
}