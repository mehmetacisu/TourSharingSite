<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="katilanlarigoruntule.aspx.cs" Inherits="admin_katilanlarigoruntule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="mt-2">
        </div>
        <div class="text-center fw-bold mb-2">
            <h3>Tura Katılanların Bilgileri</h3>
            <asp:Label ID="katilanSayisi" runat="server" CssClass="text-danger"></asp:Label>
        </div>
        <table class="table table-bordered">
            <tr class="table-primary">
                <th>Tur Adı</th>
                <th>Tur Sahibi</th>
                <th>Tur Başlangıç Tarihi</th>
                <th>Üye Bilgisi</th>
                <th>Üye Kullanıcı Adı</th>
            </tr>
            <asp:Repeater ID="RepeaterKatilanlariGor" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("TurAdi") %></td>
                        <td><%# Eval("TurSahibi") %></td>
                        <td><%# Eval("TurBaslangicTarihi") %></td>
                        <td><%# Eval("UyeBilgisi") %></td>
                        <td><%# Eval("UyeKadi") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>