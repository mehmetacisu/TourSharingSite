using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rehber_misafirlerim : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        BilgileriGetir();
    }

    private void BilgileriGetir()
    {
        if (Session["rehberId"] != null)
        {
            int rId = int.Parse(Session["rehberId"].ToString());
            var katilanlar = (from odeme in db.tblOdeme
                              join tur in db.tblTur
                              on odeme.TurId equals tur.Id
                              join uye in db.tblUye
                              on odeme.UyeId equals uye.Id
                              select new
                              {
                                  Ad = uye.Ad,
                                  Soyad = uye.Soyad,
                                  Mail = uye.Mail,
                                  Telefon = uye.Tel,
                                  KatilimTarihi = odeme.OdemeTarihi,
                                  TurAdi = tur.Ad,
                                  Durum = odeme.Durum,
                                  RehberID = tur.RehberId
                              }).Where(x => x.RehberID == rId && x.Durum == "B").ToList(); ;
            RepeaterMisafirlerim.DataSource = katilanlar;
            RepeaterMisafirlerim.DataBind();
            // Durum=="B" ödeme başarılı
            // Durum=="I" ödeme iptal
        }
        else
        {
            Response.Redirect("giris.aspx");
        }
    }

    protected void buttonPdf_Click(object sender, EventArgs e)
    {
        Response.ContentType = "Application/pdf";
        Response.AddHeader("Content-Disposition", "attachement; filename=misafirlerim.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        print.RenderControl(hw);
        Document doc = new Document(PageSize.A4, 50f, 50f, 100f, 30f);
        HTMLWorker htw = new HTMLWorker(doc);
        PdfWriter.GetInstance(doc, Response.OutputStream);
        doc.Open();
        StringReader sr = new StringReader(sw.ToString());
        htw.Parse(sr);
        doc.Close();
        Response.Write(doc);
        Response.End();
    }
}