using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class admin_onaybekleyenturlar : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        TurlariGetir();
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
                          Id = tur.Id,
                          Ad = tur.Ad,
                          Aciklama = tur.Aciklama,
                          TurTarih = tur.BaslangicTarihi,
                          BitisTarihi = tur.BitisTarihi,
                          Fiyat = tur.Fiyat,
                          RehberId = tur.RehberId,
                          TurResim = tur.TurResim,
                          Durumu = tur.Durumu, // A ise Aktif ,  P ise Pasif , ikisi de değil ise Onay bekliyor.
                          KategoriAdi = kategori.KategoriAdi,
                          TurSahibi = rehber.Ad + " " + rehber.Soyad
                      }).Where(x => x.Durumu == "O").ToList();
        RepeaterTurlar.DataSource = turlar;
        RepeaterTurlar.DataBind();
    }

    protected void RepeaterTurlar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "onayla")
        {
            int id = int.Parse(e.CommandArgument.ToString());
            var tur = db.tblTur.Find(id);
            tur.Durumu = "A";
            db.SaveChanges();
            RepeaterTurlar.DataBind();
            Response.Redirect("turislemleri.aspx");
        }
    }
}