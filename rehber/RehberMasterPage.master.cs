using System;
using System.Web.Security;

public partial class rehber_RehberMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        YetkiKontrol();
    }

    private void YetkiKontrol()
    {
        if (Session["rehberKadi"] != null)
        {
            labelKadi.Text = Session["rehberKadi"].ToString();
            labelAdSoyad.Text = Session["rehberAdSoyad"].ToString();
        }
        else
        {
            Response.Redirect("giris.aspx");
        }
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Session.Abandon();
        Response.Redirect("giris.aspx");
    }
}