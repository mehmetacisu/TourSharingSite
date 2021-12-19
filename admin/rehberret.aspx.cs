using System;

public partial class RehberRet : System.Web.UI.Page
{
    // YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["Id"]);
        var rehber = db.tblRehber.Find(id);
        rehber.Durumu = "R";
        db.SaveChanges();
        Response.Redirect("RehberIslemleri.aspx");
    }
}