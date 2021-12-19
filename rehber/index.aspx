<%@ Page Title="Mehmet Tours - Rehber Paneli" Language="C#" MasterPageFile="~/rehber/RehberMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="rehberindex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="card col-md-3 bg-info text-white ms-auto">
            <div class="card-header text-center">
                Toplam Tur Sayısı
            </div>
            <div class="card-body text-center">
                <p class="card-text">
                    <asp:Label ID="labelToplamTurSayisi" runat="server"></asp:Label>
                </p>
                <br />
            </div>
        </div>
        <div class="card col-md-3 bg-info text-white ms-auto">
            <div class="card-header text-center">
                Toplam Misafir Sayısı
            </div>
            <div class="card-body text-center">
                <p class="card-text">
                    <asp:Label ID="labelMisafirSayisi" runat="server"></asp:Label>
                </p>
                <br />
            </div>
        </div>
        <div class="card col-md-3 bg-info text-white ms-auto me-auto">
            <div class="card-header text-center">
                Toplam Kazanç
            </div>
            <div class="card-body text-center">
                <p class="card-text">
                    <asp:Label ID="labelToplamKazanc" runat="server"></asp:Label>
                </p>
                <br />
            </div>
        </div>
    </div>
</asp:Content>