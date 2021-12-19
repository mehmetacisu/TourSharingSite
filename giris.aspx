<%@ Page Language="C#" AutoEventWireup="true" CodeFile="giris.aspx.cs" Inherits="giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mehmet Tours - Giriş Yap</title>
    <link rel="icon" href="logo.svg" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post" action="giris.aspx">
        <div class="container h-100 col-sm-6 col-sm-3 ">
            <div class="row  d-flex justify-content-center align-items-center h-100 text-center" style="margin-top: 20%;">
                <div class="form-check mb-4">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/logo.svg" Height="150" Width="150" />
                </div>
                <asp:Label ID="Label1" runat="server" Text="Mehmet Tours Üye Girişi" Font-Bold="true" Font-Size="Large" CssClass="text-primary mb-4"></asp:Label>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxMailKadi" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxMailKadi">E-Posta Adresi veya Kullanıcı Adı</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxSifre" runat="server" CssClass="form-control" TextMode="Password" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxSifre">Şifre</label>
                </div>
                <div class="row mb-4 row col-sm-6">
                    <div class="col">
                        <a href="/sifremi-unuttum">Şifremi Unuttum?</a>
                    </div>
                    <div class="col">
                        <a href="/uye-ol">Üye değil misiniz ?</a>
                    </div>
                </div>
                <div>
                    <asp:Label ID="labelMessage" runat="server" CssClass="form-check-label"></asp:Label>
                </div>
                <asp:Button ID="buttonGiris" runat="server" CssClass="btn btn-primary btn-block mb-4" Text="Giriş Yap" OnClick="buttonGiris_Click" />
            </div>
        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
    </form>
</body>
</html>