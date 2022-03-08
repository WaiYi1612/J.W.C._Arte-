using System;
using System.Web.Security;
using System.Web.UI;

namespace WAD.Admin
{
    public partial class AdminHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlUsers1.DataSource = Membership.GetAllUsers();
                ddlUsers1.DataBind();
                ddlUsers0.DataSource = Membership.GetAllUsers();
                ddlUsers0.DataBind();

                ddlRoles0.DataSource = Roles.GetAllRoles();
                ddlRoles0.DataBind();
                ddlRoles1.DataSource = Roles.GetAllRoles();
                ddlRoles1.DataBind();
            }
        }

        protected void createRoleBtn_Click(object sender, EventArgs e)
        {
            Roles.CreateRole(TextBox1.Text);

            ddlRoles0.DataSource = Roles.GetAllRoles();
            ddlRoles0.DataBind();
            ddlRoles1.DataSource = Roles.GetAllRoles();
            ddlRoles1.DataBind();
        }

        protected void assignRoleBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Roles.AddUserToRole(ddlUsers0.SelectedItem.Text, ddlRoles1.SelectedItem.Text);
            }
            catch
            {

            }
        }

        protected void unassignRoleBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Roles.RemoveUserFromRole(ddlUsers0.SelectedItem.Value, ddlRoles1.SelectedItem.Value);
            }
            catch
            {

            }
        }

        protected void deleteUserBtn_Click(object sender, EventArgs e)
        {
            Membership.DeleteUser(ddlUsers1.SelectedItem.Value);

            ddlUsers0.DataSource = Membership.GetAllUsers();
            ddlUsers0.DataBind();
            ddlUsers1.DataSource = Membership.GetAllUsers();
            ddlUsers1.DataBind();
        }

        protected void deleteRoleBtn_Click(object sender, EventArgs e)
        {
            Roles.DeleteRole(TextBox1.Text);

            ddlRoles0.DataSource = Roles.GetAllRoles();
            ddlRoles0.DataBind();
            ddlRoles1.DataSource = Roles.GetAllRoles();
            ddlRoles1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}