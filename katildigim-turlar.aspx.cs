using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class katildigimturlar : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uyeId"] == null)
        {
            Response.Redirect("~/giris-yap");
        }
        else
        {
            int uID = int.Parse(Session["uyeId"].ToString());
            var turlar = (from odeme in db.tblOdeme
                          join tur in db.tblTur
                          on odeme.TurId equals tur.Id
                          join rehber in db.tblRehber
                          on odeme.tblTur.RehberId equals rehber.Id
                          join uye in db.tblUye
                          on odeme.UyeId equals uye.Id
                          select new
                          {
                              UyeId = odeme.UyeId,
                              Ad = tur.Ad,
                              Aciklama = tur.Aciklama,
                              Fiyat = tur.Fiyat,
                              BaslangicTarihi = tur.BaslangicTarihi,
                              BitisTarihi = tur.BitisTarihi,
                              Resim = tur.TurResim,
                              KategoriAdi = tur.tblKategori.KategoriAdi,
                              OdemeTarihi = odeme.OdemeTarihi,
                              TurSahibi = rehber.Ad + " " + rehber.Soyad
                          }).Where(x => x.UyeId == uID).ToList();
            RepeaterKatildigimTurlar.DataSource = turlar;
            RepeaterKatildigimTurlar.DataBind();
        }
    }
}