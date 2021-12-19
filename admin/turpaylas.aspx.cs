using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class admin_turpaylas : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private tblTur tur = new tblTur();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminKAdi"] == null)
        {
            Response.Redirect("giris.aspx");
        }
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

    protected void buttonPaylas_Click(object sender, EventArgs e)
    {
        try
        {
            string path = "";
            path = @"..\..\TurResim";
            Random rnd = new Random();
            string filename = Path.GetFileName(turResim.FileName);
            try
            {
                if (turResim.HasFile)
                {
                    path = Server.MapPath(@"/TurResim/");
                    if (File.Exists(path))
                    {
                        path += @"\";
                        if (!File.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }
                    }
                    else
                    {
                        path += @"\";
                        Directory.CreateDirectory(path);
                    }
                    filename = filename.Split('.')[0] + rnd.Next(99999) + ".jpg";
                    path = path + @"\" + filename;
                    turResim.PostedFile.SaveAs(path);
                }
            }
            catch (Exception hata)
            {
                txtMessage.ForeColor = System.Drawing.Color.Red;
                txtMessage.Text = "Tur resimi yüklenirken hata : " + hata.Message;
            }
            tur.Ad = TextBoxAdi.Text;
            tur.Aciklama = TextBoxAciklama.Text;
            tur.BaslangicTarihi = DateTime.Parse(baslangic.Value);
            if (DateTime.Parse(baslangic.Value) <= DateTime.Now)
            {
                txtMessage.Text = "Tur Başlangıç tarihi ileri tarihte olmalıdır.";
            }
            else
            {
                if (DateTime.Parse(bitis.Value) < DateTime.Parse(baslangic.Value))
                {
                    txtMessage.Text = "Bitiş tarihi başlangıç tarihinden ileri tarihte olmalıdır.";
                }
                else
                {
                    tur.BitisTarihi = DateTime.Parse(bitis.Value);
                    tur.Fiyat = decimal.Parse(TextBoxFiyat.Text);
                    tur.Durumu = "A";
                    tur.OlusturulmaTarihi = DateTime.Now;
                    tur.KategoriId = int.Parse(ddl_kategori.SelectedValue);
                    tur.TurResim = @"..\..\TurResim\" + filename;
                    tur.RehberId = 1;
                    db.tblTur.Add(tur);
                    db.SaveChanges();
                    txtMessage.Text = "Tur başarıyla paylaşıldı.";
                    Response.AddHeader("REFRESH", "3;URL=turislemleri.aspx");
                }
            }
        }
        catch (Exception hata)
        {
            txtMessage.ForeColor = System.Drawing.Color.Red;
            txtMessage.Text = "Tur paylaşılırken hata oluştu : " + hata.Message;
        }
    }
}