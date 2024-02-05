<%@ Page Title="" Language="C#" MasterPageFile="~/Master_page.Master" AutoEventWireup="true" CodeBehind="PokemonsLista.aspx.cs" Inherits="Pokedex_web.PokemonsLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
        <div class="container text-fluid">
        <div class="row">
            <div class="col"></div>
            <div class="col-10">
                <h1>Lista de Pokemons</h1>
                <div class="row">
                    <div class="col-6">
                        <div class="mb-3">
                            <asp:Label Text="Filtro:" CssClass="form-label" runat="server" />
                            <asp:TextBox ID="txtFiltro" AutoPostBack="true"
                                OnTextChanged="txtFiltro_TextChanged" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
                        <div class="mb-3">
                            <asp:CheckBox Text="Filtro avanzado" runat="server"
                                CssClass="form-check-input" ID="ckbFiltroAvanzado"
                                AutoPostBack="true"
                                OnCheckedChanged="ckbFiltroAvanzado_CheckedChanged" />
                        </div>
                    </div>
                </div>
                <%if (ckbFiltroAvanzado.Checked)
                    {%>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                                    <asp:DropDownList CssClass="form-control" ID="ddlCampo"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged"
                                        runat="server">
                                        <asp:ListItem Text="Nombre" />
                                        <asp:ListItem Text="Número" />
                                        <asp:ListItem Text="Tipo" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Criterio" runat="server" />
                                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Filtro" runat="server" />
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroAvanzado" />
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Estado" runat="server" />
                                    <asp:DropDownList ID="ddlEstado" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Todos" />
                                        <asp:ListItem Text="Activo" />
                                        <asp:ListItem Text="Inactivo" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                        <div class="row">
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Button Text="Buscar" ID="btnBuscarAvanzado"
                                        CssClass="btn btn-primary"
                                        OnClick="btnBuscarAvanzado_Click"
                                        runat="server" />
                                    <asp:Button Text="Limpiar filtro" ID="LimpiarFiltro"
                                        CssClass="btn btn-primary"
                                        OnClick="LimpiarFiltro_Click"
                                        runat="server" />
                                </div>
                            </div>
                        </div>

                <%}%>

                <asp:GridView ID="dgvPokemons" CssClass="table" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                    OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
                    OnPageIndexChanging="dgvPokemons_PageIndexChanging"
                    AllowPaging="true" PageSize="5">
                    <Columns>
                        <asp:BoundField HeaderText="Número" DataField="Numero" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server"
                                    Text='<%# (bool)(Eval("Activo"))?"Activo":"Inactivo"%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:CheckBoxField HeaderText="Activo" DataField="Activo" />--%>
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
                    </Columns>
                </asp:GridView>
                <a href="FormularioPokemons.aspx" class="btn btn-primary">Agregar</a>
            </div>
            <div class="col"></div>
        </div>
    </div>
</asp:Content>
