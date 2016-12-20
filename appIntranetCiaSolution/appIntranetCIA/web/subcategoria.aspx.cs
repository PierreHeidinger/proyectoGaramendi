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
    public partial class subcategoria : System.Web.UI.Page
    {

        #region "Declaracion"

        claseInventario obj_Inventario = new claseInventario();
        DataTable oDT_Datos;
        #endregion

        #region "Procedimientos"
            
        private void setearCategorias()
        {
            try { 
                oDT_Datos = obj_Inventario.FPub_MostrarCategorias();

                DataRow row = oDT_Datos.NewRow();
                row["COD_CATEGORIA"] = "0";
                row["DESCRIPCION"] = "--SELECCIONE--";
                oDT_Datos.Rows.InsertAt(row, 0);

                cbo_Categoria.DataSource = oDT_Datos;
                cbo_Categoria.DataValueField = "COD_CATEGORIA";
                cbo_Categoria.DataTextField = "DESCRIPCION";
                cbo_Categoria.DataBind();

            }catch(Exception ex)
            {
                throw ex;
            }
        }

        private void mostrarSubCategorias()
        {
            try { 
                oDT_Datos = obj_Inventario.FPub_MostrarSubCategorias("%");
                dg_SubCategorias.DataSource = oDT_Datos;
                dg_SubCategorias.DataBind();
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
                setearCategorias();
                mostrarSubCategorias();
            }
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            try
            {

                if(cbo_Categoria.SelectedIndex == 0)
                {
                    Notificacion("2", "SELECCIONE LA CATEGORIA A LA QUE ESTARA SELECCIONADA");
                    return;
                }

                if(txt_Descripcion.Text == "")
                {
                    Notificacion("2", "INGRESE LA DESCRIPCION");
                    return;
                }

                obj_Inventario.FPub_MantenimientoSubCategoria("1", "", cbo_Categoria.Text, txt_Descripcion.Text.ToUpper());
                Notificacion("1", "SUB CATEGORIA AGREGADA");
                mostrarSubCategorias();
                cbo_Categoria.SelectedIndex = 0;
                txt_Descripcion.Text= "";

            }catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btn_Inventario_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventario.aspx");
        }

        protected void dg_SubCategorias_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                TextBox codigo = (TextBox)dg_SubCategorias.Items[e.Item.ItemIndex].FindControl("cod_subCategoria_delete");

                obj_Inventario.FPub_MantenimientoSubCategoria("2", codigo.Text, "", "");
                Notificacion("1", "SUB CATEGORIA ELIMINADA CON EXITO");
                mostrarSubCategorias();

            }catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void dg_SubCategorias_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_SubCategorias.CurrentPageIndex = e.NewPageIndex;
            mostrarSubCategorias();
        }
    }
}