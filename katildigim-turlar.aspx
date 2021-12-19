<%@ Page Title="Mehmet Tours - Katıldığım Turlar" Language="C#" MasterPageFile="~/UyeMasterPage.master" AutoEventWireup="true" CodeFile="katildigim-turlar.aspx.cs" Inherits="katildigimturlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="d-flex flex-wrap">
        <asp:Repeater ID="RepeaterKatildigimTurlar" runat="server">
            <ItemTemplate>
                <div class="justify-content-start ps-5 pt-2 pb-3">
                    <div class="card p-2 mt-2 bg-white">
                        <div class="about-product text-center mt-2">
                            <img alt="" height="320" width="320" src='<%#Eval("Resim") %>' />
                        </div>
                        <div class="d-flex justify-content-center fw-bold">
                            <span></span><span><%#Eval("Ad")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Açıklaması </label>
                            </span><span style="overflow: auto;"><%#Eval("Aciklama")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Kategorisi</label>
                            </span><span><%#Eval("KategoriAdi")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Başlangıç Tarihi </label>
                            </span><span><%#Eval("BaslangicTarihi")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Bitiş Tarihi </label>
                            </span><span><%#Eval("BitisTarihi")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Fiyatı  </label>
                            </span><span><%#Eval("Fiyat")%>₺</span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Rehber </label>
                            </span><span><%#Eval("TurSahibi")%></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>
                                <label>Ödeme Tarihi </label>
                            </span><span><%#Eval("OdemeTarihi")%></span>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>