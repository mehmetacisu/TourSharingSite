<%@ Page Title="Mehmet Tours - Tur Paylaş" Language="C#" MasterPageFile="~/rehber/RehberMasterPage.master" AutoEventWireup="true" CodeFile="tur-paylas.aspx.cs" Inherits="rehber_tur_paylas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/datetimepicker.css" />
    <script type="text/javascript" src="../JS/datetimepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#picker').dateTimePicker();
            $('#picker-no-time').dateTimePicker({ showTime: false, dateFormat: 'DD/MM/YYYY', title: 'Select Date' });
        })
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#picker1').dateTimePicker();
            $('#picker-no-time').dateTimePicker({ showTime: false, dateFormat: 'DD/MM/YYYY', title: 'Select Date' });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="form-group mb-2">
            <label for="turAdi" class="col-md-3 control-label">Tur Adı</label>
            <div class="col-md-9">
                <asp:TextBox ID="TextBoxAdi" runat="server" CssClass="form-control" placeholder="Doğa Turu"></asp:TextBox>
            </div>
        </div>
        <div class="form-group mb-2">
            <label for="turAciklama" class="col-md-3 control-label">Tur Açıklama</label>
            <div class="col-md-9">
                <asp:TextBox ID="TextBoxAciklama" runat="server" CssClass="form-control" placeholder="Doğa Turu" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div>
            <div class="form-group mb-2">
                <label class="col-md-9 control-label">Tur Başlangıç Tarihini Seçiniz</label>
                <div style="width: 250px; margin: 20px;">
                    <div id="picker"></div>
                    <input type="hidden" runat="server" id="baslangic" value="" />
                </div>
                <label class="col-md-9 control-label">Tur Bitiş Tarihini Seçiniz</label>
                <div style="width: 250px; margin: 20px;">
                    <div id="picker1"></div>
                    <input type="hidden" runat="server" id="bitis" value="" />
                </div>
            </div>
            <div class="form-group mb-2">
                <label for="lastname" class="col-md-3 control-label">Tur Fiyatı</label>
                <div class="col-md-9">
                    <asp:TextBox ID="TextBoxFiyat" runat="server" CssClass="form-control" placeholder="2500₺"></asp:TextBox>
                </div>
            </div>
            <div class="form-group mb-2">
                <label for="ddl_kategori" runat="server" class="col-md-3 control-label">Tur Kategorisi</label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddl_kategori" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group mb-2">
                <label for="turResim" runat="server" class="col-md-3 control-label">Tur Resmi</label>
                <div class="col-md-9">
                    <asp:FileUpload runat="server" CssClass="form-control" ID="turResim" />
                </div>
            </div>
            <div>
                <asp:Button runat="server" ID="buttonPaylas" Text="Paylaş" CssClass="btn btn-outline-info mt-2" OnClick="buttonPaylas_Click" />
            </div>
            <div>
                <asp:Label runat="server" ID="labelMessage" CssClass="form-label"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>