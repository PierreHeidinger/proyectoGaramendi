 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using bibliotecaClases;
using System.Data.SqlClient;

namespace appIntranetCIA.web
{
    public partial class cliente_detalle : System.Web.UI.Page
    {

        #region "DECLARACIONES"

        claseClientes obj_Clientes = new claseClientes();
        claseUtilitarios obj_Utils = new claseUtilitarios();

        DataTable oDT_Datos;

        #endregion

        #region "PROCEDIMIENTOS"


        private void Setear_Distritos(String v_Distrito)
        {
            try { 
                    DataTable oDT_Distritos;
                    

                    //DISTRITOS
                    oDT_Distritos = obj_Utils.FPub_ListarDistritos(v_Distrito);
                    cbo_Distrito.DataSource = oDT_Distritos;
                    cbo_Distrito.DataValueField = "ID_DISTRITO";
                    cbo_Distrito.DataTextField = "DISTRITO";
                    cbo_Distrito.DataBind();         

                   
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void setear_Provincias(String v_Departamento)
        {
            try { 
                DataTable oDT_Provincias;
                //PROVINCIA
                oDT_Provincias = obj_Utils.FPub_ListarProvincias(v_Departamento);
                cbo_Provincia.DataSource = oDT_Provincias;
                cbo_Provincia.DataValueField = "ID_PROVINCIA";
                cbo_Provincia.DataTextField = "PROVINCIA";
                cbo_Provincia.DataBind();
            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void setear_Departamentos(String v_Departamento)
        {
            DataTable oDT_Departamentos;
            //DEPARTAMENTOS
            oDT_Departamentos = obj_Utils.FPub_ListarDepartamentos("");
            cbo_Departamento.DataSource = oDT_Departamentos;
            cbo_Departamento.DataValueField = "ID_DEPARTAMENTO";
            cbo_Departamento.DataTextField = "DEPARTAMENTO";
            cbo_Departamento.DataBind();
        }

        private void setear_Historico(String v_CODIGO)
        {
            oDT_Datos = obj_Clientes.FPub_MostrarHistorioCliente(v_CODIGO);
            dg_Historico_clientes.DataSource = oDT_Datos;
            dg_Historico_clientes.DataBind();
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

        private void Estado_Controles(bool _estado)
        {
            cbo_TipoDocumento.Enabled = _estado;
            txt_NumDocumento.Enabled = _estado;
            txt_Nombres.Enabled = _estado;
            txt_Apellido.Enabled = _estado;
            txt_RazonSocial.Enabled = _estado;
            txt_Direccion.Enabled = _estado;
            cbo_Departamento.Enabled = _estado;
            cbo_Provincia.Enabled = _estado;
            cbo_Distrito.Enabled = _estado;
            txt_Celular.Enabled = _estado;
            txt_Telefono.Enabled = _estado;
            lt_Notificacion.Text = "";


            btn_Detalle.Enabled = !_estado;
            btn_Editar.Enabled = !_estado;
            btn_Estado.Enabled = !_estado;


            btn_Cancelar.Enabled = _estado;
            btn_Guardar.Enabled = _estado;





        }

        private void MostrarDetalle_Cliente(String v_Codigo)
        {
            oDT_Datos = obj_Clientes.FPub_MostrarDetalle_Cliente(v_Codigo);

            if(oDT_Datos.Rows.Count > 0)
            {

                if(oDT_Datos.Rows[0]["COD_CLIENTE"] != null)
                {
                    txt_Codigo.Text = oDT_Datos.Rows[0]["COD_CLIENTE"].ToString();
                }
                if(oDT_Datos.Rows[0]["TIPO_DOC"] != null)
                {
                    cbo_TipoDocumento.SelectedValue = oDT_Datos.Rows[0]["TIPO_DOC"].ToString();

                    if(oDT_Datos.Rows[0]["TIPO_DOC"].ToString() == "1")
                    {
                        CamposDocumentos(1);
                        if(oDT_Datos.Rows[0]["NOM_CLIENTE"] != null)
                        {
                            txt_Nombres.Text = oDT_Datos.Rows[0]["NOM_CLIENTE"].ToString();
                        }
                        if (oDT_Datos.Rows[0]["APE_CLIENTE"] != null)
                        {
                            txt_Apellido.Text = oDT_Datos.Rows[0]["APE_CLIENTE"].ToString();
                        }
                    }
                    else
                    {
                        CamposDocumentos(2);

                        if (oDT_Datos.Rows[0]["RAZ_CLIENTE"] != null)
                        {
                            txt_RazonSocial.Text = oDT_Datos.Rows[0]["RAZ_CLIENTE"].ToString();
                        }
                    }
                }
                if (oDT_Datos.Rows[0]["DNI_RUC_CLI"] != null)
                {
                    txt_NumDocumento.Text = oDT_Datos.Rows[0]["DNI_RUC_CLI"].ToString();
                }
                if (oDT_Datos.Rows[0]["DIRECCION_CLIENTE"] != null)
                {
                    txt_Direccion.Text = oDT_Datos.Rows[0]["DIRECCION_CLIENTE"].ToString();
                }
                if (oDT_Datos.Rows[0]["COD_DEPARTAMENTO"] != null)
                {
                    cbo_Departamento.SelectedValue = oDT_Datos.Rows[0]["COD_DEPARTAMENTO"].ToString();
                }
                if (oDT_Datos.Rows[0]["COD_PROVINCIA"] != null)
                {
                    cbo_Provincia.SelectedValue = oDT_Datos.Rows[0]["COD_PROVINCIA"].ToString();
                }
                if (oDT_Datos.Rows[0]["COD_DISTRITO"] != null)
                {
                    cbo_Distrito.SelectedValue = oDT_Datos.Rows[0]["COD_DISTRITO"].ToString();
                }
                if (oDT_Datos.Rows[0]["ESTADO_CLIENTE"] != null)
                {
                    cbo_Estado.SelectedValue = oDT_Datos.Rows[0]["ESTADO_CLIENTE"].ToString();
                }
                if (oDT_Datos.Rows[0]["FECHA"] != null)
                {
                    lbl_FechaRegistro.Text = oDT_Datos.Rows[0]["FECHA"].ToString();
                }
                if (oDT_Datos.Rows[0]["TELEFONO"] != null)
                {
                    txt_Telefono.Text = oDT_Datos.Rows[0]["TELEFONO"].ToString();
                }
                if (oDT_Datos.Rows[0]["CELULAR"] != null)
                {
                    txt_Celular.Text = oDT_Datos.Rows[0]["CELULAR"].ToString();
                }


                txt_CodigoHistorico.Text = txt_Codigo.Text;
                cbo_EstadoCambio.SelectedValue = cbo_Estado.SelectedValue;
            }
        }

        private void CamposDocumentos(int v_Value)
        {
            if(v_Value == 0)
            {
                lbl_nombre_nat.Visible = false;
                txt_Nombres.Visible = false;
                lbl_apellido_nat.Visible = false;
                txt_Apellido.Visible = false;

                lbl_razon_social.Visible = false;
                txt_RazonSocial.Visible = false;

                txt_Nombres.Text = "";
                txt_Apellido.Text = "";
                txt_RazonSocial.Text = "";
            }else if(v_Value == 1)
            {
                lbl_nombre_nat.Visible = true;
                txt_Nombres.Visible = true;
                lbl_apellido_nat.Visible = true;
                txt_Apellido.Visible = true;

                lbl_razon_social.Visible = false;
                txt_RazonSocial.Visible = false;

                txt_Nombres.Text = "";
                txt_Apellido.Text = "";
                txt_RazonSocial.Text = "";
            }else if(v_Value == 2)
            {
                lbl_nombre_nat.Visible = false;
                txt_Nombres.Visible = false;
                lbl_apellido_nat.Visible = false;
                txt_Apellido.Visible = false;

                lbl_razon_social.Visible = true;
                txt_RazonSocial.Visible = true;

                txt_Nombres.Text = "";
                txt_Apellido.Text = "";
                txt_RazonSocial.Text = "";
            }
        }

        private void MostrarPaneles(int v_Value)
        {
            switch (v_Value) { 
                case 1:
                     pnDatos.Visible = true;
                     pnEstado.Visible = false;

                    btn_Detalle.Enabled = false;
                    btn_Estado.Enabled = true;
                    btn_Editar.Enabled = true;

                    lt_Notificacion.Text = "";
                     break;
                case 2:
                    pnDatos.Visible = false;
                    pnEstado.Visible = true;

                    btn_Detalle.Enabled = true;
                    btn_Estado.Enabled = false;
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
                    Setear_Distritos("");
                    setear_Provincias("");
                    setear_Departamentos("");

                    if(Request.QueryString["cod_cliente"] != null)
                    {
                        
                        MostrarDetalle_Cliente(Request.QueryString["cod_cliente"]);
                        setear_Historico(Request.QueryString["cod_cliente"]);
                        
                        Estado_Controles(false);
                                             
                        MostrarPaneles(1);

                        if (Request.QueryString["nuevo"] != null)
                        {
                            Notificacion("1", "El cliente a sido creado satisfactoriamente");
                            return;
                        }
                    }
                    else
                    {
                        Estado_Controles(true);
                       
                    }
                    

                }
                catch(Exception ex)
                {
                    throw ex;
                }

            }
        }

        protected void cbo_Departamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            setear_Provincias(cbo_Departamento.SelectedValue);
        }

        protected void cbo_Provincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            Setear_Distritos(cbo_Provincia.SelectedValue);
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                if(cbo_TipoDocumento.SelectedIndex == 0)
                {
                    Notificacion("2", "Debe seleccionar un tipo de Documento");
                    return;
                }
                if(txt_NumDocumento.Text == "")
                {
                    Notificacion("2", "Ingrese el numero del Documento que selecciono");
                    return;
                }
                if(cbo_TipoDocumento.SelectedIndex == 1)
                {
                    if(txt_NumDocumento.Text.Length != 8)
                    {
                        Notificacion("2", "El DNI debe constar de 8 digitos");
                        return;
                    }
                    if(txt_Nombres.Text == "") {
                        Notificacion("2", "Ingrese el Nombre del Cliente");
                        return;
                    }
                    if (txt_Apellido.Text == "")
                    {
                        Notificacion("2", "Ingrese el Apellido del Cliente");
                        return;
                    }
                }
                if (cbo_TipoDocumento.SelectedIndex == 2)
                {
                    if (txt_NumDocumento.Text.Length != 11)
                    {
                        Notificacion("2", "El RUC debe constar de 11 digitos");
                        return;
                    }
                    if (txt_RazonSocial.Text == "")
                    {
                        Notificacion("2", "Ingrese la Razon social del Cliente");
                        return;
                    }
                }
                if(cbo_Departamento.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione el Departamento");
                    return;
                }
                if (cbo_Provincia.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione la Provincia");
                    return;
                }

                if (cbo_Distrito.SelectedIndex == 0)
                {
                    Notificacion("2", "Seleccione el Distrito");
                    return;
                }

                if(Request.QueryString["cod_cliente"] != null) {

                    String codigo = obj_Clientes.FPub_MantenimientoClientes("2", txt_Codigo.Text, txt_Nombres.Text.ToUpper(), txt_Apellido.Text.ToUpper(), txt_RazonSocial.Text.ToUpper(), cbo_TipoDocumento.SelectedValue,
                                                                        txt_NumDocumento.Text, txt_Direccion.Text.ToUpper(), txt_Telefono.Text, txt_Celular.Text, cbo_Distrito.SelectedValue, cbo_Provincia.SelectedValue,
                                                                        cbo_Departamento.SelectedValue, "0", cbo_Estado.SelectedValue, txt_Comentario.Text ,"           ");
                    MostrarDetalle_Cliente(codigo);
                    setear_Historico(codigo);
                    Estado_Controles(false);
                    Notificacion("1", "Los Datos Fueron actualizados");

                }
                else
                {
                    String codigo = obj_Clientes.FPub_MantenimientoClientes("1", txt_Codigo.Text, txt_Nombres.Text.ToUpper(), txt_Apellido.Text.ToUpper(), txt_RazonSocial.Text.ToUpper(), cbo_TipoDocumento.SelectedValue,
                                                                        txt_NumDocumento.Text, txt_Direccion.Text.ToUpper(), txt_Telefono.Text, txt_Celular.Text, cbo_Distrito.SelectedValue, cbo_Provincia.SelectedValue,
                                                                        cbo_Departamento.SelectedValue, "0", cbo_Estado.SelectedValue,txt_Comentario.Text, "           ");
                    Response.Redirect("cliente_detalle.aspx?cod_cliente=" + codigo + "&nuevo=1");
                }
                


            }
            catch ( SqlException ex)
            {

                Notificacion("2", "YA EXISTE UN CLIENTE CON EL DOCUMENTO QUE ESTA INGRESANDO");
            }
            catch ( Exception ex)
            {
                throw ex;
            }
        }

        protected void cbo_TipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbo_TipoDocumento.SelectedIndex == 0)
            {
                CamposDocumentos(0);
            }
            else if(cbo_TipoDocumento.SelectedIndex == 1)
            {
                CamposDocumentos(1);
            }
            else if(cbo_TipoDocumento.SelectedIndex == 2)
            {
                CamposDocumentos(2);
            }
        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            Estado_Controles(true);
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            try { 
                if(Request.QueryString["cod_cliente"] != null)
                {
                    MostrarDetalle_Cliente(Request.QueryString["cod_cliente"].ToString());
                    Estado_Controles(false);
                    MostrarPaneles(1);
                    return;
                }
                Response.Redirect("clientes.aspx");
            }catch(Exception ex)
            {
                Notificacion("2", ex.Message);
            }
        }

