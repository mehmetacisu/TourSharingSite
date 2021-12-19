<%@ Page Title="Mehmet Tours - Yasaklı Üyeler" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="yasakliuyeler.aspx.cs" Inherits="YasakliUyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <h3 style="text-align: center;">Yasaklanmış Üyeler</h3>
        <br />
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Ad</th>
                <th>Soyad</th>
                <th>Mail</th>
                <th>Tel</th>
                <th>Kullanici</th>
                <th>Üyelik Tarihi</th>
                <th>Durumu</th>
            </tr>
            <asp:Repeater runat="server" ID="RepeaterYasakliUyeler">
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
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>