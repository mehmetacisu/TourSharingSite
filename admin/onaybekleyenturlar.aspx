<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="onaybekleyenturlar.aspx.cs" Inherits="admin_onaybekleyenturlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="RepeaterTurlar" runat="server" OnItemCommand="RepeaterTurlar_ItemCommand">
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
                        <asp:LinkButton ID="LinkButtonOnayla" CommandName="onayla" runat="server" CommandArgument='<%#Eval("Id") %>' Text="Onayla" CssClass="btn btn-success"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>