using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WAD.Artwork
{

    public partial class Artwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);

            if (IsPostBack)
                intID = 0;
            if (intID != 0)
            {
                ddgallery.Text = ID;
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand sqlcomm = new SqlCommand();
                string sqlquery = "select * from [dbo].[Artwork] where gallery_id = @GalleryId";
                sqlcomm.CommandText = sqlquery;
                sqlcomm.Connection = con;
                con.Open();
                sqlcomm.Parameters.AddWithValue("GalleryId", intID);
                SqlDataReader dtrInfo4 = sqlcomm.ExecuteReader();

                if (dtrInfo4.HasRows)//has record(s)
                {
                    DataList1.DataSource = dtrInfo4;
                    DataList1.DataBind();
                    txtno.Text = "This is all the art found.";
                }

                con.Close();
            }
            else
            {
                if (!IsPostBack)
                    LoadImages();
            }


        }

        private void LoadImages()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("Select * from Artwork", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                DataList1.DataSource = rdr;
                DataList1.DataBind();
                con.Close();
            }
        }
        protected void datalist1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int ID = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
            Response.Redirect("ArtworkDetails.aspx?ID=" + ID);

        }





        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand sqlcomm = new SqlCommand();
            string sqlquery = "select * from [dbo].[Artwork] where gallery_id like '%'+@GalleryId+'%' and price BETWEEN @Min AND @Max and size_height between @size1 and @size2 and size_width between @size1 and @size2";

            sqlcomm.CommandText = sqlquery;
            sqlcomm.Connection = con;
            con.Open();
            sqlcomm.Parameters.AddWithValue("GalleryId", ddgallery.Text);

            if (ttmin.Text == "")
            {
                ttmin.Text = "1";
            }
            sqlcomm.Parameters.AddWithValue("Min", Convert.ToInt32(ttmin.Text));
            if (ttmax.Text == "")
            {
                ttmax.Text = "10000";
            }
            sqlcomm.Parameters.AddWithValue("Max", Convert.ToInt32(ttmax.Text));
            var txtSize = this.Request.Form["txtSize"];
            sqlcomm.Parameters.AddWithValue("size1", Convert.ToInt32(txtSize));

            var txtSize0 = this.Request.Form["txtSize0"];
            sqlcomm.Parameters.AddWithValue("size2", Convert.ToInt32(txtSize0));

            SqlDataReader dtrInfo3 = sqlcomm.ExecuteReader();

            if (dtrInfo3.HasRows)//has record(s)
            {
                DataList1.DataSource = dtrInfo3;
                DataList1.DataBind();
                txtno.Text = "This is all the art found.";
            }
            else
                txtno.Text = "There was no art found， maybe you can look on others.";
            con.Close();
        }

        protected void ddgallery_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnArtS_Click(object sender, EventArgs e)
        {

        }
    }
}