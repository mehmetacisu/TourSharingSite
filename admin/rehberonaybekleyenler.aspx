<%@ Page Title="Mehmet Tours - Rehber Onay Bekleyenler" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="rehberonaybekleyenler.aspx.cs" Inherits="RehberOnayBekleyenler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Ad Soyad</th>
            <th>Kullanıcı Adı</th>
            <th>Üyelik Tarihi</th>
            <th>Sertifikası</th>
            <th>İşlemler</th>
        </tr>
        <asp:Repeater ID="OnayBekleyenRehberler" runat="server">
            <ItemTemplate>
                <tr class="text-center">
                    <td><%#Eval("Id") %></td>
                    <td><%#Eval("AdSoyad") %></td>
                    <td><%#Eval("KullaniciAdi") %></td>
                    <td><%#Eval("UyelikTarihi") %></td>
                    <td><a href="Sertifikalar\<%#Eval("SertifikaYolu") %>" target="_blank">
                        <img alt="Seritifka" height="250" width="250" src='<%#Eval("SertifikaYolu") %>' /></a></td>
                    <td>
                        <asp:HyperLink runat="server" ID="HyperLinkOnayla" CssClass="btn btn-warning" NavigateUrl='<%# "RehberOnayla.aspx?Id="+ Eval("Id") %>'>Onayla</asp:HyperLink>
                        <asp:HyperLink runat="server" ID="HyperLinkRet" CssClass="btn btn-danger" NavigateUrl='<%# "RehberRet.aspx?Id="+ Eval("Id") %>'>Ret</asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <asp:Label ID="labelMessage" runat="server" CssClass="form-label"></asp:Label>
</asp:Content>