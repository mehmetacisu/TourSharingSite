using System;

public partial class KategoriSil : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var kategori = db.tblKategori.Find(id);
            kategori.Durumu = "P";
            db.SaveChanges();
            Response.Redirect("kategoriislemleri.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("kategoriislemleri.aspx");
        }
    }
}