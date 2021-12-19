using System;

public partial class UyeSil : System.Web.UI.Page
{
    //  YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var uye = db.tblUye.Find(id);
            uye.Durumu = "P";
            db.SaveChanges();
            Response.Redirect("uyeislemleri.aspx");
        }
        catch (Exception hata)
        {
            Response.Redirect("uyeislemleri.aspx");
        }
    }
}