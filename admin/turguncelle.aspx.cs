using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class admin_turguncelle : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        KullaniciAdiniGetir();
        if (!IsPostBack)
        {
            var kategoriler = db.tblKategori.Where(x => x.Durumu == "A").ToList();
            try
            {
                ddl_kategori.DataSource = kategoriler;
                ddl_kategori.DataValueField = "Id";
                ddl_kategori.DataTextField = "KategoriAdi";
                ddl_kategori.DataBind();
            }
            catch (Exception hata)
            {
                txtMessage.Text = "Kategoriler getirilemedi : " + hata.Message;
            }
        }
    }

    private void KullaniciAdiniGetir()
    {
        if (Session["adminKAdi"] == null)
        {
            Response.Redirect("giris.aspx");
        }
    }

    protected void buttonGuncelle_Click(object sender, EventArgs e)
    {
    }
}