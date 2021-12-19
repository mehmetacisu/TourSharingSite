using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class admin_slider_islemleri : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private Random random = new Random();
    private int sira;

    protected void Page_Load(object sender, EventArgs e)
    {
        SlideriGetir();
    }

    private void SlideriGetir()
    {
        var sliders = (from s in db.tblSlider
                       select new
                       {
                           Id = s.Id,
                           DosyaAdi = s.DosyaAdi,
                           Fotograf = s.Fotograf,
                           SiraNo = s.SiraNo
                       }).ToList();
        RepeaterSlider.DataSource = sliders;
        RepeaterSlider.DataBind();
    }

    protected void buttonYukle_Click(object sender, EventArgs e)
    {
        try
        {
            string s = db.tblSlider.Max(x => x.SiraNo).ToString();
            sira = int.Parse(s);
            string path = @"..\..\Slider";
            string dosyaAdi = Path.GetFileName(FileUploadSlider.FileName);
            if (FileUploadSlider.HasFile)
            {
                path = Server.MapPath(@"/Slider/");
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
                dosyaAdi = dosyaAdi.Split('.')[0] + random.Next(99999) + ".jpg";
                path = path + @"\" + dosyaAdi;
                FileUploadSlider.PostedFile.SaveAs(path);
            }
            tblSlider slider = new tblSlider();
            slider.DosyaAdi = dosyaAdi;
            slider.Fotograf = @"..\..\Slider\" + dosyaAdi;
            slider.SiraNo = sira += 1;
            db.tblSlider.Add(slider);
            db.SaveChanges();
            SlideriGetir();
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Resim yüklenirken hata ! " + hata.Message;
        }
    }

    protected void RepeaterSlider_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            int id = int.Parse(e.CommandArgument.ToString());
            var slider = db.tblSlider.Find(id);
            db.tblSlider.Remove(slider);
            db.SaveChanges();
            RepeaterSlider.DataBind();
            SlideriGetir();
        }
    }
}