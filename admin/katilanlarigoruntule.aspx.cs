using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class admin_katilanlarigoruntule : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private tblTuraKatilanlar turaKatilanlar = new tblTuraKatilanlar();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var turBul = db.tblTur.Find(id);
            //var degerler = (from x in db.tblTur
            //                select new
            //                {
            //                    Id = x.Id,
            //                    TurAdi = x.Ad,
            //                    TurSahibi = x.tblRehber.Ad + " " + x.tblRehber.Soyad,
            //                    TurBaslangicTarihi = x.BaslangicTarihi,
            //                    UyeBilgisi = turaKatilanlar.tblUye.Ad + " " + turaKatilanlar.tblUye.Soyad,
            //                    UyeKadi = turaKatilanlar.tblUye.KullaniciAdi,
            //                }).ToList();
            //RepeaterKatilanlariGor.DataSource = degerler;
            //RepeaterKatilanlariGor.DataBind();

            int sayi = db.tblTuraKatilanlar.Where(x => x.TurId == id).Count();
            var katilanlar = (from turaKatilanlar in db.tblTuraKatilanlar
                              join uye in db.tblUye
                              on turaKatilanlar.UyeId equals uye.Id
                              join tur in db.tblTur
                              on turaKatilanlar.TurId equals tur.Id
                              join rehber in db.tblRehber
                              on tur.RehberId equals rehber.Id
                              select new
                              {
                                  Id = turaKatilanlar.TurId,
                                  TurAdi = tur.Ad,
                                  TurSahibi = rehber.Ad + " " + rehber.Soyad,
                                  TurBaslangicTarihi = tur.BaslangicTarihi,
                                  UyeBilgisi = uye.Ad + " " + uye.Soyad,
                                  UyeKadi = uye.KullaniciAdi,
                              }).Where(x => x.Id == id).ToList();
            RepeaterKatilanlariGor.DataSource = katilanlar;
            RepeaterKatilanlariGor.DataBind();
            katilanSayisi.Text = "Toplam Tura Katılan Üye Sayısı : " + sayi.ToString();
        }
        catch (Exception hata)
        {
            Response.Redirect("turislemleri.aspx");
        }
    }
}