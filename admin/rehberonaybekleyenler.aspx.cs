using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RehberOnayBekleyenler : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        OnayBekleyenleriGetir();
    }

    private void OnayBekleyenleriGetir()
    {
        try
        {
            var onayBekleyenler = (from rehber in db.tblRehber
                                   select new
                                   {
                                       Id = rehber.Id,
                                       AdSoyad = rehber.Ad + " " + rehber.Soyad,
                                       KullaniciAdi = rehber.KullaniciAdi,
                                       UyelikTarihi = rehber.UyelikTarihi,
                                       SertifikaYolu = rehber.SertifikaYolu,
                                       Durumu = rehber.Durumu
                                   }).Where(x => x.Durumu == "O").ToList();
            OnayBekleyenRehberler.DataSource = onayBekleyenler;
            OnayBekleyenRehberler.DataBind();
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Veriler Getirilemedi ! Hata : " + hata.Message;
        }
    }
}