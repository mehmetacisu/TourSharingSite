<%@ Page Title="Mehmet Tours - Anasayfa" Language="C#" MasterPageFile="~/UyeMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        $('#slider').carousel({
            interval: 3000,
            cycle: true
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Slider başlangıç -->
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div id="slider" class="carousel carousel-dark slide" data-ride="carousel">
                <div class="carousel-inner">
                    <asp:Repeater ID="RepeaterSlider" runat="server">
                        <ItemTemplate>
                            <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>">
                                <img alt="" src="<%#Eval("Fotograf")%>" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <a class="carousel-control-prev" href="#slider" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Geri</span>
                </a>
                <a class="carousel-control-next" href="#slider" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">İleri</span>
                </a>
            </div>
        </div>
    </div>
    <%-- Kategori Başlangıç --%>
    <div class="container-fluid border border-info border-1 mt-1">
        <ul class="nav justify-content-center">
            <asp:Repeater ID="Repeater_Kategoriler" runat="server">
                <ItemTemplate>
                    <li class="nav-item">
                        <a class="nav-link rounded rounded-pill text-info"
                            href='<%#HttpUtility.HtmlEncode(KarakterDuzenleyici.KarakterDuzenle(Eval("kategoriAdi").ToString()))%>?kt=<%#HttpUtility.HtmlEncode(Eval("Id"))%>'>
                            <%#Eval("kategoriAdi") %>
                        </a>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <%-- Kategori bitiş --%>
    <%--içerik başlangıç--%>
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
                                <span></span><span><%#HttpUtility.HtmlEncode(Eval("turAdi"))%></span>
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
                            <a href='odeme-bilgileri.aspx?Tur=<%#Eval("Tur") %>' class="btn btn-outline-info">Satın Al</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- içerik son -->
</asp:Content>