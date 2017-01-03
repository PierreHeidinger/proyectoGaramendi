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
    public partial class ventas : System.Web.UI.Page
    {


        #region "Declaraciones"
        claseVentas obj_ventas = new claseVentas();
        DataTable oDt_Datos;


        #endregion

        #region "Procedimientos


        private void ListarVentas()
        {
            oDt_Datos = obj_ventas.FPub_ListadoVentasCab(txt_Cliente.Text,txt_Producto.Text,DateTime.Parse(txt_Fecha1.Text), DateTime.Parse(txt_Fecha2.Text).AddDays(1));
            dg_ventas.DataSource = oDt_Datos;
            dg_ventas.DataBind();
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
                
                    
                txt_Fecha1.Text = DateTime.Now.AddMonths(-1).ToShortDateString(); ;
                txt_Fecha2.Text = DateTime.Now.ToShortDateString();

                try
                {
                    ListarVentas();

                }
                catch ( Exception ex  )
                {
                    Notificacion("2", ex.Message);
                }


            }
        }

        protected void btn_Nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ventas_detalle.aspx");
        }

        protected void dg_ventas_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_ventas.CurrentPageIndex = e.NewPageIndex;
            ListarVentas();
        }

        protected void txt_Cliente_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ListarVentas();

            }catch(Exception ex)
            {
                Notificacion("2", ex.Message);
            }
        }

        protected void btn_ExportarExcel_Click(object sender, EventArgs e)
        {
            try
            {

                if (dg_ventas.Items.Count > 0)
                {

                    StringWriter stringWriter = new StringWriter();
                    HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
                    dg_ventas.RenderControl(htmlWriter);

                    Response.Buffer = true;
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment; filename= " + "Export to Sicnet Ventas -" + DateTime.Now.ToString("dd/MM/yyyy") + ".xls");
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    Response.Charset = "";

                    Response.Write(stringWriter.ToString());
                    Response.End();


                }

            }
            catch (Exception ex)
            {
                Notificacion("2", ex.Message);

            }
        }
    }
}