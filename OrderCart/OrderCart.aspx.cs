using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WAD.OrderCart
{
    public partial class OrderCart : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrderCartDisplay();
                displayTotal();

            }
        }

        public void OrderCartDisplay()
        {
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);


            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);

            string query = "SELECT OrderCart.OrderId AS [Cart Id], Artwork.name AS [Artwork Name], Artwork.image AS Image, OrderCart.date AS [Added Date], Artwork.price AS [Price (MYR)] FROM OrderCart INNER JOIN Customer ON OrderCart.cusid = Customer.Id INNER JOIN Artwork ON OrderCart.artwork_id = Artwork.artwork_id WHERE (OrderCart.status = 'unpaid') AND (OrderCart.cusid ='" + userId + "')"; // =' " + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'"
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
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        //}
                    }
                }
            }
        }




        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //DELETE FROM OrderCart WHERE OrderId = @OrderId
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                System.Web.UI.WebControls.Label lbldeleteid = (System.Web.UI.WebControls.Label)row.FindControl("lblID");

                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM OrderCart WHERE OrderId =' " + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                OrderCartDisplay();
                displayTotal();
            }
        }

        /*
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
         */

        protected void directPaymentBtn_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0)
            {
                //Gird is empty
                System.Windows.Forms.DialogResult res = MessageBox.Show("Order Cart is empty, add artworks only proceed payment. ", " ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (res == DialogResult.OK)
                {
                    //MessageBox.Show("You have clicked Ok Button");
                    Response.Redirect("/OrderCart/OrderCart.aspx");
                    //Some task…  
                }
                //if (res == DialogResult.Cancel)
                //{
                //    MessageBox.Show("You have clicked Cancel Button");
                //    //Some task…  
                //}
            }
            else
            {

                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                System.DateTime today = System.DateTime.Now;
                string temporary = "no data";
                string pay_status = "unpaid";
                // string updatequery3 = "SELECT SUM(OrderCart.shipment_Price) + SUM(OrderCart.quantity * Artwork.price) AS [Total Amount (MYR)] FROM Artwork INNER JOIN OrderCart ON Artwork.artwork_id = OrderCart.artwork_id";
                //call id
                int userId = int.Parse(Request.Cookies["userId"].Value);
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string sql = "INSERT INTO [Payment] VALUES ((SELECT SUM(OrderCart.shipment_Price) + SUM(OrderCart.quantity * Artwork.price) AS [Total Amount (MYR)] FROM Artwork INNER JOIN OrderCart ON Artwork.artwork_id = OrderCart.artwork_id WHERE (OrderCart.cusid = '" + userId + "') AND (OrderCart.status = 'unpaid')),@method,@creditcard_num,@transaction_date,@receipt_email,@delivery_address,@cus_id, @payment_status)";

                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        //cmd.Parameters.AddWithValue("@amount", updatequery3);
                        cmd.Parameters.AddWithValue("@method", temporary);
                        cmd.Parameters.AddWithValue("@creditcard_num", temporary);
                        cmd.Parameters.AddWithValue("@transaction_date", today);
                        cmd.Parameters.AddWithValue("@receipt_email", temporary);
                        cmd.Parameters.AddWithValue("@delivery_address", temporary);
                        //call id
                        cmd.Parameters.AddWithValue("@cus_id", userId);
                        cmd.Parameters.AddWithValue("@payment_status", pay_status);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }


                }

                //updateAmount();
                Response.Redirect("/Payment/Payment.aspx");
            }
        }

        public void updateAmount()
        {
            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string updatequery3 = "SELECT SUM(OrderCart.shipment_Price) + SUM(OrderCart.quantity * Artwork.price) AS [Total Amount (MYR)] FROM Artwork INNER JOIN OrderCart ON Artwork.artwork_id = OrderCart.artwork_id WHERE (OrderCart.status = 'unpaid') AND(OrderCart.cusid = '" + userId + "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(updatequery3, con);
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        public void displayTotal()
        {
            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query2 = "SELECT SUM(OrderCart.quantity * Artwork.price) AS [Total Order Price (MYR)] FROM OrderCart INNER JOIN Artwork ON Artwork.artwork_id = OrderCart.artwork_id WHERE(OrderCart.status = 'unpaid') AND(OrderCart.cusid = '" + userId + "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand(query2, con);

                cmd.Connection = con;

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd);

                con.Open();
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                DetailsView1.DataSource = dt2;
                DetailsView1.DataBind();


            }
        }

    }
}



