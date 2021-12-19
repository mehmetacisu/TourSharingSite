using System;
using System.Linq;

public partial class rehberindex : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private int toplamTur;
    private int rehberId;
    private int toplamMisafir;
    private int toplamKazanc = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        DegerleriGetir();
    }

    private void DegerleriGetir()
    {
        if (Session["rehberId"] == null)
        {
            Response.Redirect("giris.aspx");
        }
        else
        {
            rehberId = int.Parse(Session["rehberId"].ToString());
            toplamTur = db.tblTur.Where(x => x.RehberId == rehberId).Count();
            toplamMisafir = db.tblTuraKatilanlar.Where(x => x.RehberId == rehberId).Count();
            toplamKazanc = (int)db.tblTuraKatilanlar.Where(y => y.RehberId == rehberId).Sum(x => x.Fiyat).GetValueOrDefault();
            labelToplamKazanc.Text = "Toplam Kazancınız " + toplamKazanc.ToString() + " " + "₺";

            labelToplamTurSayisi.Text = "Toplam Tur Sayınız : " + toplamTur.ToString();
            labelMisafirSayisi.Text = "Toplam Misafir Sayınız : " + toplamMisafir.ToString();

            //turFiyati = (decimal)db.tblTur.Where(y => y.RehberId == rehberId).Select(x => x.Fiyat).Sum();
            //katilanSayi = (from tk in db.tblTuraKatilanlar
            //               join tur in db.tblTur
            //               on tk.TurId equals tur.Id
            //               join rehber in db.tblRehber
            //               on tur.RehberId equals rehber.Id
            //               select new
            //               {
            //                   RehberID = rehber.Id
            //               }).Where(x => x.RehberID == rehberId).Count();
            //toplamKazanc = katilanSayi * (int)turFiyati;
            //labelTolamKazanc.Text = toplamKazanc.ToString();
            /*
             Toplam Kazanç SQL Sorgusu

                declare @turFiyati int
                select @turFiyati =  sum(Fiyat)  from tblTur
                where RehberId = 1
                select @turFiyati

                declare @katilanSayi int
                select @katilanSayi  = COUNT(*)
                from tblTuraKatilanlar tk
                inner join tblTur t
                on tk.TurId = t.Id
                inner join tblRehber r
                on t.RehberId = r.Id
                where r.Id = 1
                select @katilanSayi

                declare @ucret int
                select @ucret  = @katilanSayi * @turFiyati

                select @ucret
             */
        }
    }
}