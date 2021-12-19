using System;
using System.Web.UI;

public partial class UyeGuncelle : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                var uye = db.tblUye.Find(id);
                TextBoxAd.Text = uye.Ad;
                TextBoxSoyad.Text = uye.Soyad;
                TextBoxMail.Text = uye.Mail;
                TextBoxTel.Text = uye.Tel;
                TextBoxKullaniciAdi.Text = uye.KullaniciAdi;
                TextBoxUyelikTarihi.Text = uye.UyelikTarihi.ToString();
                TextBoxDurumu.Text = uye.Durumu == "A" ? "Aktif" : "Pasif";
                TextBoxDurumu.Enabled = false;
                TextBoxUyelikTarihi.Enabled = false;
            }
        }
        catch (Exception hata)
        {
            Response.Redirect("uyeislemleri.aspx");
        }
    }

    protected void buttonGuncelle_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["Id"]);
        var uye = db.tblUye.Find(id);
        uye.Ad = TextBoxAd.Text;
        uye.Soyad = TextBoxSoyad.Text;
        uye.Mail = TextBoxMail.Text;
        uye.Tel = TextBoxTel.Text;
        uye.KullaniciAdi = TextBoxKullaniciAdi.Text;
        db.SaveChanges();
        Response.Redirect("uyeislemleri.aspx");
    }
}