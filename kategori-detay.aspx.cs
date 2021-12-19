using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class kategori_detay : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["kt"];
        if (id == null)
        {
            Response.Redirect("");
        }
        TurlariGetir();
        KategorileriGetir();
    }

    private void TurlariGetir()
    {
        try
        {
            string id = Request.QueryString["kt"];
            int kId = int.Parse(id);
            var turlar = (from tur in db.tblTur
                          join rehber in db.tblRehber
                          on tur.RehberId equals rehber.Id
                          join kategori in db.tblKategori
                          on tur.KategoriId equals kategori.Id
                          select new
                          {
                              Tur = tur.Id,
                              RehberId = rehber.Id,
                              turAdi = tur.Ad,
                              Aciklama = tur.Aciklama,
                              Fiyat = tur.Fiyat,
                              Durumu = tur.Durumu,
                              BaslangicTarihi = tur.BaslangicTarihi,
                              BitisTarihi = tur.BitisTarihi,
                              Resim = tur.TurResim,
                              KategoriAdi = kategori.KategoriAdi,
                              KategoriId = kategori.Id,
                              TurSahibi = rehber.Ad + " " + rehber.Soyad,
                              KategoriDurumu = kategori.Durumu,
                              RehberDurumu = rehber.Durumu
                          }).Where(x => x.KategoriId == kId).ToList();
            Repeater_Turlar.DataSource = turlar;
            Repeater_Turlar.DataBind();
        }
        catch (Exception hata)
        {
            Response.Redirect("");
        }
    }

    private void KategorileriGetir()
    {
        var kategoriler = db.tblKategori.Where(x => x.Durumu == "A").ToList();
        Repeater_Kategoriler.DataSource = kategoriler;
        Repeater_Kategoriler.DataBind();
    }
}