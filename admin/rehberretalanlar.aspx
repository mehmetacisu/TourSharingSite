<%@ Page Title="Mehmet Tours - Rehber Ret Alanlar" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="rehberretalanlar.aspx.cs" Inherits="RehberRetAlanlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Ad Soyad</th>
            <th>TC</th>
            <th>Telefon</th>
            <th>Kullanıcı Adı</th>
            <th>Mail</th>
            <th>Üyelik Tarihi</th>
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
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Label ID="labelMessage" runat="server" CssClass="form-label"></asp:Label>
</asp:Content>