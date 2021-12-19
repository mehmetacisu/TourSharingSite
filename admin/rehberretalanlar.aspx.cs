using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RehberRetAlanlar : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
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
                             }).Where(x => x.Durumu == "P").ToList();
            RepeaterRehberler.DataSource = rehberler;
            RepeaterRehberler.DataBind();
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Veriler Getirilemedi ! Hata : " + hata.Message;
        }
    }
}