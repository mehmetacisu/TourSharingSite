using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class YayindakiTurlar : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private DateTime bugun = DateTime.Now;

    protected void Page_Load(object sender, EventArgs e)
    {
        YayindakiTurlariGetir();
    }

    private void YayindakiTurlariGetir()
    {
        var turlar = (from tur in db.tblTur
                      join rehber in db.tblRehber
                      on tur.RehberId equals rehber.Id
                      join kategori in db.tblKategori
                      on tur.KategoriId equals kategori.Id
                      select new
                      {
                          Id = tur.Id,
                          Ad = tur.Ad,
                          Aciklama = tur.Aciklama,
                          TurTarih = tur.BaslangicTarihi,
                          Fiyat = tur.Fiyat,
                          RehberId = tur.RehberId,
                          TurResim = tur.TurResim,
                          Durumu = tur.Durumu,
                          KategoriAdi = kategori.KategoriAdi,
                          TurSahibi = rehber.Ad + " " + rehber.Soyad
                      }).Where(x => x.TurTarih > bugun && x.Durumu == "A").ToList();
        RepeaterTurlar.DataSource = turlar;
        RepeaterTurlar.DataBind();
    }
}