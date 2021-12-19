using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SliderGetir();
        }
        TurlariGetir();
        KategorileriGetir();
    }

    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    private void SliderGetir()
    {
        var fotograflar = db.tblSlider.ToList();
        RepeaterSlider.DataSource = fotograflar;
        RepeaterSlider.DataBind();
    }

    private void KategorileriGetir()
    {
        var kategoriler = db.tblKategori.Where(x => x.Durumu == "A").ToList();
        Repeater_Kategoriler.DataSource = kategoriler;
        Repeater_Kategoriler.DataBind();
    }

    private void TurlariGetir()
    {
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
                          TurSahibi = rehber.Ad + " " + rehber.Soyad,
                          KategoriDurumu = kategori.Durumu,
                          RehberDurumu = rehber.Durumu
                      }).Where(x => x.Durumu == "A" && x.KategoriDurumu == "A" && x.RehberDurumu == "A").ToList();
        Repeater_Turlar.DataSource = turlar;
        Repeater_Turlar.DataBind();
    }
}