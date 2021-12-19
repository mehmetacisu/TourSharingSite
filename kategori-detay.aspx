<%@ Page Title="Mehmet Tours - Kategori Detay" Language="C#" MasterPageFile="~/UyeMasterPage.master" AutoEventWireup="true" CodeFile="kategori-detay.aspx.cs" Inherits="kategori_detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid border border-info border-1 mt-1">
        <ul class="nav justify-content-center">
            <asp:Repeater ID="Repeater_Kategoriler" runat="server">
                <ItemTemplate>
                    <li class="nav-item">
                        <a class="nav-link rounded rounded-pill text-info"
                            href='<%#HttpUtility.HtmlEncode(KarakterDuzenleyici.KarakterDuzenle(Eval("kategoriAdi").ToString())) %>?kt=<%#HttpUtility.HtmlEncode(Eval("Id"))%>'>
                            <%#Eval("kategoriAdi") %>
                        </a>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="d-flex flex-wrap">
        <asp:Repeater ID="Repeater_Turlar" runat="server">
            <ItemTemplate>
                <div class="justify-content-start ps-5 pb-3">
                    <div class="card p-2 mt-3 bg-white">
                        <div class="about-product text-center mt-2">
                            <img alt="" height="350" width="350" src='<%#HttpUtility.HtmlEncode(Eval("Resim")) %>' />
                        </div>
                        <div class="stats mt-2">
                            <div class="d-flex justify-content-center fw-bold">
                                <span></span><span><%#HttpUtility.HtmlEncode(KarakterDuzenleyici.KarakterDuzenle(Eval("turAdi").ToString()))%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Açıklaması </label>
                                </span><span style="overflow: auto;"><%#HttpUtility.HtmlEncode(Eval("Aciklama"))%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Kategorisi</label>
                                </span><span><%#HttpUtility.HtmlEncode(Eval("KategoriAdi"))%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Başlangıç Tarihi </label>
                                </span><span><%#HttpUtility.HtmlEncode(Eval("BaslangicTarihi"))%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Bitiş Tarihi </label>
                                </span><span><%#HttpUtility.HtmlEncode(Eval("BitisTarihi"))%></span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Fiyatı  </label>
                                </span><span><%#HttpUtility.HtmlEncode(Eval("Fiyat"))%>₺</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>
                                    <label>Rehber </label>
                                </span><span><%#HttpUtility.HtmlEncode(Eval("TurSahibi"))%></span>
                            </div>
                        </div>
                        <div>
                            <a href='odeme-sayfasi/<%#KarakterDuzenleyici.KarakterDuzenle(Eval("turAdi").ToString())%>?Tur=<%#HttpUtility.HtmlEncode(Eval("Tur"))%>' class="btn btn-success">Satın Al</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>