<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pokedex_web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="row" style="display:flex; justify-content:center">
            <div class="col-6" >
                <h2 style="display: flex; justify-content: start">Pokemon cards</h2>
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <%--<% foreach (dominio.Pokemon pokemon in listaPokemon)
                        {
                    %>
                    <div class="col">
                        <div class="card">
                            <img src="<%=(pokemon.UrlImagen != null && pokemon.UrlImagen != "") ? pokemon.UrlImagen : "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%:pokemon.Nombre %></h5>
                                <p class="card-text"><%:pokemon.Tipo.Descripcion %></p>
                                <a href="Detalle.aspx?id=<%:pokemon.Id%>" >Ver detalle</a>
                            </div>
                        </div>
                    </div>
                    <% }%>--%>

                    <asp:Repeater runat="server" ID="rptRepetidor">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card">
<%--                                <img src="<%#Eval("UrlImagen")%>" class="card-img-top" alt="...">--%>
                                    <img src='<%# Eval("UrlImagen") != null && Eval("UrlImagen").ToString() != "" ? Eval("UrlImagen") : "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"%>' class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                        <p class="card-text"><%#Eval("Tipo.Descripcion")%></p>
                                        <a href="Detalle.aspx?id=<%#Eval("Id")%>" class="btn btn-outline-dark">Ver detalle</a>
                                        <asp:Button runat="server" ID="btnDetalle" Text="Detalle" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' CommandName="PokemonId" OnClick="btnDetalle_Click" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
