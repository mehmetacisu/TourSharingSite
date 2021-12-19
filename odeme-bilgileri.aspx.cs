using System;

public partial class odeme_bilgileri : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private string turID;
    private tblTur tur;
    private tblOdeme odeme = new tblOdeme();
    private tblTuraKatilanlar tk = new tblTuraKatilanlar();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uyeId"] == null)
        {
            Response.Redirect("~/giris-yap");
        }
        else
        {
            TurFiyatiniGetir();
        }
    }

    private void TurFiyatiniGetir()
    {
        turID = Request.QueryString["Tur"];
        if (turID == null)
        {
            Response.Redirect("");
        }
        else
        {
            tur = db.tblTur.Find(int.Parse(turID));
            TextBoxFiyat.Text = tur.Fiyat.ToString() + "₺";
        }
    }

    protected void buttonOde_Click(object sender, EventArgs e)
    {
        try
        {
            odeme.KartSahibi = TextBoxKartSahibi.Text;
            odeme.KartNo = TextBoxKartNo.Text;
            odeme.SKT = TextBoxSKT.Text;
            odeme.CVV = TextBoxCVV.Text;
            odeme.OdemeTarihi = DateTime.Now;
            odeme.Durum = "B";
            odeme.UyeId = int.Parse(Session["uyeId"].ToString());
            odeme.TurId = int.Parse(Request.QueryString["Tur"].ToString());
            db.tblOdeme.Add(odeme);
            tk.UyeId = int.Parse(Session["uyeId"].ToString());
            tk.TurId = int.Parse(Request.QueryString["Tur"].ToString());
            tk.RehberId = odeme.tblTur.tblRehber.Id;
            db.tblTuraKatilanlar.Add(tk);
            tk.Fiyat = tur.Fiyat;
            db.SaveChanges();
            labelMessage.ForeColor = System.Drawing.Color.Green;
            labelMessage.Text = "Ödeme Başarılı !";
            Response.AddHeader("REFRESH", "3;URL=katildigim-turlar.aspx");
        }
        catch (Exception hata)
        {
            labelMessage.Text = "Hata oluştu : " + hata.Message;
        }
    }
}