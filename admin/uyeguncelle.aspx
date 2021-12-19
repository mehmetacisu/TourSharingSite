<%@ Page Title="Mehmet Tours - Üye Güncelle" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="uyeguncelle.aspx.cs" Inherits="UyeGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <label for="TextBoxAd">Ad</label>
        <asp:TextBox runat="server" ID="TextBoxAd" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxSoyad">Soyad</label>
        <asp:TextBox runat="server" ID="TextBoxSoyad" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxMail">Mail</label>
        <asp:TextBox runat="server" ID="TextBoxMail" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxTel">Telefon</label>
        <asp:TextBox runat="server" ID="TextBoxTel" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxKullaniciAdi">Kullanıcı Adı</label>
        <asp:TextBox runat="server" ID="TextBoxKullaniciAdi" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxUyelikTarihi">Üyelik Tarihi</label>
        <asp:TextBox runat="server" ID="TextBoxUyelikTarihi" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <label for="TextBoxDurumu">Durumu</label>
        <asp:TextBox runat="server" ID="TextBoxDurumu" CssClass="form-control" required="true"></asp:TextBox>
        <br />
        <asp:Button runat="server" ID="buttonGuncelle" Text="Güncelle" CssClass="btn btn-warning" OnClick="buttonGuncelle_Click" />
    </div>
</asp:Content>