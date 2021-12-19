using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class rehber_turlarimi_goruntule : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        TurlariGetir();
    }

    private void TurlariGetir()
    {
        if (Session["rehberId"] != null)
        {
            int rId = int.Parse(Session["rehberId"].ToString());
            var turlar = (from tur in db.tblTur
                          join rehber in db.tblRehber
                          on tur.RehberId equals rehber.Id
                          join kategori in db.tblKategori
                          on tur.KategoriId equals kategori.Id
                          select new
                          {
                              Id = tur.Id,
                              RehberId = rehber.Id,
                              Ad = tur.Ad,
                              Aciklama = tur.Aciklama,
                              Fiyat = tur.Fiyat,
                              Durumu = tur.Durumu == "A" ? "Yayında !" : tur.Durumu == "P" ? "Pasif" : "Onay Bekliyor",
                              BaslangicTarihi = tur.BaslangicTarihi,
                              BitisTarihi = tur.BitisTarihi,
                              Resim = tur.TurResim,
                              KategoriAdi = kategori.KategoriAdi,
                              TurSahibi = rehber.Ad + " " + rehber.Soyad,
                              KategoriDurumu = kategori.Durumu,
                              RehberDurumu = rehber.Durumu
                          }).Where(x => x.RehberId == rId).ToList();
            Repeater_Turlarim.DataSource = turlar;
            Repeater_Turlarim.DataBind();
        }
        else
        {
            Response.Redirect("giris.aspx");
        }
    }
}