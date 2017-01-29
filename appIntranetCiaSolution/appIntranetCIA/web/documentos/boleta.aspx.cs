using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using bibliotecaClases;

namespace appIntranetCIA.web.documentos
{
    public partial class boleta : System.Web.UI.Page
    {

        #region "Declaraciones"
        claseVentas claseVentas = new claseVentas();

        public DataTable oDs_Datos;
        public DataTable oDs_Detalle;
        public decimal total_v;

        public DateTime vg_fecha;

        #endregion

        #region "Procedimentos"

        

        public void mostrar_datos_venta()
        {
            oDs_Datos = claseVentas.FPublic_MostrarDatosVenta(Request.QueryString["cod_venta"].Trim());

            if (oDs_Datos.Rows.Count > 0)
            {

               
               
                if (oDs_Datos.Rows[0]["CLIENTE"].ToString() != null)
                {
                    lbl_Cliente.Text = oDs_Datos.Rows[0]["CLIENTE"].ToString();
                }
              
                if (oDs_Datos.Rows[0]["DIRECCION_CLIENTE"].ToString() != null)
                {
                    lbl_Direccion.Text = oDs_Datos.Rows[0]["DIRECCION_CLIENTE"].ToString();
                }
               
                if (oDs_Datos.Rows[0]["TOTAL_VENTA"].ToString() != null)
                {
                    lbl_TOTAL.Text = oDs_Datos.Rows[0]["TOTAL_VENTA"].ToString();
                }
                if (oDs_Datos.Rows[0]["DNI_RUC_CLI"].ToString() != null)
                {
                    lbl_Dni.Text = oDs_Datos.Rows[0]["DNI_RUC_CLI"].ToString();
                }


                //lbl_guia.Text = Request.QueryString["guia"].ToString();
                //
            }

        }

        
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    vg_fecha = DateTime.Now;

                    lbl_guia.Text = Request.QueryString["guia"].ToString();
                    lbl_letras.Text = Request.QueryString["letras"].ToString();

                    mostrar_datos_venta();

                    //Response.Write(oDs_Detalle.Rows.Count.ToString());
                   

                    oDs_Detalle = claseVentas.FPub_MostrarDatosDetalle(Request.QueryString["cod_venta"].Trim());
                    Response.Write("<script>javascript:window.print();</script>");

                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}