<%@ Page Title="Mehmet Tours - Yayındaki Turlar" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="yayindakiturlar.aspx.cs" Inherits="YayindakiTurlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                        <label>Tur Tarihi : </label>

                        <p class="card-text"><%#Eval("TurTarih")%></p>
                        <label>Tur Rehberi : </label>

                        <p class="card-text"><%#Eval("TurSahibi")%></p>
                        <label>Tur Durumu : </label>

                        <p class="card-text"><%#Eval("Durumu")%></p>
                        <label>Tur Fiyatı : </label>

                        <p class="card-text"><%#Eval("Fiyat")%>₺</p>
                        <asp:HyperLink ID="HyperLinkGuncelle" runat="server" CssClass="btn btn-info" NavigateUrl='<%# "TurGuncelle.aspx?Id="+ Eval("Id") %>'>Güncelle</asp:HyperLink>
                        <asp:HyperLink ID="HyperLinkSil" runat="server" CssClass="btn btn-danger" NavigateUrl='<%# "TurSil.aspx?Id="+ Eval("Id") %>'>Sil</asp:HyperLink>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>