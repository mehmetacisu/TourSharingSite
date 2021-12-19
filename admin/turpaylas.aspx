<%@ Page Language="C#" AutoEventWireup="true" CodeFile="turpaylas.aspx.cs" Inherits="admin_turpaylas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mehmet Tours - Tur Paylaş</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
    <link href="../CSS/datetimepicker.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../JS/datetimepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#picker').dateTimePicker();
            $('#picker-no-time').dateTimePicker({ showTime: false, dateFormat: 'DD/MM/YYYY', title: 'Select Date' });
        })
        $(document).ready(function () {
            $('#picker1').dateTimePicker();
            $('#picker-no-time').dateTimePicker({ showTime: false, dateFormat: 'DD/MM/YYYY', title: 'Select Date' });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" href="index.aspx">Mehmet Tours</a>
            </nav>
            <div class="form-group">
                <label for="turAdi" class="col-md-3 control-label">Tur Adı</label>
                <div class="col-md-9">
                    <asp:TextBox ID="TextBoxAdi" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="turAciklama" class="col-md-3 control-label">Tur Açıklama</label>
                <div class="col-md-9">
                    <asp:TextBox ID="TextBoxAciklama" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form-group">
                    <label class="col-md-9 control-label">Tur Başlangıç Tarihini Seçiniz</label>
                    <div style="width: 250px; margin: 20px;">
                        <div id="picker"></div>
                        <input type="hidden" runat="server" id="baslangic" value="" />
                    </div>
                    <div class="form-group">
                        <label class="col-md-9 control-label">Tur Bitiş Tarihini Seçiniz</label>
                        <div style="width: 250px; margin: 20px;">
                            <div id="picker1"></div>
                            <input type="hidden" runat="server" id="bitis" value="" />
                        </div>

                        <div class="form-group">
                            <label for="lastname" class="col-md-3 control-label">Tur Fiyatı</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="TextBoxFiyat" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ddl_kategori" runat="server" class="col-md-3 control-label">Tur Kategorisi</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddl_kategori" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="turResim" runat="server" class="col-md-3 control-label">Tur Resmi</label>
                            <div class="col-md-9">
                                <asp:FileUpload runat="server" ID="turResim" CssClass="form-control" required="true" />
                            </div>
                        </div>
                        <div>
                            <asp:Label runat="server" ID="txtMessage" CssClass="lblMessage" Text=""></asp:Label>
                        </div>
                    </div>
                    <asp:Button runat="server" ID="buttonPaylas" Text="Paylaş" CssClass="btn btn-info ml-3" OnClick="buttonPaylas_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>