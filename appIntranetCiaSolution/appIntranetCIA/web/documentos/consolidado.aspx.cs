using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using bibliotecaClases;
using System.Data;

namespace appIntranetCIA.web.documentos
{
    public partial class consolidado : System.Web.UI.Page
    {
        #region "Declaraciones"

        claseVentas claseVentas = new claseVentas();

        public DataTable oDs_Datos;
        public DataTable oDs_Detalle;

        #endregion
        #region "Procedimientos"


        void mostrarFormulario()
        {
            if (Request.QueryString["form"] == "1") {
                pnFactura.Visible = true;
                pnBoleta.Visible = false;
                
            }else if(Request.QueryString["form"] == "2")
            {
                pnFactura.Visible = false;
                pnBoleta.Visible = true;
            }

        }

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

                if (oDs_Datos.Rows[0]["DNI_RUC_CLI"].ToString() != null)
                {
                    lbl_Ruc.Text = oDs_Datos.Rows[0]["DNI_RUC_CLI"].ToString();
                }
           


            }

        }

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mostrarFormulario();
                mostrar_datos_venta();

            }
        }

        protected void btn_Render_Click(object sender, EventArgs e)
        {
            try
            {
                String codigo = Request.QueryString["cod_venta"].ToString();

                //String _open = "window.open('factura.aspx?cod_venta=" + codigo + "', 'sicnet', 'width=800,height=300,scrollbars=NO,resizable=0,left=400%,top=20%,menubar=NO,titlebar= NO,status=NO,toolbar=NO')";

                string _open = string.Format("window.open('factura.aspx?cod_venta={0}&conPago={1}&vendedor={2}&ordenC={3}&n_guia={4}&letras={5}&moneda={6}', 'sicnet', 'width=800,height=300,scrollbars=NO,resizable=0,left=400%,top=20%,menubar=NO,titlebar= NO,status=NO,toolbar=NO')",codigo,lbl_cp.Text,lbl_Vendedor.Text,lbl_Orden.Text,lbl_n_guia.Text,lbl_letras.Text,cbo_modena.SelectedValue);


                ScriptManager.RegisterStartupScript(this, GetType(), "open", _open, true);

                //ScriptManager.RegisterStartupScript(this, GetType(), "close", "window.close();", true);
                
            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnBoleta_Click(object sender, EventArgs e)
        {
            try
            {
                String codigo = Request.QueryString["cod_venta"].ToString();

                String _open = string.Format("window.open('boleta.aspx?cod_venta={0}&guia={1}&letras={2}', 'sicnet', 'width=800,height=600,scrollbars=NO,resizable=0,left=400%,top=20%,menubar=NO,titlebar= NO,status=NO,toolbar=NO')", codigo, lbl_guia.Text, lbl_Orden.Text);
                ScriptManager.RegisterStartupScript(this, GetType(), "open", _open, true);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}