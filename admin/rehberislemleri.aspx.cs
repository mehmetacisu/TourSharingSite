using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RehberIslemleri : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        RehberleriGetir();
    }

    private void RehberleriGetir()
    {
        try
        {
            var rehberler = (from rehber in db.tblRehber
                             select new
                             {
                                 Id = rehber.Id,
                                 AdSoyad = rehber.Ad + " " + rehber.Soyad,
                                 Tc = rehber.TCKN,
                                 Tel = rehber.Telefon,
                                 KullaniciAdi = rehber.KullaniciAdi,
                                 Mail = rehber.Mail,
                                 Durumu = rehber.Durumu,
                                 UyelikTarihi = rehber.UyelikTarihi
                             }).Where(x => x.Durumu == "A").ToList();
            RepeaterRehberler.DataSource = rehberler;
            RepeaterRehberler.DataBind();
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Veriler yüklenemedi ! Hata : " + hata.Message;
        }
    }
}