using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD.Controls
{
    public partial class ArtGenrePreference : System.Web.UI.UserControl
    {
        public string question = "Welcome, what type of art are you interested?", searchPlaceholder = "Choose your genre", searchHere = "Search here..", saveText = "Save", errorMessage = "Must choose at least 1 item";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label1.Text = question;
            }
        }

        public List<string> GetCheckboxItem
        {
            get
            {
                //string fruit = Request.Form["Genre"];
                return CheckBoxList1.Items.Cast<ListItem>()
             .Where(li => li.Selected)
             .Select(li => li.Value)
             .ToList();
            }
        }
    }
}