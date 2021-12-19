using System;
using System.Web.Security;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        KullaniciAdiniGetir();
    }

    private void KullaniciAdiniGetir()
    {
        if (Session["adminKAdi"] != null)
        {
            AdSoyad.Text = Session["Kullanici"].ToString();
            kullaniciAdi.InnerText = Session["adminKAdi"].ToString();
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