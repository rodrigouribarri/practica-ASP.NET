<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Pokedex_web.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Hubo un problema</h1>
    <asp:Label Text="text" ID="lblMensaje" runat="server" />
    <asp:Button Text="Ir a login" ID="btnIrLoguin" CssClass="btn btn-primary" OnClick="btnIrLoguin_Click" runat="server" />
</asp:Content>
