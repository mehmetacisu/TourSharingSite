<%@ Page Title="Mehmet Tours - Turları Görüntüle" Language="C#" MasterPageFile="~/rehber/RehberMasterPage.master" AutoEventWireup="true" CodeFile="turlarimi-goruntule.aspx.cs" Inherits="rehber_turlarimi_goruntule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 class="text-center text-danger">Paylaştığınız Turlar</h3>
    <div class="d-flex flex-wrap">
        <asp:Repeater ID="Repeater_Turlarim" runat="server">
            <ItemTemplate>
                <div class="justify-content-start ps-2 pb-3">
                    <div class="card p-2 mt-3 bg-white">
                        <div class="about-product text-center mt-2">
                            <img alt="" height="350" width="350" src='<%#Eval("Resim") %>' />
                        </div>
                        <div class="stats mt-2">
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
                                    <label>Durumu </label>
                                </span><span class="text-warning"><%#Eval("Durumu")%></span>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>