        protected void btn_Estado_Click(object sender, EventArgs e)
        {
            MostrarPaneles(2);
        }

        protected void btn_Detalle_Click(object sender, EventArgs e)
        {
            MostrarPaneles(1);
        }

        protected void btn_CambioEstado_Click(object sender, EventArgs e)
        {
            try
            {

                if(cbo_Estado.SelectedValue == "1")
                {
                   if( cbo_EstadoCambio.SelectedValue == "1")
                    {
                        Notificacion("2", "NO PUEDE ACTUALIZAR A UN ESTADO PASADO");
                        return;
                    }
                }
                if (cbo_Estado.SelectedValue == "2")
                {
                    if (cbo_EstadoCambio.SelectedValue == "2")
                    {
                        Notificacion("2", "NO PUEDE ACTUALIZAR A UN ESTADO PASADO");
                        return;
                    }
                }

                if(txt_Comentario.Text == "")
                {
                    Notificacion("2", "INGRESE UN COMENTARIO");
                    return;
                }


                String codigo = obj_Clientes.FPub_MantenimientoClientes("3", txt_Codigo.Text, txt_Nombres.Text, txt_Apellido.Text, txt_RazonSocial.Text, cbo_TipoDocumento.SelectedValue,
                                                                        txt_NumDocumento.Text, txt_Direccion.Text, txt_Telefono.Text, txt_Celular.Text, cbo_Distrito.SelectedValue, cbo_Provincia.SelectedValue,
                                                                        cbo_Departamento.SelectedValue, "0", cbo_EstadoCambio.SelectedValue, txt_Comentario.Text, "           ");
                MostrarDetalle_Cliente(codigo);
                setear_Historico(codigo);
                Notificacion("1", "EL CAMBIO DE ESTADO FUE SATISFACTORIO");
                txt_Comentario.Text = "";
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }


    }
}