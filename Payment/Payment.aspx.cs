using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD.Payment
{
    public partial class Payment : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                purchaseItemDetails();
                ReceiptDisplay();
            }
        }

        //validate Credit Card Number
        protected void ValidateCreditCardNumber(object sender, ServerValidateEventArgs args)
        {
            if (Regex.IsMatch(args.Value, @"[^0-9 -]+") == true)
            {
                args.IsValid = false;
            }
            else
            {
                string inString = Regex.Replace(args.Value, @"[^0-9]", "");
                if (inString.Length < 10)
                {
                    args.IsValid = false;
                }
                else
                {
                    char[] array = inString.ToCharArray();
                    Array.Reverse(array);
                    string reverse = new String(array);
                    int s1 = 0, s2 = 0;
                    for (int i = 0; i < reverse.Length; i++)
                    {
                        int digit = 0;
                        if (int.TryParse(reverse[i].ToString(), out digit))
                        {
                            if (i % 2 == 0)
                            {
                                s1 += digit;
                            }
                            else
                            {
                                s2 += 2 * digit;
                                if (digit >= 5)
                                {
                                    s2 -= 9;
                                }
                            }
                        }
                        else
                        {
                            args.IsValid = false;
                            return;
                        }
                    }

                    args.IsValid = ((s1 + s2) % 10 == 0);
                }
            }
        }


        protected void confirmPayBtn_Click(object sender, EventArgs e)
        {
            sendEmail();
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);
            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            System.DateTime today = System.DateTime.Now;
            string pay_status = "paid";

            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "UPDATE Payment SET method = @method, creditcard_num = @creditcard_num, transaction_date = @transaction_date, receipt_email = @receipt_email, delivery_address = @delivery_address , payment_status = @payment_status FROM OrderCart CROSS JOIN Payment WHERE (OrderCart.status = 'unpaid') AND (Payment.payment_status = 'unpaid') AND (Payment.cus_id = '" + userId + "')";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {


                    cmd.Parameters.AddWithValue("@method", radPayMethod.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@creditcard_num", txtCCNum.Text);
                    cmd.Parameters.AddWithValue("@transaction_date", today);
                    cmd.Parameters.AddWithValue("@receipt_email", txtRemail.Text);
                    cmd.Parameters.AddWithValue("@delivery_address", txtdeliveryAdd.Text);
                    //call id
                    cmd.Parameters.AddWithValue("@cus_id", userId);
                    cmd.Parameters.AddWithValue("@payment_status", pay_status);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }


            }
            updateOrderStatus();
            Response.Redirect("/PurchaseHistory/PurchaseHistory.aspx");


        }

        //receipt display
        public void ReceiptDisplay()
        {
            string ID = Request.QueryString["ID"];
            int intID = Convert.ToInt32(ID);


            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);

            string query = "SELECT OrderCart.OrderId AS [Order Id], Artwork.name AS [Artwork Name], Artwork.price AS [Price (MYR)] FROM OrderCart INNER JOIN Customer ON OrderCart.cusid = Customer.Id INNER JOIN Artwork ON OrderCart.artwork_id = Artwork.artwork_id WHERE (OrderCart.status = 'unpaid') AND (OrderCart.cusid ='" + userId + "')"; // =' " + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'"
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


        public void sendEmail()
        {

            System.DateTime today = System.DateTime.Now;
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    GridView1.RenderControl(hw);
                    PaymentDetailView.RenderControl(hw);
                    hw.Write("Receipt JWC Arte<br>" + today);

                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        PdfWriter.GetInstance(pdfDoc, memoryStream);
                        pdfDoc.Open();
                        pdfDoc.Add(new Chunk("")); // << this will do the trick. 
                        htmlparser.Parse(sr);
                        pdfDoc.Close();


                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-disposition", "attachment;filename=ReceiptPDF.pdf");


                        byte[] bytes = memoryStream.ToArray();
                        memoryStream.Close();

                        MailMessage mm = new MailMessage("jwcarte1509@gmail.com", txtRemail.Text);
                        mm.Subject = "Receipt Payment of JWC Arte";
                        mm.Body = "Receipt of JWC Arte Exported PDF Attachment";
                        mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "ReceiptPDF.pdf"));
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                        NetworkCred.UserName = "jwcarte1509@gmail.com";
                        NetworkCred.Password = "1492021jwcarte#";
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;


                        try
                        {
                            smtp.Send(mm);
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }

                    }
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        public void updateOrderStatus()
        {
            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);


            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string paid = "paid";
            string updatequery3 = "UPDATE OrderCart SET status = @status FROM OrderCart INNER JOIN Artwork ON OrderCart.artwork_id = Artwork.artwork_id AND OrderCart.artwork_id = Artwork.artwork_id WHERE (OrderCart.cusid = '" + userId + "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(updatequery3, con))
                {
                    cmd.Parameters.AddWithValue("@status", paid);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
        }


        //protected void discardPayBtn_Click1(object sender, EventArgs e)
        //{

        //        //Response.Redirect("/OrderCart/OrderCart.aspx");

        //}

        public void purchaseItemDetails()
        {
            //call id
            int userId = int.Parse(Request.Cookies["userId"].Value);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query2 = "SELECT SUM(OrderCart.shipment_Price) AS[Shipment Price (MYR)], SUM(OrderCart.quantity * Artwork.price) AS[Total Artwork Price (MYR)], SUM(OrderCart.shipment_Price) + SUM(OrderCart.quantity * Artwork.price) AS[Total Amount (MYR)] FROM OrderCart INNER JOIN Artwork ON Artwork.artwork_id = OrderCart.artwork_id WHERE (OrderCart.status = 'unpaid') AND (OrderCart.cusid = '" + userId + "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand(query2, con);

                cmd.Connection = con;

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd);

                con.Open();
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                PaymentDetailView.DataSource = dt2;
                PaymentDetailView.DataBind();


            }
        }


    }
}