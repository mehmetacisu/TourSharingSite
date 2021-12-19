using System;

public partial class admin_turyayinla : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var tur = db.tblTur.Find(id);
            tur.Durumu = "A";
            db.SaveChanges();
            Response.Redirect("TurIslemleri.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("TurIslemleri.aspx");
        }
    }
}