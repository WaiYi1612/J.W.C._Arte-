using System;
using System.Net.Mail;
using System.Web.UI;

namespace WAD.Controls.ProfileSettings
{
    public partial class ContactForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MailMessage myMessage = new MailMessage
            {
                Subject = "Test Message",
                Body = TextBox1.Text + "\nSend at " + DateTime.Now,
                From = new MailAddress("jwcarte1509@gmail.com ", "Anonymous")
            };
            myMessage.To.Add(new MailAddress("jwcarte1509@gmail.com ", "J.W.C. Arte"));
            SmtpClient mySmtpClient = new SmtpClient
            {
                Timeout = 30000
            };
            try
            {
                mySmtpClient.Send(myMessage);
                lblMessage.Text = "Mail Sent";
                lblMessage.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
    }
}