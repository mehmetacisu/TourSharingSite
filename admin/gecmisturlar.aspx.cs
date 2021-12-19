using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class GecmisTurlar : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
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
                              BitisTarihi = tur.BitisTarihi,
                              Fiyat = tur.Fiyat,
                              RehberId = tur.RehberId,
                              TurResim = tur.TurResim,
                              Durumu = tur.Durumu,
                              KategoriAdi = kategori.KategoriAdi,
                              TurSahibi = rehber.Ad + " " + rehber.Soyad
                          }).Where(x => x.Durumu == "P").ToList();
            RepeaterGecmisTurlar.DataSource = turlar;
            RepeaterGecmisTurlar.DataBind();
        }
        catch (Exception hata)
        {
            Response.Redirect("index.aspx");
        }
    }
}