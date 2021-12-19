using System;
using System.Linq;

public partial class _Default : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        DegerleriGetir();
    }

    private void DegerleriGetir()
    {
        try
        {
            int turSay = db.tblTur.Count();
            turSayisi.Text = turSay.ToString();

            int rehberSay = db.tblRehber.Count();
            rehberSayisi.Text = rehberSay.ToString();

            int uyeSay = db.tblUye.Count();
            uyeSayisi.Text = uyeSay.ToString();

            int turaKatilanlar = db.tblTuraKatilanlar.Count();
            satilanTurSayisi.Text = turaKatilanlar.ToString();
        }
        catch (Exception)
        {
            Response.Redirect("asda");
        }
    }
}