using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;


namespace Pokedex_web
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Pokemon> listaPokemon { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            PokemonNegocio negocio = new PokemonNegocio();
            listaPokemon = negocio.listarConSP();

            if (!IsPostBack)
            {
                rptRepetidor.DataSource = listaPokemon;
                rptRepetidor.DataBind();
            }
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
        }
    }
}