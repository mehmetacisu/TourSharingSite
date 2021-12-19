<%@ Page Title="Mehmet Tours - Misafirlerim" Language="C#" MasterPageFile="~/rehber/RehberMasterPage.master" AutoEventWireup="true" CodeFile="misafirlerim.aspx.cs" Inherits="rehber_misafirlerim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="buttonPdf" runat="server" Text="PDF" CssClass="btn btn-outline-info mb-2" OnClick="buttonPdf_Click" />
    <div id="print" runat="server" class="table-responsive">
        <table class="table  table-bordered ">
            <tr class="bg-danger">
                <td>Tur Adı</td>
                <td>Ad</td>
                <td>Soyad</td>
                <td>Mail</td>
                <td>Telefon</td>
                <td>Katilim Tarihi</td>
            </tr>
            <asp:Repeater ID="RepeaterMisafirlerim" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("TurAdi") %></td>
                        <td><%#Eval("Ad") %></td>
                        <td><%#Eval("Soyad") %></td>
                        <td><%#Eval("Mail") %></td>
                        <td><%#Eval("Telefon") %></td>
                        <td><%#Eval("KatilimTarihi") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>