<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pokedex_web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="display:flex; justify-content: center">
        <div class="col-4">
            <div class="mb-3">
                <asp:Label for="txtEmail" Text="Email" CssClass="form-label" runat="server" />
                <asp:TextBox runat="server"  ID="txtEmail" CssClass="form-control"/>
            </div>
            <div class="mb-3">
                <asp:Label for="txtPass" Text="Contraseña" CssClass="form-label" runat="server"/>
                <asp:TextBox runat="server" type="password" ID="txtPass" CssClass="form-control"/>
            </div>
            <div class="mb-3">
                <asp:Label  ID="lblIncorrecto" Text="Contraseña o usuario incorrecto" style="color:red" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Ingresar" ID="txtIngresar" OnClick="txtIngresar_Click" CssClass="btn btn-primary" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>