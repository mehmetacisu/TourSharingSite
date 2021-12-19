using System;
using System.IO;
using System.Linq;

public partial class rehberuyeol : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();
    private string path;
    private string dosyaAdi;
    private Random random = new Random();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public int mailKontrol(string mail)
    {
        int sonuc = db.tblRehber.Where(x => x.Mail == TextBoxMail.Text).Count();
        return sonuc;
    }

    public int telKontrol(string tel)
    {
        int sonuc = db.tblRehber.Where(x => x.Telefon == TextBoxTel.Text).Count();
        return sonuc;
    }

    public int tcKontrol(string tc)
    {
        int sonuc = db.tblRehber.Where(x => x.TCKN == TextBoxTC.Text).Count();
        return sonuc;
    }

    public int kAdiKontrol(string kAdi)
    {
        int sonuc = db.tblRehber.Where(x => x.KullaniciAdi == TextBoxKadi.Text).Count();
        return sonuc;
    }

    protected void buttonUyeOl_Click(object sender, EventArgs e)
    {
        try
        {
            path = @"..\..\Sertifikalar";
            dosyaAdi = Path.GetFileName(FileUploadSertifika.FileName);
            if (FileUploadSertifika.HasFile)
            {
                path = Server.MapPath(@"/Sertifikalar/");
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
                FileUploadSertifika.PostedFile.SaveAs(path);
                if (mailKontrol(TextBoxMail.Text) != 0)
                {
                    labelMessage.ForeColor = System.Drawing.Color.Red;
                    labelMessage.Text = "Mail adresi sistemimizde kayıtlıdır.";
                }
                else if (telKontrol(TextBoxTel.Text) != 0)
                {
                    labelMessage.ForeColor = System.Drawing.Color.Red;
                    labelMessage.Text = "Telefon numarası sistemimizde kayıtlıdır.";
                }
                else if (tcKontrol(TextBoxTC.Text) != 0)
                {
                    labelMessage.ForeColor = System.Drawing.Color.Red;
                    labelMessage.Text = "Kimlik numarası sistemimizde kayıtlıdır.";
                }
                else if (kAdiKontrol(TextBoxKadi.Text) != 0)
                {
                    labelMessage.ForeColor = System.Drawing.Color.Red;
                    labelMessage.Text = "Kullanıcı adı sistemimizde kayıtlıdır.";
                }
                else
                {
                    tblRehber rehber = new tblRehber();
                    rehber.Ad = TextBoxAdi.Text;
                    rehber.Soyad = TextBoxSoyadi.Text;
                    rehber.TCKN = TextBoxTC.Text;
                    rehber.Sifre = TextBoxSifre.Text;
                    rehber.KullaniciAdi = TextBoxKadi.Text;
                    rehber.Mail = TextBoxMail.Text;
                    rehber.Telefon = TextBoxTel.Text;
                    rehber.SertifikaYolu = @"..\..\Sertifikalar\" + dosyaAdi;
                    rehber.Durumu = "O";
                    rehber.UyelikTarihi = DateTime.Now;
                    db.tblRehber.Add(rehber);
                    db.SaveChanges();
                    labelMessage.ForeColor = System.Drawing.Color.Green;
                    labelMessage.Text = "Üyelik başarıyla tamamlandı,onaylandıktan sonra giriş yapabilirsiniz.";
                    Response.AddHeader("REFRESH", "3;URL=giris.aspx");
                }
            }
        }
        catch (Exception hata)
        {
            labelMessage.ForeColor = System.Drawing.Color.Red;
            labelMessage.Text = "Hata oluştu : " + hata.Message;
        }
    }
}