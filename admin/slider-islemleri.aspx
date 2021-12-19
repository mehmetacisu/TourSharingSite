<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="slider-islemleri.aspx.cs" Inherits="admin_slider_islemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mt-2">
        <asp:Label ID="labelMessage" runat="server" CssClass="fw-bold" Text=""></asp:Label>
        <div class="mb-2 d-flex">
            <div class="form-check-inline justify-content-center mx-auto">
                <div class="text-center text-danger">Slider Yükle</div>
                <div class="input-group mt-2">
                    <asp:FileUpload ID="FileUploadSlider" runat="server" CssClass="form-control me-2" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Lütfen Dosya Seçin!" ControlToValidate="FileUploadSlider" CssClass="me-4"></asp:RequiredFieldValidator>
                    <asp:Button ID="buttonYukle" runat="server" CssClass="btn btn-outline-info rounded" OnClick="buttonYukle_Click" Text="Yükle" />
                </div>
            </div>
        </div>
        <table class="table table-bordered table-responsive">
            <tr>
                <td colspan="6" class="text-center bg-danger text-white">
                    <h4>Slider işlemleri</h4>
                </td>
            </tr>
            <tr class="fw-bold bg-light">
                <td>#</td>
                <td>Adı</td>
                <td>Sıra No</td>
                <td>Fotoğraf</td>
                <td>Sil</td>
            </tr>
            <asp:Repeater ID="RepeaterSlider" runat="server" OnItemCommand="RepeaterSlider_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id")%></td>
                        <td><%#Eval("DosyaAdi")%></td>
                        <td><%#Eval("SiraNo")%></td>
                        <td>
                            <a href="Resimler\<%#Eval("Fotograf")%>" target="_blank" class="btn btn-outline-success">Fotoğrafı Gör</a>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButtonSil" CommandName="sil" runat="server" CommandArgument='<%#Eval("Id") %>' Text="Sil" CssClass="btn btn-outline-danger"></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>