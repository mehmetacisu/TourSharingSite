<%@ Page Title="Mehmet Tours - Admin Anasayfa" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4 text-center">Dashboard</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Bilgiler</li>
            </ol>
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-secondary text-white mb-4">
                        <div class="card-body text-center">Toplam Tur Sayısı</div>
                        <div class="card-body text-center">
                            <asp:Label runat="server" ID="turSayisi"></asp:Label>
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="turislemleri.aspx">Tur Detayları</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">Toplam Rehber Sayısı</div>
                        <div class="card-body text-center">
                            <asp:Label runat="server" ID="rehberSayisi"></asp:Label>
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="rehberislemleri.aspx">Rehber Detayları</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">Toplam Üye Sayısı</div>
                        <div class="card-body text-center">
                            <asp:Label runat="server" ID="uyeSayisi"></asp:Label>
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="uyeislemleri.aspx">Üye Detayları</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">Toplam Satın Alım Sayısı</div>
                        <div class="card-body text-center">
                            <asp:Label runat="server" ID="satilanTurSayisi"></asp:Label>
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="satilanturlar.aspx">Satılan Tur Detayları</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>