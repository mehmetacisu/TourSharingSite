using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sayfaislemleri3 : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            KategorileriGetir();
        }
    }

    private void KategorileriGetir()
    {
        try
        {
            RepeaterKategoriler.DataSource = db.tblKategori.AsNoTracking()
            .Select(s => new
            {
                Id = s.Id,
                KategoriAdi = s.KategoriAdi,
                KategoriAciklama = s.KategoriAciklama,
                Durumu = s.Durumu == "A" ? "Aktif" : "Pasif"
            }).ToList();
            RepeaterKategoriler.DataBind();
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Kategoriler Listelenemedi ! Hata : " + hata.Message;
        }
    }

    protected void buttonEkle_Click(object sender, EventArgs e)
    {
        try
        {
            tblKategori kategori = new tblKategori();
            kategori.KategoriAdi = TextBoxAdi.Text;
            kategori.KategoriAciklama = TextBoxAciklama.Text;
            if (DDLKategoriDurumu.SelectedValue.ToString() == "Aktif")
            {
                kategori.Durumu = "A";
            }
            else
            {
                kategori.Durumu = "P";
            }
            db.tblKategori.Add(kategori);
            db.SaveChanges();
            Response.Redirect("kategoriislemleri.aspx");
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Kategoriler Eklenemedi !  Hata : " + hata.Message;
        }
    }
}