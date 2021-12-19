using System;

public partial class TurSil : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var tur = db.tblTur.Find(id);
            tur.Durumu = "P";
            db.SaveChanges();
            Response.Redirect("TurIslemleri.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("TurIslemleri.aspx");
        }
    }
}