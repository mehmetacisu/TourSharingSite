using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RehberSertifikalar : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        SertifikalariGetir();
    }

    private void SertifikalariGetir()
    {
        try
        {
            var rehberler = (from rehber in db.tblRehber
                             select new
                             {
                                 rehber.Id,
                                 rehber.KullaniciAdi,
                                 rehber.SertifikaYolu
                             }).ToList();
            Repeater_Sertifikalar.DataSource = rehberler;
            Repeater_Sertifikalar.DataBind();
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Veriler Getirilemedi ! Hata : " + hata.Message;
        }
    }
}