<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="FormularioPokemons.aspx.cs" Inherits="Pokedex_web.FormularioPokemons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ScriptManager es requerido para utilizar Update Panel--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row" style="margin: 10px">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">ID</label>
                <asp:TextBox ID="txtId" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Número:</label>
                <asp:TextBox ID="txtNumero" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo:</label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad:</label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAceptar" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-warning" runat="server" />
                <a href="PokemonsLista.aspx">Cancelar</a>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción:</label>
                <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtUrlImagen" class="form-label">URL Imágen</label>
                        <asp:TextBox ID="txtUrlImagen" CssClass="form-control" runat="server"
                            AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://thumbs.dreamstime.com/b/sin-foto-ni-icono-de-imagen-en-blanco-cargar-im%C3%A1genes-o-falta-marca-no-disponible-pr%C3%B3xima-se%C3%B1al-silueta-naturaleza-simple-marco-215973362.jpg"
                        ID="imgPokemon" runat="server" Width="50%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <asp:Button ID="btnEliminar" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <%if (ConfirmarEliminacion)
                        {%>
                    <div class="mb-3">
                        <asp:CheckBox Text="Confirmar eliminación" ID="ckbConfirmaEliminar" runat="server" />
                        <asp:Button ID="btnConfirmaEliminar" Text="Eliminar" CssClass="btn btn-outline-danger" OnClick="btnConfirmaEliminar_Click" runat="server" />
                    </div>
                    <% } %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
