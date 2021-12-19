<%@ Page Title="Mehmet Tours - Tur İşlemleri" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="turislemleri.aspx.cs" Inherits="turislemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="RepeaterTurlar" runat="server">
        <ItemTemplate>
            <div class="card card-deck m-1">
                <div class="card">
                    <img src='<%#Eval("TurResim") %>' height="250" width="250" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">
                            <label>Tur Adı : </label>
                            <%#Eval("Ad")%></h5>
                        <label>Tur Açıklaması : </label>

                        <p class="card-text"><%#Eval("Aciklama")%></p>
                        <label>Tur Kategorisi : </label>

                        <p class="card-text"><%#Eval("KategoriAdi")%></p>
                        <label>Tur Başlangıç Tarihi : </label>

                        <p class="card-text"><%#Eval("TurTarih")%></p>
                        <label>Tur Bitiş Tarihi : </label>

                        <p class="card-text"><%#Eval("BitisTarihi")%></p>
                        <label>Tur Sahibi : </label>

                        <p class="card-text"><%#Eval("TurSahibi")%></p>
                        <label>Tur Durumu : </label>

                        <p class="card-text"><%#Eval("Durumu")%></p>
                        <label>Tur Fiyatı : </label>

                        <p class="card-text"><%#Eval("Fiyat")%>₺</p>
                        <asp:HyperLink ID="buttonKatilanlar" runat="server" CssClass="btn btn-outline-success" NavigateUrl='<%# "katilanlarigoruntule.aspx?Id="+ Eval("Id") %>' Text="Katılanları Görüntüle"></asp:HyperLink>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>