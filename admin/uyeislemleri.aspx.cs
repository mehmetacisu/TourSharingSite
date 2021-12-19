using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class UyeIslemleri : System.Web.UI.Page
{
    //YonCalDbEntities db = new YonCalDbEntities();
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        UyeleriGetir();
    }

    private void UyeleriGetir()
    {
        RepeaterUyeler.DataSource = db.tblUye.Where(x => x.Durumu == "A").ToList();
        RepeaterUyeler.DataBind();
    }

    protected void buttonYasakliUyeler_Click(object sender, EventArgs e)
    {
        Response.Redirect("YasakliUyeler.aspx");
    }
}