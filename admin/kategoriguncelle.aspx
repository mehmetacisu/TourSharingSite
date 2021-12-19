<%@ Page Title="Mehmet Tours - Kategori Güncelle" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="kategoriguncelle.aspx.cs" Inherits="KategoriGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <asp:Label ID="Label1" runat="server" Text="Kategori Adı"></asp:Label>
                    <asp:TextBox ID="TextBoxAdi" runat="server" CssClass="form-control" MaxLength="50" required="true"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="LabelAciklama" runat="server" Text="Kategori Açıklaması"></asp:Label>
                    <asp:TextBox ID="TextBoxAciklama" runat="server" CssClass="form-control" MaxLength="500" required="true"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="LabelDurumu" runat="server" Text="Kategori Durumu"></asp:Label>
                    <asp:DropDownList runat="server" ID="DDLKategoriDurumu" CssClass="form-select" required="true">
                        <asp:ListItem Value="Aktif" Text="Aktif"></asp:ListItem>
                        <asp:ListItem Value="Pasif" Text="Pasif"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Button ID="buttonGuncelle" runat="server" Text="Güncelle" CssClass="btn btn-success mt-2" OnClick="buttonGuncelle_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>