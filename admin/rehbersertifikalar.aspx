<%@ Page Title="Mehmet Tours - Rehber Sertifikalar" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="rehbersertifikalar.aspx.cs" Inherits="RehberSertifikalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <h3>Rehber Sertifikaları </h3>
        <br />
        <asp:Repeater ID="Repeater_Sertifikalar" runat="server">
            <ItemTemplate>
                <div>
                    <span><i class="fas fa-id-badge"></i></span>
                    <asp:Label runat="server">Rehber ID : </asp:Label>
                    <%#Eval("Id")%>
                    <br />
                    <span><i class="fas fa-user-tag"></i></span>
                    <asp:Label runat="server">Rehber Kullanıcı Adı : </asp:Label>
                    <%#Eval("KullaniciAdi")%>
                    <br />
                    <%--<asp:Image ID="image1" runat="server" Width="300px" Height="300px" ImageUrl='<%#Eval("SertifikaYolu") %>' />--%>
                    <img alt="Sertifika" height="300" width="300" src='<%#Eval("SertifikaYolu") %>' />
                    <hr />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="labelMessage" runat="server" CssClass="form-label"></asp:Label>
    </div>
</asp:Content>