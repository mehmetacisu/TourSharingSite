<%@ Page Title="" Language="C#" MasterPageFile="~/UyeMasterPage.master" AutoEventWireup="true" CodeFile="odeme-bilgileri.aspx.cs" Inherits="odeme_bilgileri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="d-flex justify-content-center mt-5 mb-4">
        <div class="card col-md-6">
            <div class="card-header text-center text-success">
                <h3>Kart Bilgileri</h3>
            </div>
            <div class="card-body">
                <div class="form-group mb-2">
                    <label for="kartİsimSoyisim">İsim Soyisim</label>
                    <asp:TextBox ID="TextBoxKartSahibi" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kart sahibi bilgisi gereklidir!" Display="Dynamic" ControlToValidate="TextBoxKartSahibi" ForeColor="Red"></asp:RequiredFieldValidator>
                    <small id="nameHelp" class="form-text text-muted">Kartın üzerinde yazan İsim Soyisim</small>
                </div>
                <div class="form-group mb-2">
                    <label for="kartNumarasi">Kart Numarası</label>
                    <asp:TextBox ID="TextBoxKartNo" runat="server" CssClass="form-control" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Kart numarası gereklidir!" Display="Dynamic" ControlToValidate="TextBoxKartNo" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                        ControlToValidate="TextBoxKartNo"
                        ErrorMessage="Sadece sayı giriniz!" ForeColor="Red"
                        ValidationExpression="^[0-9]{16}$">
                    </asp:RegularExpressionValidator>
                    <small id="numberHelp" class="form-text text-muted">Kart üzerinde yazan 16 haneli numara</small>
                </div>
                <div class="form-group mb-2">
                    <label for="kartSonKullanmaTarihi">Son Kullanma Tarihi</label>
                    <asp:TextBox ID="TextBoxSKT" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Kart Son Kullanma Tarihi gereklidir!" Display="Dynamic" ControlToValidate="TextBoxSKT" ForeColor="Red"></asp:RequiredFieldValidator>
                    <small id="sktHelp" class="form-text text-muted">Kart üzerinde yazan Son Kullanma Tarihi</small>
                </div>
                <div class="form-group mb-2">
                    <label for="kartCvv">CVV</label>
                    <asp:TextBox ID="TextBoxCVV" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Kart CVV numarası gereklidir!" Display="Dynamic" ControlToValidate="TextBoxCVV" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic"
                        MinimumValue="100" MaximumValue="999" ControlToValidate="TextBoxCVV" ForeColor="Red"
                        ErrorMessage="Girilen CVV değeri uygun değil!" />
                    <small id="cvvHelp" class="form-text text-muted">Kart arkasında yazan 3 haneli CVV numarası</small>
                </div>
                <div class="form-group mb-2">
                    <label for="fiyat">Ödenecek Tutar : </label>
                    <asp:TextBox ID="TextBoxFiyat" runat="server" ReadOnly="true" Enabled="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="card-footer mt-3" align="center">
                    <span>Tüm bilgileriniz SSL Sertifikası ile korunmaktadır. &copy</span>
                </div>
            </div>
            <div align="right">
                <asp:Button runat="server" ID="buttonOde" Text="Ödemeyi Tamamla" CssClass="btn btn-outline-success my-2 mx-3" OnClick="buttonOde_Click" />
            </div>
            <div>
                <asp:Label runat="server" ID="labelMessage" Style="font-weight: bold"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>