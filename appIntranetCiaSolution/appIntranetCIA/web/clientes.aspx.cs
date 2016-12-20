using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using bibliotecaClases;
using System.IO;

namespace appIntranetCIA.web
{
    public partial class clientes : System.Web.UI.Page
    {
        #region "DECLARACIONES"

        claseClientes obj_Clientes = new claseClientes();
        DataTable oDT_Datos;

        #endregion


        #region "PROCEDIMIENTOS"






        public void FPub_ListarClientes(String CLIENTE, String Codigo ,String DOCUMENTO)
        {
            try {

                if (!String.IsNullOrEmpty(CLIENTE) || !String.IsNullOrEmpty(Codigo) || !string.IsNullOrEmpty(DOCUMENTO)) {


                    if (!String.IsNullOrEmpty(Codigo)) { 
                        if (Codigo.Length != 4)
                            {
                                Notificacion("2","EL CODIGO DEBE CONTENER 4 DIGITOS");
                                return;
                            }
                    }
                    if (!String.IsNullOrEmpty(DOCUMENTO))
                    {
                        if (DOCUMENTO.Length != 8 && DOCUMENTO.Length != 11 )
                        {
                            Notificacion("2", "EL DOCUMENTO DEBE CONTENER 8 DIGITOS SI ES UN DNI O 11 SI RUC");
                            return;
                        }                        
                    }


                    oDT_Datos = obj_Clientes.FPub_ListarClientes(txt_Codigo.Text.Trim(), txt_Documento.Text.Trim(), txt_Descripcion.Text.Trim(), cbo_TipoDocumento.SelectedValue, cbo_Estado.SelectedValue);
                    DG_CLIENTES.DataSource = oDT_Datos;
                    DG_CLIENTES.DataBind();

                    lt_Notificacion.Text = "";
                    return;
                }

                DG_CLIENTES.DataSource = null;
                DG_CLIENTES.DataBind();
                lt_Notificacion.Text = "";

            }
            catch(Exception ex)
            {
                throw ex;
            }

        }




        private void colores_filas()
        {
            try { 
            Label estado = new Label();

            for (int i = 0; i < DG_CLIENTES.Items.Count; i++)
            {
                estado = (Label)DG_CLIENTES.Items[i].FindControl("lbl_estado");

                if (estado.Text == "ACTIVO")
                {
                    DG_CLIENTES.Items[i].Cells[5].BackColor = System.Drawing.Color.MediumSeaGreen;
                }
                else if (estado.Text == "INACTIVO")
                {
                    DG_CLIENTES.Items[i].Cells[5].BackColor = System.Drawing.Color.RosyBrown;
                }
                

               


            }
            }catch(Exception EX)
            {
                throw EX;
            }
        }



        private void Notificacion(String v_estado , String mensaje)
        {
            try
            {
                if(v_estado == "1")
                {
                    lt_Notificacion.Text = "<div class='alert alert-success'>" +
                                           "<span><b> Bien! - </b>" + mensaje +"</span>" +
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
               
                FPub_ListarClientes(txt_Descripcion.Text.Trim(),txt_Codigo.Text.Trim(),txt_Documento.Text.Trim());
            }

        }

        protected void DG_CLIENTES_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            colores_filas();
        }

        protected void txt_Descripcion_TextChanged(object sender, EventArgs e)
        {
            FPub_ListarClientes(txt_Descripcion.Text.Trim(),txt_Codigo.Text.Trim(), txt_Documento.Text.Trim());
        }

        protected void txt_Codigo_TextChanged(object sender, EventArgs e)
        {
            FPub_ListarClientes(txt_Descripcion.Text.Trim(), txt_Codigo.Text.Trim(), txt_Documento.Text.Trim());
        }

        protected void txt_Documento_TextChanged(object sender, EventArgs e)
        {
            FPub_ListarClientes(txt_Descripcion.Text.Trim(), txt_Codigo.Text.Trim(), txt_Documento.Text.Trim());
        }

        protected void cbo_TipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {
            FPub_ListarClientes(txt_Descripcion.Text.Trim(), txt_Codigo.Text.Trim(), txt_Documento.Text.Trim());
        }

        protected void cbo_Estado_SelectedIndexChanged(object sender, EventArgs e)
        {
            FPub_ListarClientes(txt_Descripcion.Text.Trim(), txt_Codigo.Text.Trim(), txt_Documento.Text.Trim());
        }

        protected void btn_ExportarExcel_Click(object sender, EventArgs e)
        {
            try
            {

                if (DG_CLIENTES.Items.Count > 0)
                {

                    StringWriter stringWriter = new StringWriter();
                    HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
                    DG_CLIENTES.RenderControl(htmlWriter);

                    Response.Buffer = true;
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment; filename= " + "Exportado desde GARAMENDI SAC  -" + DateTime.Now.ToString("dd/MM/yyyy") + ".xls");
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    Response.Charset = "";

                    Response.Write(stringWriter.ToString());
                    Response.End();


                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_Nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("cliente_detalle.aspx");
        }
    }
}