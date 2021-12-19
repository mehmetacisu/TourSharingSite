using System;

public partial class profilduzenle : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBoxUyelikTarihi.Enabled = false;
        TextBoxUyelikTarihi.ReadOnly = true;
        if (!IsPostBack)
        {
            try
            {
                if (Session["uyeId"] == null)
                {
                    Response.Redirect("/giris-yap");
                }
                else
                {
                    int id = int.Parse(Session["uyeId"].ToString());
                    var uye = db.tblUye.Find(id);
                    TextBoxAdi.Text = uye.Ad;
                    TextBoxSoyadi.Text = uye.Soyad;
                    TextBoxSifre.Text = uye.Sifre;
                    TextBoxMail.Text = uye.Mail;
                    TextBoxKadi.Text = uye.KullaniciAdi;
                    TextBoxTel.Text = uye.Tel;
                    TextBoxUyelikTarihi.Text = uye.UyelikTarihi.ToString();
                }
            }
            catch (Exception)
            {
                Response.Redirect("giris.aspx");
            }
        }
    }

    protected void buttonGuncelle_Click(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Session["uyeId"].ToString());
            var uye = db.tblUye.Find(id);
            uye.Ad = TextBoxAdi.Text;
            uye.Soyad = TextBoxSoyadi.Text;
            uye.Sifre = TextBoxSifre.Text;
            uye.Mail = TextBoxMail.Text;
            uye.KullaniciAdi = TextBoxKadi.Text;
            uye.Tel = TextBoxTel.Text;
            uye.UyelikTarihi = DateTime.Parse(TextBoxUyelikTarihi.Text.ToString());
            db.SaveChanges();
            labelMessage.Text = "Bilgileriniz Güncellendi.";
            Response.AddHeader("REFRESH", "3;URL=/profilimi-duzenle");
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Bilgiler güncellenirken hata : " + hata.Message;
        }
    }
}