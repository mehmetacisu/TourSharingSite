using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class turislemleri : System.Web.UI.Page
{
    //Database ulaşmak için db adında nesne türetildi.
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Sayfa yüklenirken TurlariGetir fonksiyonu çağırıldı.
        TurlariGetir();
    }

    private void TurlariGetir()
    {
        //Repeater Turlar için sql sorgusunu linq sorgusu olarak yazıp, data kaynağı olarak gösterildi.
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
                          Durumu = tur.Durumu == "A" ? "Aktif" : tur.Durumu == "P" ? "Pasif" : "Onay Bekliyor", // A ise Aktif ,  P ise Pasif , ikisi de değil ise Onay bekliyor.
                          KategoriAdi = kategori.KategoriAdi,
                          TurSahibi = rehber.Ad + " " + rehber.Soyad
                      }).OrderByDescending(x => x.BitisTarihi).ToList();
        RepeaterTurlar.DataSource = turlar;
        RepeaterTurlar.DataBind();
        /*
           Sql sorgusu halinde ki şekli
           select  t.Id,t.Ad,t.Aciklama,t.TurTarih,t.Fiyat,t.RehberId,t.TurResim,t.Durumu,tblKategori.KategoriAdi,tblRehber.Ad +' '+tblRehber.Soyad as 'TurSahibi'
           from((tblTur t INNER JOIN tblKategori ON t.KategoriId = tblKategori.Id) INNER JOIN tblRehber ON t.RehberId = tblRehber.Id) where tblKategori.Durumu = 'A'  and tblRehber.Durumu = 'A'
        */
    }
}