using System;
using System.Linq;
using System.Net.Mail;

public partial class sifremi_unuttum : System.Web.UI.Page
{
    private TurPaylasimEntities db = new TurPaylasimEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void buttonGonder_Click(object sender, EventArgs e)
    {
        var kullanici = db.tblUye.Where(u => u.Mail == TextBoxMail.Text).FirstOrDefault();
        var rehber = db.tblRehber.Where(r => r.Mail == TextBoxMail.Text).FirstOrDefault();
        var admin = db.tblAdmin.Where(a => a.Mail == TextBoxMail.Text).FirstOrDefault();
        if (kullanici != null)
        {
            MailGonder(TextBoxMail.Text,
                       "Sayın Kullanıcımız: " + kullanici.Ad
                       + " "
                       + kullanici.Soyad + " "
                       + "<p>Şifreniz : " + kullanici.Sifre);
            labelMessage.ForeColor = System.Drawing.Color.Green;
            labelMessage.Text = "Şifreniz mail olarak gönderilmiştir.";
            Response.AddHeader("REFRESH", "3;URL=/giris-yap.aspx");
        }
        else if (rehber != null)
        {
            MailGonder(TextBoxMail.Text,
                "Sayın İş Ortağımız: " + rehber.Ad
                + " "
                + rehber.Soyad + " "
                + "<p>Şifreniz : " + rehber.Sifre);
            labelMessage.ForeColor = System.Drawing.Color.Green;
            labelMessage.Text = "Şifreniz mail olarak gönderilmiştir.";
            Response.AddHeader("REFRESH", "3;URL=/../rehber/giris-yap");
        }
        else if (admin != null)
        {
            MailGonder(TextBoxMail.Text,
                "Değerli Yöneticimiz : " + admin.Ad
                + " "
                + admin.Soyad + " "
                + "<p>Şifreniz : " + admin.Sifre);

            labelMessage.ForeColor = System.Drawing.Color.Green;
            labelMessage.Text = "Şifreniz mail olarak gönderilmiştir.";
            Response.AddHeader("REFRESH", "3;URL=/../admin/giris");
        }
        else
        {
            labelMessage.Text = "Kullanıcı bulunamadı.";
        }
    }

    public void MailGonder(string user, string icerik)
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(user);
        mail.From = new MailAddress("toursmehmet@gmail.com", "Mehmet Tours");
        mail.Subject = "Mehmet Tours";
        mail.Body = icerik;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential(System.Web.Configuration.WebConfigurationManager.AppSettings["Email"], System.Web.Configuration.WebConfigurationManager.AppSettings["Parola"]);
        smtp.Send(mail);
    }
}