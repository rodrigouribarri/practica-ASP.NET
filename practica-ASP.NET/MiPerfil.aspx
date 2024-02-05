<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Pokedex_web.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 20px">
        <h2>Mi perfil</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <asp:Label Text="Email" for="txtEmail" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Apellido" for="txtApellido" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Campo requerido" ControlToValidate="txtApellido" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Nombre" for="txtNombre" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Label Text="Fecha Nacimiento" for="txtFechaNacimiento" CssClass="form-label" runat="server" />
                    <asp:TextBox ID="txtFechaNacimiento" CssClass="form-control" runat="server" TextMode="Date"/>
                </div>
            </div>
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label">Imágen Perfil</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                </div>
                <asp:Image ID="imgPerfil" ImageUrl="https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png" runat="server" CssClass="img img-fluid nb-3" style="max-block-size:255px" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Button Text="Guardar" ID="btnGuardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" runat="server" />
                <a href="/">Regresar</a>
            </div>
        </div>
    </div>
</asp:Content>
