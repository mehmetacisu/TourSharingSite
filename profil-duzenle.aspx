<%@ Page Title="" Language="C#" MasterPageFile="~/UyeMasterPage.master" AutoEventWireup="true" CodeFile="profil-duzenle.aspx.cs" Inherits="profilduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container col-sm-6 h-100">
        <div class="row d-flex justify-content-center align-items-center text-center">
            <div>
                <h3 class="mt-4 mb-4">Üyelik Bilgileriniz</h3>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxAdi" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxAdi">Adınız</label>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxSoyadi" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxSoyadi">Soyadınız</label>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxSifre" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxSifre">Şifreniz</label>
            </div>

            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxMail" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxMail">Mail Adresiniz</label>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxKadi" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxKadi">Kullanıcı Adınız</label>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxTel" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxTel">Telefon Numaranız</label>
            </div>
            <div class="form-outline mb-4">
                <asp:TextBox ID="TextBoxUyelikTarihi" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="form-label" for="TextBoxUyelikTarihi">Üyelik Tarihiniz</label>
            </div>
            <div>
                <asp:Label ID="labelMessage" runat="server" CssClass="form-label"></asp:Label>
            </div>
            <div>
                <asp:Button ID="buttonGuncelle" runat="server" Text="Güncelle" CssClass="btn btn-info w-50 text-capitalize" OnClick="buttonGuncelle_Click" />
            </div>
        </div>
    </div>
    <hr />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
</asp:Content>