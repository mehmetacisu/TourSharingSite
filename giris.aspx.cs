using System;
using System.Drawing;
using System.Linq;

public partial class giris : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void buttonGiris_Click(object sender, EventArgs e)
    {
        var uye = db.tblUye.FirstOrDefault(u => u.KullaniciAdi == TextBoxMailKadi.Text && u.Sifre == TextBoxSifre.Text || u.Mail == TextBoxMailKadi.Text && u.Sifre == TextBoxSifre.Text);
        try
        {
            if (uye != null)
            {
                labelMessage.ForeColor = Color.Green;
                Session["uyeId"] = uye.Id;
                Session["uyeKadi"] = uye.KullaniciAdi;
                labelMessage.Text = "Giriş başarılı";
                Response.AddHeader("REFRESH", "3;URL=/");
            }
            else
            {
                labelMessage.ForeColor = Color.Red;
                labelMessage.Text = "Kullanıcı adı veya şifre hatalı";
            }
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = Color.Red;
            labelMessage.Text = "Hata oluştu : " + hata.Message;
        }
    }
}