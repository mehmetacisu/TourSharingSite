<%@ Page Title="Mehmet Tours - Üye İşlemleri" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="uyeislemleri.aspx.cs" Inherits="UyeIslemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <h3 style="text-align: center;">Aktif Üyeler</h3>
        <br />
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Telefon</th>
                <th>Kullanıcı Adı</th>
                <th>Üyelik Tarihi</th>
                <th>Durumu</th>
                <th>İşlemler</th>
            </tr>
            <asp:Repeater runat="server" ID="RepeaterUyeler">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Id") %></td>
                        <td><%# Eval("Ad") %></td>
                        <td><%# Eval("Soyad") %></td>
                        <td><%# Eval("Mail") %></td>
                        <td><%# Eval("Tel") %></td>
                        <td><%# Eval("KullaniciAdi") %></td>
                        <td><%# Eval("UyelikTarihi") %></td>
                        <td><%# Eval("Durumu") %></td>
                        <td>
                            <asp:HyperLink runat="server" ID="HyperLinkGuncelle" CssClass="btn btn-warning" NavigateUrl='<%# "UyeGuncelle.aspx?Id="+ Eval("Id") %>'>Güncelle</asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink" CssClass="btn btn-danger" NavigateUrl='<%# "UyeSil.aspx?Id="+ Eval("Id") %>'>Sil</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:Button runat="server" ID="buttonYasakliUyeler" CssClass="btn btn-dark" Text="Yasaklı Üyeler" OnClick="buttonYasakliUyeler_Click" />
    </div>
</asp:Content>