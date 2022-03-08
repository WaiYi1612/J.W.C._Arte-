using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD.Controls.ProfileSettings
{
    public partial class UserProfile : System.Web.UI.UserControl
    {
        public string profileUri = "~/Assets/Images/Profiles/empty-profile-male.png", r1l1 = "Address:", r1t1 = "", r2l1 = "Favourite Genre:", r1t1ErrorMessage = "Address cannot be empty", r2t1ErrorMessage = "Must choose at least 1 item", successMessage = "You Profile has been updated successfully.", errorMessage = "Update failed, there is an error.";
        public bool r1t1Required = false;

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            r1t1 = TextBox1.Text;
        }

        public Dictionary<string, string> favouriteGenre = new Dictionary<string, string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
                PreviewImage();

            if (!Page.IsPostBack)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                string strSelect = "SELECT * FROM [ArtGenre]";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                SqlDataReader dtrInfo = cmdSelect.ExecuteReader();
                CheckBoxList1.DataSource = dtrInfo;
                CheckBoxList1.DataBind();

                Image1.ImageUrl = profileUri;
                Label1.Text = r1l1;
                Label2.Text = r2l1;
                TextBox1.Text = r1t1;
                RequiredFieldValidator1.Enabled = r1t1Required;
                RequiredFieldValidator1.ErrorMessage = r1t1ErrorMessage;

                System.Diagnostics.Debug.WriteLine("Test1");
                foreach (KeyValuePair<string, string> kvp in favouriteGenre)
                {
                    System.Diagnostics.Debug.WriteLine("Test1 " + kvp.Key);
                    CheckBoxList1.Items.FindByValue(kvp.Key).Selected = true;
                }
            }
        }

        public void Success()
        {
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = successMessage;
            lblMessage.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        }

        public void Fail()
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = errorMessage;
            lblMessage.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        }

        protected void PreviewImage()
        {
            string filename = FileUpload1.FileName;
            string folderPath = Server.MapPath("~/Assets/Images/Profiles/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            if (new Regex(@"(.*?)\.(png|PNG)$").IsMatch(filename))
            {
                //Save the File to the Directory (Folder).
                FileUpload1.SaveAs(folderPath + Path.GetFileName(filename));
                profileUri = "~/Assets/Images/Profiles/" + Path.GetFileName(filename);
                Image1.ImageUrl = profileUri;
            }
            else
            {
                profileUri = "~/Assets/Images/Profiles/empty-profile-male.png";
                Image1.ImageUrl = profileUri;
            }
        }

        public byte[] ImageToByteArray(System.Drawing.Image imageIn)
        {
            using (var ms = new MemoryStream())
            {
                imageIn.Save(ms, imageIn.RawFormat);
                return ms.ToArray();
            }
        }

        public Dictionary<string, string> GetCheckboxItem()
        {
            Dictionary<string, string> dict;
            dict = new Dictionary<string, string>();

            foreach (ListItem s in CheckBoxList1.Items.Cast<ListItem>().Where(n => n.Selected).ToList())
            {
                if (s.Selected)
                {
                    dict.Add(s.Value, s.Text);
                }
            }
            return dict;
        }
    }
}