<%@ Page Title="Mehmet Tours - Rehber İşlemleri" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="rehberislemleri.aspx.cs" Inherits="RehberIslemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <h3 class="text-center">Rehber Bilgileri </h3>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Ad Soyad</th>
                <th>TC</th>
                <th>Telefon</th>
                <th>Kullanıcı Adı</th>
                <th>Mail</th>
                <th>Üyelik Tarihi</th>
                <th>İşlemler</th>
            </tr>
            <asp:Repeater runat="server" ID="RepeaterRehberler">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Id") %></td>
                        <td><%# Eval("AdSoyad") %></td>
                        <td><%# Eval("Tc") %></td>
                        <td><%# Eval("Tel") %></td>
                        <td><%# Eval("KullaniciAdi") %></td>
                        <td><%# Eval("Mail") %></td>
                        <td><%# Eval("UyelikTarihi") %></td>
                        <td>
                            <asp:HyperLink runat="server" ID="HyperLinkGuncelle" CssClass="btn btn-warning" NavigateUrl='<%# "RehberGuncelle.aspx?Id="+ Eval("Id") %>'>Güncelle</asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink" CssClass="btn btn-danger" NavigateUrl='<%# "RehberSil.aspx?Id="+ Eval("Id") %>'>Sil</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:Label ID="labelMessage" runat="server" CssClass="form-label"></asp:Label>
    </div>
</asp:Content>