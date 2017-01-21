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
    public partial class index : System.Web.UI.Page
    {

        #region "Declaraciones"

        claseUtilitarios utilitarios = new claseUtilitarios();
        public DataTable oDT_Datos;
        public double enero;
        public double febrero;
        public double marzo;
        public double abril;
        public double mayo;
        public double junio;
        public double julio;
        public double agosto;
        public double setiembre;
        public double octubre;
        public double noviembre;
        public double diciembre;


        #endregion


        #region "Procedimientos"


        void Mostrar_Reporte_n1()
        {
            oDT_Datos = utilitarios.FPub_Reporte_X_MESES_Ventas();

            enero = (double)oDT_Datos.Rows[0]["ENERO"];
            febrero = (double)oDT_Datos.Rows[0]["FEBRERO"];
            marzo  = (double)oDT_Datos.Rows[0]["MARZO"];
            abril = (double)oDT_Datos.Rows[0]["ABRIL"];
            mayo = (double)oDT_Datos.Rows[0]["MAYO"];    
            junio = (double)oDT_Datos.Rows[0]["JUNIO"];
            julio = (double)oDT_Datos.Rows[0]["JULIO"];   
            agosto = (double)oDT_Datos.Rows[0]["AGOSTO"];
            setiembre = (double)oDT_Datos.Rows[0]["SETIEMBRE"];
            octubre = (double)oDT_Datos.Rows[0]["OCTUBRE"];
            noviembre = (double)oDT_Datos.Rows[0]["NOVIEMBRE"];
            diciembre = (double)oDT_Datos.Rows[0]["DICIEMBRE"];

        }


        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try {
                    Mostrar_Reporte_n1();
                }
                catch(Exception ex)
                {
                    throw ex;
                }
            }
        }






    }
}