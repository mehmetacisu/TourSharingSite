using System;
using System.Web.Security;

public partial class UyeMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uyeId"] != null)
        {
            navNormal.Visible = false;
            navLogon.Visible = true;
            uyeKadi.Text = "Hoşgeldiniz : " + Session["uyeKadi"].ToString();
        }
        else
        {
            navNormal.Visible = true;
            navLogon.Visible = false;
        }
    }

    protected void cikisYap_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Session.Abandon();
        Response.Redirect("");
    }
}