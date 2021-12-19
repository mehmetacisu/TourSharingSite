using System;
using System.Linq;

public partial class admingiris : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void buttonGirisYap_Click(object sender, EventArgs e)
    {
        var admin = db.tblAdmin.Where(x => (x.KullaniciAdi == TextBoxKadiOrEmail.Text || x.Mail == TextBoxKadiOrEmail.Text) && x.Sifre == TextBoxSifre.Text).FirstOrDefault();
        try
        {
            if (admin != null)
            {
                Session.Add("adminKAdi", TextBoxKadiOrEmail.Text);
                Session.Add("Kullanici", admin.Ad + " " + admin.Soyad);
                Response.Redirect("index.aspx");
            }
            else
            {
                labelMessage.Text = "Hatalı giriş";
            }
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Hata oluştu : " + hata.Message;
        }
    }
}