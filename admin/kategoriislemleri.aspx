<%@ Page Title="Mehmet Tours - Kategori İşlemleri" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="kategoriislemleri.aspx.cs" Inherits="sayfaislemleri3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                <asp:Button ID="buttonEkle" runat="server" Text="Kategori Ekle" CssClass="btn btn-info mt-2" OnClick="buttonEkle_Click" />
                <asp:Label ID="labelMessage" runat="server"></asp:Label>
            </div>
        </div>
        <br />
        <div class="">
            <table class="table table-bordered">
                <tr>
                    <th colspan="6" class="text-center">Kategoriler
                    </th>
                </tr>
                <tr>
                    <td>ID</td>
                    <td>Adı</td>
                    <td>Açıklaması</td>
                    <td>Durumu</td>
                    <%--    <td>Güncelle</td>
                        <td>Sil</td>--%>
                    <td>İşlemler</td>
                </tr>
                <asp:Repeater ID="RepeaterKategoriler" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id") %></td>
                            <td><%# Eval("KategoriAdi") %></td>
                            <td><%# Eval("KategoriAciklama") %></td>
                            <td><%# Eval("Durumu") %></td>
                            <td>
                                <asp:HyperLink ID="HyperLinkGuncelle" runat="server" CssClass="btn btn-warning" NavigateUrl='<%# "KategoriGuncelle.aspx?Id="+ Eval("Id") %>'>Düzenle</asp:HyperLink>
                                <asp:HyperLink ID="HyperLinkSil" runat="server" CssClass="btn btn-danger" NavigateUrl='<%#"KategoriSil.aspx?Id=" +Eval("Id") %>'>Sil</asp:HyperLink>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>