using System;

public partial class RehberOnayla : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(Request.QueryString["Id"]);
            var rehber = db.tblRehber.Find(id);
            rehber.Durumu = "A";
            db.SaveChanges();
            Response.Redirect("RehberIslemleri.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("RehberIslemleri.aspx");
        }
    }
}