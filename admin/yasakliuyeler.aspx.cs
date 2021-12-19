using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class YasakliUyeler : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        RepeaterYasakliUyeler.DataSource = db.tblUye.Where(x => x.Durumu == "P").ToList();
        RepeaterYasakliUyeler.DataBind();
    }
}