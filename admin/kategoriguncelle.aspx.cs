using System;
using System.Web.UI;

public partial class KategoriGuncelle : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                var kategori = db.tblKategori.Find(id);
                TextBoxAdi.Text = kategori.KategoriAdi;
                TextBoxAciklama.Text = kategori.KategoriAciklama;
                DDLKategoriDurumu.SelectedItem.Value = kategori.Durumu;
                if (DDLKategoriDurumu.SelectedItem.Value.ToString() == "A")
                {
                    DDLKategoriDurumu.Text = "Aktif";
                }
                else if (DDLKategoriDurumu.SelectedItem.Value.ToString() == "P")
                {
                    DDLKategoriDurumu.Text = "Pasif";
                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("kategoriislemleri.aspx");
        }
    }

    protected void buttonGuncelle_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["Id"]);
        var kategori = db.tblKategori.Find(id);
        try
        {
            kategori.KategoriAdi = TextBoxAdi.Text;
            kategori.KategoriAciklama = TextBoxAciklama.Text;
            if (DDLKategoriDurumu.SelectedItem.ToString() == "Aktif")
            {
                kategori.Durumu = "A";
            }
            else if (DDLKategoriDurumu.SelectedItem.ToString() == "Pasif")
            {
                kategori.Durumu = "P";
            }
            db.SaveChanges();
            Response.Redirect("kategoriislemleri.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("kategoriislemleri.aspx");
        }
    }
}