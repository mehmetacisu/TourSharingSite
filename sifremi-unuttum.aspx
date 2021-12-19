<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sifremi-unuttum.aspx.cs" Inherits="sifremi_unuttum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="logo.svg" />
    <title>Mehmet Tours - Şifremi Unuttum</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container h-100 col-sm-6 col-sm-3 ">
            <div class="row  d-flex justify-content-center align-items-center h-100 text-center" style="margin-top: 20%;">
                <div class="form-check mb-4">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/logo.svg" Height="150" Width="150" />
                </div>
                <asp:Label ID="Label1" runat="server" Text="Mehmet Tours Şifremi Unuttum" Font-Bold="true" Font-Size="Large" CssClass="text-primary mb-4"></asp:Label>
                <div class="form-outline mb-4">
                    <asp:TextBox ID="TextBoxMail" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    <label class="form-label" for="TextBoxMail">E-Posta Adresinizi Giriniz</label>
                </div>
                <div>
                    <asp:Label ID="labelMessage" runat="server" CssClass="form-check-label"></asp:Label>
                </div>
                <asp:Button ID="buttonGonder" runat="server" CssClass="btn btn-primary btn-block mb-4" Text="Gönder" OnClick="buttonGonder_Click" />
            </div>
        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
    </form>
</body>
</html>