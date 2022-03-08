using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WAD.PurchaseHistory
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                purchaseHistory();
            }
        }

        public void purchaseHistory()
        {


            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);

            string query = "SELECT OrderCart.OrderId AS [OrderId] ,Artwork.name AS [name], OrderCart.unit_price AS [unit_price], OrderCart.status AS [status], OrderCart.date AS [date] FROM OrderCart INNER JOIN Customer ON OrderCart.cusid = Customer.Id INNER JOIN Artwork ON OrderCart.artwork_id = Artwork.artwork_id WHERE ( (OrderCart.status = 'paid') AND (OrderCart.cusid ='" + userId + "')) ORDER BY date DESC "; // =' " + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'"
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        //using (DataTable dt = new DataTable())
                        //{
                        sda.Fill(dt);
                        GridViewPH.DataSource = dt;
                        GridViewPH.DataBind();
                        //}
                    }
                }
            }
        }


        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewPH.PageIndex = e.NewPageIndex;
            purchaseHistory();
        }




    }
}