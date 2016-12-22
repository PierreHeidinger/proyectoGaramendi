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
    public partial class inventario_detalle : System.Web.UI.Page
    {


        #region "Declaraciones"

        claseInventario obj_inventario = new claseInventario();
        DataTable oDt_Datos;

        #endregion

        #region "Procedimientos"


        private void seterCategorias()
        {
            oDt_Datos = obj_inventario.FPub_MostrarCategorias();

            DataRow row = oDt_Datos.NewRow();
            row["COD_CATEGORIA"] = "0";
            row["DESCRIPCION"] = "--SELECCIONE--";
            oDt_Datos.Rows.InsertAt(row, 0);

            cbo_Categoria.DataSource = oDt_Datos;
            cbo_Categoria.DataValueField = "COD_CATEGORIA";
            cbo_Categoria.DataTextField = "DESCRIPCION";
            cbo_Categoria.DataBind();

        }

        private void setearMarcas()
        {
            oDt_Datos = obj_inventario.FPub_MostrarMarcas();

            DataRow row = oDt_Datos.NewRow();
            row["COD_MARCA"] = "0";
            row["SIGLA_X"] = "--SELECCIONE--";
            oDt_Datos.Rows.InsertAt(row, 0);

            cbo_Marca.DataSource = oDt_Datos;
            cbo_Marca.DataValueField = "COD_MARCA";
            cbo_Marca.DataTextField = "SIGLA_X";
            cbo_Marca.DataBind();
        }

        private void setearSubCategorias(String v_CATEGORIA)
        {
            oDt_Datos = obj_inventario.FPub_MostrarSubCategorias(v_CATEGORIA);

            DataRow row = oDt_Datos.NewRow();
            row["COD_SUBCATEGORIA"] = "0";
            row["DESCRIPCION"] = "--SELECCIONE--";
            oDt_Datos.Rows.InsertAt(row, 0);

            cbo_SubCategoria.DataSource = oDt_Datos;
            cbo_SubCategoria.DataValueField = "COD_SUBCATEGORIA";
            cbo_SubCategoria.DataTextField = "DESCRIPCION";
            cbo_SubCategoria.DataBind();
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

        private void MostrarDatos_Producto(String v_CODIGO)
        {
            oDt_Datos = obj_inventario.FPub_MostrarDetalle_Producto(v_CODIGO);

            if(oDt_Datos.Rows.Count > 0)
            {
                if(oDt_Datos.Rows[0]["COD_PRODUCTO"] != null)
                {
                    txt_Codigo.Text = oDt_Datos.Rows[0]["COD_PRODUCTO"].ToString();
                }
                if(oDt_Datos.Rows[0]["COD_CATEGORIA"] != null)
                {
                    cbo_Categoria.SelectedValue = oDt_Datos.Rows[0]["COD_CATEGORIA"].ToString();
                }
                if(oDt_Datos.Rows[0]["COD_SUBCATEGORIA"] != null)
                {
                    cbo_SubCategoria.SelectedValue = oDt_Datos.Rows[0]["COD_SUBCATEGORIA"].ToString();
                }
                if (oDt_Datos.Rows[0]["DESCRIPCION"] != null)
                {
                    txt_Descripcion.Text = oDt_Datos.Rows[0]["DESCRIPCION"].ToString();
                }
                if (oDt_Datos.Rows[0]["COD_MARCA"] != null)
                {
                    cbo_Marca.SelectedValue = oDt_Datos.Rows[0]["COD_MARCA"].ToString();
                }
                if (oDt_Datos.Rows[0]["PESO_KG"] != null)
                {
                    txt_Peso.Text = oDt_Datos.Rows[0]["PESO_KG"].ToString().Replace(",",".");
                }
                if (oDt_Datos.Rows[0]["PESO_KG"] != null)
                {
                    txt_Peso.Text = oDt_Datos.Rows[0]["PESO_KG"].ToString();
                }
                if (oDt_Datos.Rows[0]["FECHA_REG"] != null)
                {
                    lbl_FechaRegistro.Text = oDt_Datos.Rows[0]["FECHA_REG"].ToString();
                }
                if (oDt_Datos.Rows[0]["COD_ESTADO"] != null)
                {
                    cbo_Estado.SelectedValue = oDt_Datos.Rows[0]["COD_ESTADO"].ToString();
                }


                
            }
        }

        private void estado_controles(bool _flat)
        {

            cbo_Categoria.Enabled = _flat;
            cbo_SubCategoria.Enabled = _flat;
            cbo_Marca.Enabled = _flat;
            txt_Descripcion.Enabled = _flat;
            txt_Peso.Enabled = _flat;
            cbo_Estado.Enabled = _flat;


            btn_Inventario.Enabled = !_flat;
            btn_Detalle.Enabled = !_flat;
            btn_Editar.Enabled = !_flat;
            btn_Almacen.Enabled = !_flat;


            btn_Guardar.Enabled = _flat;
            btn_Cancelar.Enabled = _flat;


            lt_Notificacion.Text = "";

        }


        private void mostrar_panel(int v_case)
        {
            switch (v_case)
            {
                case 1:
                    pnDatos.Visible = true;
                    pnAlmancen.Visible = false;

                    btn_Detalle.Enabled = false;
                    btn_Almacen.Enabled = true;


                    btn_Editar.Enabled = true;

                    lt_Notificacion.Text = "";
                    break;
                case 2:
                    pnDatos.Visible = false;
                    pnAlmancen.Visible = true;

                    btn_Detalle.Enabled = true;
                    btn_Almacen.Enabled = false;

                    btn_Editar.Enabled = false;
                    lt_Notificacion.Text = "";
                    break;
            }
        }


        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try { 

                     seterCategorias();
                     setearSubCategorias("%");
                     setearMarcas();

                        if(Request.QueryString["cod_producto"] != null)
                        {
                          MostrarDatos_Producto(Request.QueryString["cod_producto"]);
                        estado_controles(false);
                        mostrar_panel(1);
                         
                        if (Request.QueryString["n"] != null)
                                {
                            Notificacion("1", "Nuevo producto agregado");
                                }
                        }
                        else
                    {
                        mostrar_panel(1);
                        estado_controles(true);
                            cbo_Marca.Enabled = false;
                           
                          }
                    

                }catch(Exception ex)
                {
                    throw ex;
                }


            }
        }

        protected void cbo_Categoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                setearSubCategorias(cbo_Categoria.SelectedValue);

            }catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                if(cbo_Categoria.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione la categoria");
                    return;
                }

                if(cbo_SubCategoria.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione la Sub-categoria");
                    return;
                }
                if(cbo_Marca.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione la marca");
                    return;
                }

                if(txt_Descripcion.Text == "")
                {
                    Notificacion("2", "Ingrese una descripcion para el producto");
                    return;
                }

                if(Request.QueryString["cod_producto"] != null)
                {
                    String codigo = obj_inventario.FPub_MantenimientoInventario("2", txt_Codigo.Text, cbo_Categoria.SelectedValue, cbo_SubCategoria.SelectedValue, cbo_Marca.SelectedValue,
                                                                             txt_Descripcion.Text.ToUpper(), float.Parse(txt_Peso.Text), cbo_Estado.SelectedValue, "          ");
                    MostrarDatos_Producto(codigo);
                    estado_controles(false);
                    mostrar_panel(1);
                    Notificacion("1", "Datos del producto actualizados");
                    

                }
                else{
                    String codigo = obj_inventario.FPub_MantenimientoInventario("1", txt_Codigo.Text, cbo_Categoria.SelectedValue, cbo_SubCategoria.SelectedValue, cbo_Marca.SelectedValue,
                                                                             txt_Descripcion.Text.ToUpper(), float.Parse(txt_Peso.Text), cbo_Estado.SelectedValue, "          ");
                    Response.Redirect("inventario_detalle.aspx?cod_producto=" + codigo + "&n=1");
                }

                

            }catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            estado_controles(true);
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            if(Request.QueryString["cod_producto"] != null)
            {
                MostrarDatos_Producto(txt_Codigo.Text);
                estado_controles(false);
            }
            else
            {
                Response.Redirect("inventario.aspx");
            }
           
        }

        protected void btn_Inventario_Click(object sender, EventArgs e)
        {
            Response.Redirect("inventario.aspx");
        }

        protected void btn_Almacen_Click(object sender, EventArgs e)
        {
            mostrar_panel(2);
        }

        protected void btn_Detalle_Click(object sender, EventArgs e)
        {
            mostrar_panel(1);
        }
    }
}