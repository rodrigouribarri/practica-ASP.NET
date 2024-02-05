using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace Pokedex_web
{
    public partial class PokemonsLista : System.Web.UI.Page
    {
        public void limpiarFiltro()
        {
            txtFiltroAvanzado.Text = "";

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["trainee"]))
            {
                Session.Add("error", "No tienes permiso de admin para ingresar a esta página");
                Response.Redirect("Error.aspx", false);
            }

            if (!Seguridad.sessionActiva(Session["trainee"]))
            {
                //if (Session["usuario"] == null)
                    Session.Add("error", "Debes loguearte para ingresar");
                    Response.Redirect("Error.aspx", false);
                
            }
            else
            {

                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("ListaPokemons", negocio.listarConSP());
                dgvPokemons.DataSource = Session["ListaPokemons"];
                dgvPokemons.DataBind();
            }
        }

        protected void dgvPokemons_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvPokemons.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemons.aspx?id=" + id);
        }

        protected void dgvPokemons_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvPokemons.PageIndex = e.NewPageIndex;
            dgvPokemons.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {

            //List<Pokemon> lista = (List<Pokemon>)Session["ListaPokemons"];
            List<Pokemon> listaFiltrada = ((List<Pokemon>)Session["ListaPokemons"]).FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvPokemons.DataSource = listaFiltrada;
            dgvPokemons.DataBind();
        }

        protected void ckbFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            txtFiltro.Enabled = !ckbFiltroAvanzado.Checked;

        }
        private void cargarCriterios()
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Número")
            {
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
            }
            else
            {
                ddlCriterio.Items.Add("Empieza con");
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {

            cargarCriterios();
        }

        protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvPokemons.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvPokemons.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }

        }

        protected void LimpiarFiltro_Click(object sender, EventArgs e)
        {
            limpiarFiltro();
        }
    }
}