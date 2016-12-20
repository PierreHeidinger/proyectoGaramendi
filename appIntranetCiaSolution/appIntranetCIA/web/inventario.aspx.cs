using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using bibliotecaClases;
using System.Data;

namespace appIntranetCIA.web
{
    public partial class inventario : System.Web.UI.Page
    {

        #region "Declaraciones"

        claseInventario obj_inventario = new claseInventario();
        DataTable oDT_Datos;

        #endregion

        #region "Procedimientos"


        private void Notificacion(String v_estado, String mensaje)
        {
            try
            {
                if (v_estado == "1")
                {
                    lt_Notificacion.Text = "<div class='alert alert-success'>" +
                                           "<span><b> Bien! - </b>" + mensaje + "</span>" +
                                           "</div>";
                }
                else
                {
                    lt_Notificacion.Text = "<div class='alert alert-danger'>" +
                                           "<span><b> Cuidado! - </b>" + mensaje + "</span>" +
                                           "</div>";
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        private void Listar_Inventario(String v_CODIGO, String v_DESCRIPCION, DateTime v_FECHA1, DateTime v_FECHA2)
        {
            try { 

                if( txt_Codigo.Text != "" && txt_Codigo.Text.Length != 6)
                {
                    Notificacion("2", "El codigo debe contener 6 digitos");
                    return;
                }


                oDT_Datos = obj_inventario.FPub_ListadoInventario_Cab( v_CODIGO,  v_DESCRIPCION, v_FECHA1,  v_FECHA2);
                dg_Inventario.DataSource = oDT_Datos;
                dg_Inventario.DataBind();

                lt_Notificacion.Text = "";
            }catch(Exception ex)
            {
               
            }
        }



        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txt_Fecha1.Text = DateTime.Now.AddMonths(-1).ToShortDateString();
                txt_Fecha2.Text = DateTime.Now.ToShortDateString();
                Listar_Inventario(txt_Codigo.Text,txt_Descripcion.Text,DateTime.Parse(txt_Fecha1.Text),DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            }
        }

        protected void btn_Categorias_Click(object sender, EventArgs e)
        {
            Response.Redirect("categoria.aspx");
        }

        protected void btn_SubCategorias_Click(object sender, EventArgs e)
        {
            Response.Redirect("subcategoria.aspx");
        }

        protected void btn_Marcas_Click(object sender, EventArgs e)
        {
            Response.Redirect("marcas.aspx");
        }

        protected void btn_Nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventario_detalle.aspx");
        }

        protected void txt_Codigo_TextChanged(object sender, EventArgs e)
        {
            try {

                Listar_Inventario(txt_Codigo.Text, txt_Descripcion.Text, DateTime.Parse(txt_Fecha1.Text), DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            }catch(Exception EX)
            {

            }
        }

        protected void txt_Descripcion_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Listar_Inventario(txt_Codigo.Text, txt_Descripcion.Text, DateTime.Parse(txt_Fecha1.Text), DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            }
            catch (Exception EX)
            {

            }
        }

        protected void txt_Fecha1_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Listar_Inventario(txt_Codigo.Text, txt_Descripcion.Text, DateTime.Parse(txt_Fecha1.Text), DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            }
            catch (Exception EX)
            {

            }
        }

        protected void txt_Fecha2_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Listar_Inventario(txt_Codigo.Text, txt_Descripcion.Text, DateTime.Parse(txt_Fecha1.Text), DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            }
            catch (Exception EX)
            {

            }
        }
    }
}