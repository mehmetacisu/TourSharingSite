using System;
using System.Linq;

public partial class kayitol : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private int kAdiKontrol(string kAdi)
    {
        int sonuc = db.tblUye.Where(x => x.KullaniciAdi == TextBoxKadi.Text).Count();
        return sonuc;
    }

    private int telKontrol(string tel)
    {
        int sonuc = db.tblUye.Where(x => x.Tel == TextBoxTel.Text).Count();
        return sonuc;
    }

    private int mailKontrol(string mail)
    {
        int sonuc = db.tblUye.Where(x => x.Mail == TextBoxMail.Text).Count();
        return sonuc;
    }

    protected void buttonUyeOl_Click(object sender, EventArgs e)
    {
        try
        {
            if (kAdiKontrol(TextBoxKadi.Text) != 0)
            {
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Kullanıcı adı sistemimizde kayıtlıdır.";
            }
            else if (mailKontrol(TextBoxMail.Text) != 0)
            {
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Mail adresi sistemimizde kayıtlıdır.";
            }
            else if (telKontrol(TextBoxTel.Text) != 0)
            {
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Telefon numarası sistemimizde kayıtlıdır.";
            }
            else
            {
                tblUye uye = new tblUye();
                uye.Ad = TextBoxAdi.Text;
                uye.Soyad = TextBoxSoyadi.Text;
                uye.Sifre = TextBoxSifre.Text;
                uye.KullaniciAdi = TextBoxKadi.Text;
                uye.Mail = TextBoxMail.Text;
                uye.Tel = TextBoxTel.Text;
                uye.Durumu = "A";
                uye.UyelikTarihi = DateTime.Now;
                db.tblUye.Add(uye);
                db.SaveChanges();
                labelMessage.ForeColor = System.Drawing.Color.Green;
                labelMessage.Text = "Kayıt Tamamlandı, giriş yapabilirsiniz.";
                Response.AddHeader("REFRESH", "3;URL=/giris-yap");
            }
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Hata oluştu : " + hata.Message;
        }
    }
}