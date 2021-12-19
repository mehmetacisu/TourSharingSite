<%@ Page Language="C#" AutoEventWireup="true" CodeFile="giris.aspx.cs" Inherits="admingiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mehmet Tours - Admin Panel Giriş</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="giris.css" />
</head>
<body>
    <form id="form1" runat="server" method="post">
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-center">
                                            <img src="../logo.svg" style="width: 185px;" alt="logo" />
                                            <h4 class="mt-1 mb-5 pb-1" style="color: #098DAF;">Mehmet Tours</h4>
                                        </div>
                                        <p>Giriş yapınız</p>
                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="TextBoxKadiOrEmail" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                            <label class="form-label" for="TextBoxKadiOrEmail">E-Posta Adresi veya Kullanıcı Adı</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <asp:TextBox ID="TextBoxSifre" runat="server" CssClass="form-control" TextMode="Password" required="true"></asp:TextBox>
                                            <label class="form-label" for="TextBoxSifre">Şifre</label>
                                        </div>
                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <asp:Button ID="buttonGirisYap" runat="server" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" OnClick="buttonGirisYap_Click" Text="Giriş Yap"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <asp:Label ID="labelMessage" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
    </form>
</body>
</html>