using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class rehber_tur_paylas : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
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
                labelMessage.Text = "Kategoriler getirilemedi : " + hata.Message;
            }
        }
    }

    protected void buttonPaylas_Click(object sender, EventArgs e)
    {
        try
        {
            tblTur tur = new tblTur();
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
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Tur resimi yüklenirken hata : " + hata.Message;
            }
            tur.Ad = TextBoxAdi.Text;
            tur.Aciklama = TextBoxAciklama.Text;
            tur.BaslangicTarihi = DateTime.Parse(baslangic.Value);
            if (DateTime.Parse(baslangic.Value) <= DateTime.Now)
            {
                labelMessage.ForeColor = System.Drawing.Color.Red;
                labelMessage.Text = "Tur Başlangıç tarihi ileri tarihte olmalıdır.";
            }
            else
            {
                if (DateTime.Parse(bitis.Value) < DateTime.Parse(baslangic.Value))
                {
                    labelMessage.ForeColor = System.Drawing.Color.Red;
                    labelMessage.Text = "Bitiş tarihi başlangıç tarihinden ileri tarihte olmalıdır.";
                }
                else
                {
                    tur.BitisTarihi = DateTime.Parse(bitis.Value);
                    tur.Fiyat = decimal.Parse(TextBoxFiyat.Text);
                    tur.Durumu = "O";
                    tur.OlusturulmaTarihi = DateTime.Now;
                    tur.KategoriId = int.Parse(ddl_kategori.SelectedValue);
                    tur.TurResim = @"..\..\TurResim\" + filename;
                    tur.RehberId = int.Parse(Session["rehberId"].ToString());
                    db.tblTur.Add(tur);
                    db.SaveChanges();
                    labelMessage.ForeColor = System.Drawing.Color.Green;
                    labelMessage.Text = "Tur başarıyla oluşturuldu,onay sonrası yayınlanacaktır.";
                    Response.AddHeader("REFRESH", "3;URL=turlarimi-goruntule.aspx");
                }
            }
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Tur paylaşılırken hata oluştu : " + hata.Message;
        }
    }
}