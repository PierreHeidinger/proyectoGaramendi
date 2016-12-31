using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace bibliotecaClases
{
    public class claseVentas
    {


        Conexion cn = new Conexion();

       
        #region "LISTAR VENTAS"

        public DataTable FPub_ListadoVentasCab(String v_CLIENTE, String v_PRODUCTO, DateTime v_FECHA1, DateTime v_FECHA2)
        {
            return FPriv_ListadoVentasCab(v_CLIENTE, v_PRODUCTO, v_FECHA1, v_FECHA2);
        }

        private DataTable FPriv_ListadoVentasCab(String v_CLIENTE, String v_PRODUCTO, DateTime v_FECHA1, DateTime v_FECHA2)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_VENTAS_LISTAR_CAB", cn.getCn);
            cmd.Parameters.AddWithValue("@CLIENTE", v_CLIENTE);
            cmd.Parameters.AddWithValue("@PRODUCTO", v_PRODUCTO);
            cmd.Parameters.AddWithValue("@FEC1", v_FECHA1);
            cmd.Parameters.AddWithValue("@FEC2", v_FECHA2);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "Busqueda Clientes"

        public DataTable FPub_ListarClientes(String v_CLIENTE)
        {
            return FPriv_ListarClientes(v_CLIENTE);
        }


        private DataTable FPriv_ListarClientes(String v_CLIENTE)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_VENTAS_BUSCAR_CLIENTE", cn.getCn);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_CLIENTE);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cn.getCn.Close();
            return dt;

        }

        #endregion

        #region "Busqueda PRODUCTOS-ALMACEN"

        public DataTable FPub_ListarProductosAlmacen(String v_Producto)
        {
            return FPriv_ListarProductosAlmacen(v_Producto);
        }

        private DataTable FPriv_ListarProductosAlmacen(String v_Producto)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_VENTAS_LISTAR_ALMACEN", cn.getCn);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_Producto);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "PRODUCTOS-VENTA"

        public DataTable FPub_ListarProductosVenta(String v_Productos)
        {
            return FPriv_ListarProductosVenta(v_Productos);
        }

        private DataTable FPriv_ListarProductosVenta(String v_Productos)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_VENTAS_CARRITO_COMPRAS", cn.getCn);
            cmd.Parameters.AddWithValue("@PRODUCTOS", v_Productos);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "Mantenimiento ventas"


        public String FPub_MantenimientoVentas(String v_IND, String v_CODIGO, String v_CLIENTE, int v_CANTIDAD, decimal v_TOTAL_COMPRA, decimal v_TOTAL_UTILIDAD
                                                    , decimal v_TOTAL_VENTA, decimal v_IGV,String v_ESTADO, String v_CODIGO_X)
        {
            return FPriv_MantenimientoVentas( v_IND,  v_CODIGO,  v_CLIENTE,  v_CANTIDAD,  v_TOTAL_COMPRA,  v_TOTAL_UTILIDAD
                                                    ,  v_TOTAL_VENTA, v_IGV, v_ESTADO,  v_CODIGO_X);
        }



        private String FPriv_MantenimientoVentas(String v_IND, String v_CODIGO, String v_CLIENTE, int v_CANTIDAD, decimal v_TOTAL_COMPRA, decimal v_TOTAL_UTILIDAD
                                                    , decimal v_TOTAL_VENTA, decimal v_IGV, String v_ESTADO, String v_CODIGO_X)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_VENTAS_MANT", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IND", v_IND));
            cmd.Parameters.AddWithValue("@COD_VENTA", v_CODIGO);
            cmd.Parameters.AddWithValue("@COD_CLIENTE", v_CLIENTE);
            cmd.Parameters.AddWithValue("@ESTADO", v_ESTADO);
            cmd.Parameters.AddWithValue("@CANTIDAD", v_CANTIDAD);
            cmd.Parameters.AddWithValue("@TOTAL_COMPRA", v_TOTAL_COMPRA);
            cmd.Parameters.AddWithValue("@TOTAL_UTILIDAD", v_TOTAL_UTILIDAD);
            cmd.Parameters.AddWithValue("@TOTAL_VENTA", v_TOTAL_VENTA);
            cmd.Parameters.AddWithValue("@IGV", v_IGV);
            cmd.Parameters.AddWithValue("@COD_VENTA_X", v_CODIGO_X).Direction = ParameterDirection.InputOutput;
            cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return cmd.Parameters["@COD_VENTA_X"].Value.ToString();


        }






        #endregion

        #region "Mantenimiento ventas DETALLE"


        public String FPub_MantenimientoVentas_DET(String v_CODIGO, String v_PRODUCTO, int v_CANTIDAD, decimal v_PRECIO_U, decimal v_UTILIDAD_U
                                                    , decimal v_UTILIDAD_T, decimal v_TOTAL_VENTA)
        {
            return FPriv_MantenimientoVentas_DET( v_CODIGO,  v_PRODUCTO,  v_CANTIDAD,  v_PRECIO_U,  v_UTILIDAD_U
                                                    ,  v_UTILIDAD_T,  v_TOTAL_VENTA);
        }



        private String FPriv_MantenimientoVentas_DET( String v_CODIGO, String v_PRODUCTO, int v_CANTIDAD, decimal v_PRECIO_U, decimal v_UTILIDAD_U
                                                    , decimal v_UTILIDAD_T, decimal v_TOTAL_VENTA)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_VENTAS_MANT_DET", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@COD_VENTA", v_CODIGO);
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_PRODUCTO);
            cmd.Parameters.AddWithValue("@CANTIDAD", v_CANTIDAD);
            cmd.Parameters.AddWithValue("@PRECIO_U", v_PRECIO_U);
            cmd.Parameters.AddWithValue("@UTILIDAD_U", v_UTILIDAD_U);
            cmd.Parameters.AddWithValue("@UTILIDAD_T", v_UTILIDAD_T);
            cmd.Parameters.AddWithValue("@PRECIO_VENTA", v_TOTAL_VENTA);
            int i = cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return i.ToString();


        }






        #endregion

        #region "Validacion Venta"


        public String FPub_ValidacionProductos(String v_PRODUCTO, int v_CANTIDAD, string v_RES)
        {
            return FPriv_ValidacionProductos( v_PRODUCTO,  v_CANTIDAD,  v_RES);
        }



        private String FPriv_ValidacionProductos(String v_PRODUCTO, int v_CANTIDAD,string v_RES)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_VENTAS_VALIDAR_VENTA", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_PRODUCTO);
            cmd.Parameters.AddWithValue("@CANTIDAD", v_CANTIDAD);
            cmd.Parameters.AddWithValue("@RES", v_RES).Direction = ParameterDirection.InputOutput;
            cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return cmd.Parameters["@RES"].Value.ToString();


        }






        #endregion


        #region "Mostrar Datos Venta"


        public DataTable FPublic_MostrarDatosVenta(String v_Venta)
        {
            return FPrviv_MostrarDatosVenta(v_Venta);
        }

        private DataTable FPrviv_MostrarDatosVenta(String v_Venta)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_VENTAS_MOSTRAR_DATOS", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@COD_VENTA", v_Venta);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "Mostrar Datos Detalle"

        public DataTable FPub_MostrarDatosDetalle(String v_COD_VENTA)
        {
            return FPriv_MostrarDatosDetalle(v_COD_VENTA);
        }

        private DataTable FPriv_MostrarDatosDetalle(String v_COD_VENTA)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_VENTAS_MOSTRAR_DETALLE", cn.getCn);
            cmd.Parameters.AddWithValue("@COD_VENTA", v_COD_VENTA);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion


        #region "Validacion estado"


        public String FPub_ValidacionEstado(String v_IND, String v_COD_VENTA, String v_CLIENTE, String v_PRODUCTO, int v_CANTIDAD, string v_ESTADO)
        {
            return FPriv_ValidacionEstado( v_IND,  v_COD_VENTA,  v_CLIENTE,  v_PRODUCTO,  v_CANTIDAD,  v_ESTADO);
        }



        private String FPriv_ValidacionEstado(String v_IND,String v_COD_VENTA,String v_CLIENTE,String v_PRODUCTO, int v_CANTIDAD, string v_ESTADO)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_VENTAS_CAMBIO_ESTADO", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IND", v_IND);
            cmd.Parameters.AddWithValue("@COD_VENTA", v_COD_VENTA);
            cmd.Parameters.AddWithValue("@COD_CLIENTE", v_CLIENTE);
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_PRODUCTO);
            cmd.Parameters.AddWithValue("@CANTIDAD", v_CANTIDAD);
            cmd.Parameters.AddWithValue("@ESTADO", v_ESTADO);
            int i = cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return i.ToString();


        }






        #endregion
    }
}
