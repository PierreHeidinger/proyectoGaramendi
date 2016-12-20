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
    public partial class categoria : System.Web.UI.Page
    {

        #region "Declaraciones"

        claseInventario obj_inventario = new claseInventario();
        DataTable oDT_Datos;


        #endregion

        #region "Procedimientos"


        private void MostrarCategorias()
        {
            try { 

                oDT_Datos = obj_inventario.FPub_MostrarCategorias();
                dg_Categorias.DataSource = oDT_Datos;
                dg_Categorias.DataBind();

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
                MostrarCategorias();
            }
                
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txt_Categoria.Text == "")
                {
                    Notificacion("2", "DEBE INGRESAR LA DESCRIPCION");
                    return;
                }

                obj_inventario.FPub_MantenimientoCategoria("1", "", txt_Categoria.Text.ToUpper());

                Notificacion("1", "CATEGORIA AGREGADA");
                MostrarCategorias();
                txt_Categoria.Text = "";
                
            }catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btn_Inventario_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventario.aspx");
        }

        protected void dg_Categorias_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try { 

                 TextBox codigo = (TextBox)dg_Categorias.Items[e.Item.ItemIndex].FindControl("txt_Codigo_dg");
                 String res  = obj_inventario.FPub_MantenimientoCategoria("2", codigo.Text, "");
                 if(int.Parse(res) < 1)
                    {
                        Notificacion("2", "NO SE PUEDE ELIMINAR UNA CATEGORIA QUE TIENE SUB-CATEGORIAS ASOCIADAS");
                        return;
                    }
                 Notificacion("1", "CATEGORIA ELIMINADA");
                 MostrarCategorias();

            }catch(Exception ex)
            {
                throw ex;
            }


        }
    }
}