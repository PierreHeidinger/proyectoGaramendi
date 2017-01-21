using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using bibliotecaClases;

namespace appIntranetCIA.web
{
    public partial class marca : System.Web.UI.Page
    {

        #region "Declaraciones"

        claseInventario obj_Inventario = new claseInventario();
        DataTable oDT_Datos;

        #endregion

        #region "Procedimientos"


        private void MostrarMarcas()
        {
            try { 
            oDT_Datos = obj_Inventario.FPub_MostrarMarcas();
            dg_Marcas.DataSource = oDT_Datos;
            dg_Marcas.DataBind();
            }catch(Exception ex)
            {
                throw ex;
            }
        }

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


        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarMarcas();
            }

        }

        protected void btn_Inventario_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventario.aspx");
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txt_Descripcion.Text == "")
                {
                    Notificacion("2", "Ingrese la Descripcion");
                    return;
                }

                if(txt_Sigla.Text == "")
                {
                    Notificacion("2", "Ingrese la sigla");
                    return;
                }
                if(txt_Sigla.Text.Length > 3 || txt_Sigla.Text.Length < 3)
                {
                    Notificacion("2", "LA SIGLA  DEBE CONTENER 3 CARACTERES");
                    return;
                }

                obj_Inventario.FPub_MantenimientoMarcas("1", "", txt_Sigla.Text.ToUpper(), txt_Descripcion.Text.ToUpper());

                Notificacion("1", "MARCA AGREGADA SATISFACTORIAMENTE");
                MostrarMarcas();

                txt_Descripcion.Text = "";
                txt_Sigla.Text = "";

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dg_Marcas_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                TextBox codigo = (TextBox)dg_Marcas.Items[e.Item.ItemIndex].FindControl("cod_marca_del");

               string res = obj_Inventario.FPub_MantenimientoMarcas("2", codigo.Text, "", "");

                if (int.Parse(res) < 1)
                {
                    Notificacion("2", "NO SE PUEDE ELIMINAR UNA MARCA QUE TIENE PRODUCTOS ASOCIADOS");
                    return;
                }


                Notificacion("1", "MARCA ELIMINADA SATISFACTORIAMENTE");

                MostrarMarcas();
            }catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}