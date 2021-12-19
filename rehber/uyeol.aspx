<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uyeol.aspx.cs" Inherits="rehberuyeol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mehmet Tours - Rehber Üyelik</title>
    <link rel="icon" href="../logo.svg" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div class="container h-100 col-sm-6 col-sm-3 ">
            <div class="row d-flex justify-content-center align-items-center h-100 text-center" style="margin-top: 10%;">
                <div class="form-check mb-4">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/logo.svg" Height="150" Width="150" />
                </div>
                <asp:Label ID="Label1" runat="server" Text="Mehmet Tours Rehber Üyelik" Font-Bold="true" Font-Size="Large" CssClass="text-primary mb-4"></asp:Label>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxAdi" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxAdi">Adınız</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxSoyadi" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxSoyadi">Soyadınız</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxTC" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ErrorMessage="Lütfen TC Kimlik Numaranızı Doğru Girin" ForeColor="Red" ValidationExpression="^[0-9]{11}$" ControlToValidate="TextBoxTC"></asp:RegularExpressionValidator>
                    <label class="form-label" for="TextBoxTC">TC Kimlik Numaranız</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxSifre" runat="server" CssClass="form-control" TextMode="Password" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxSifre">Şifreniz</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxKadi" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxKadi">Kullanıcı Adınız</label>
                </div>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxMail" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxMail">Mail Adresiniz</label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxMail"
                        ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                        Display="Dynamic" ErrorMessage="Lütfen Doğru Mail Adresi Giriniz" />
                </div>
                <div class="form-outline mb-2">
                    <asp:TextBox ID="TextBoxTel" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Telefon numaranızı doğru giriniz" ForeColor="Red" ValidationExpression="^[0-9]{4}[0-9]{7}$" ControlToValidate="TextBoxTel"></asp:RegularExpressionValidator>
                    <label class="form-label" for="TextBoxTel">Telefon Numaranız</label>
                </div>
                <label class="form-label font-weight-bold" for="FileUploadSertifika">Sertifikanızı Seçiniz</label>
                <asp:FileUpload ID="FileUploadSertifika" runat="server" CssClass="form-control mb-2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Sertifikanızı Ekleyiniz" Display="Dynamic" ControlToValidate="FileUploadSertifika"></asp:RequiredFieldValidator>
                <div>
                    <asp:Label ID="labelMessage" runat="server" CssClass="form-check-label"></asp:Label>
                </div>
                <asp:Button ID="buttonUyeOl" runat="server" CssClass="btn btn-primary btn-block mb-4 text-capitalize" Text="Üye Ol" OnClick="buttonUyeOl_Click" />
            </div>
        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
    </form>
</body>
</html>