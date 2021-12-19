using System;
using System.Linq;

public partial class rehbergiris : System.Web.UI.Page
{
    //  YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void buttonGiris_Click(object sender, EventArgs e)
    {
        var rehber = db.tblRehber.Where(r => r.KullaniciAdi == TextBoxMailKadi.Text && r.Sifre == TextBoxSifre.Text || r.Mail == TextBoxMailKadi.Text && r.Sifre == TextBoxSifre.Text).FirstOrDefault();
        if (rehber != null && rehber.Durumu == "O")
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Üyeliğiniz onay beklemektedir.";
        }
        else
        {
            if (rehber != null && rehber.Durumu == "A")
            {
                Session.Add("rehberId", rehber.Id);
                Session.Add("rehberKadi", rehber.KullaniciAdi);
                Session.Add("rehberAdSoyad", rehber.Ad + " " + rehber.Soyad);
                labelMessage.ForeColor = System.Drawing.Color.Green;
                labelMessage.Text = "Giriş Başarılı";
                Response.AddHeader("REFRESH", "3;URL=index.aspx");
            }
            else
            {
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Kullanıcı bilgileri hatalı.";
            }
        }
    }
}