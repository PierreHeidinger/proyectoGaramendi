using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace bibliotecaClases
{
    public class claseInventario
    {

        Conexion cn = new Conexion();



        #region "LISTAR CATEGORIAS"

        public DataTable FPub_MostrarCategorias()
        {
            return FPriv_MostrarCategorias();
        }

        private DataTable FPriv_MostrarCategorias()
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_MOSTRAR_CATEGORIAS", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "MANTENIMIENTO CATEGORIA"


        public String FPub_MantenimientoCategoria(String v_IND, String v_CODIGO, String v_CLIENTE)
        {
            return FPriv_ManteniminentoCategoria(v_IND, v_CODIGO, v_CLIENTE);
        }



        private String FPriv_ManteniminentoCategoria(String v_IND, String v_CODIGO, String v_CLIENTE)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_CATEGORIAS_MANT", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IND", v_IND));
            cmd.Parameters.AddWithValue("@COD_CATEGORIA", v_CODIGO);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_CLIENTE);
            int i = cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return i.ToString();


        }






        #endregion

        #region "LISTAR SUB-CATEGORIAS"

        public DataTable FPub_MostrarSubCategorias(String v_CATEGORIA)
        {
            return FPriv_MostrarSubCategorias(v_CATEGORIA);
        }

        private DataTable FPriv_MostrarSubCategorias(String v_CATEGORIA)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_MOSTRAR_SUBCATEGORIAS", cn.getCn);
            cmd.Parameters.AddWithValue("@COD_CATEGORIA", v_CATEGORIA);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "MANTENIMIENTO SUB-CATEGORIAS"


        public String FPub_MantenimientoSubCategoria(String v_IND, String v_CODIGO,String v_CATEGORIA, String v_DESCRIPCION)
        {
            return FPriv_ManteniminentoSubCategoria(v_IND, v_CODIGO, v_CATEGORIA , v_DESCRIPCION);
        }



        private String FPriv_ManteniminentoSubCategoria(String v_IND, String v_CODIGO,String v_CATEGORIA, String v_DESCRIPCION)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_SUBCATEGORIAS_MANT", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IND", v_IND));
            cmd.Parameters.AddWithValue("@COD_SUBCATEGORIA", v_CODIGO);
            cmd.Parameters.AddWithValue("@COD_CATEGORIA", v_CATEGORIA);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_DESCRIPCION);
            int i = cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return i.ToString();


        }






        #endregion

        #region "LISTAR MARCAS"

        public DataTable FPub_MostrarMarcas()
        {
            return FPriv_MostrarMarcas();
        }

        private DataTable FPriv_MostrarMarcas()
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_MOSTRAR_MARCAS", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "MANTENIMIENTO MARCAS"


        public String FPub_MantenimientoMarcas(String v_IND, String v_CODIGO, String v_SIGLA, String v_DESCRIPCION)
        {
            return FPriv_ManteniminentoMarcas(v_IND, v_CODIGO, v_SIGLA, v_DESCRIPCION);
        }



        private String FPriv_ManteniminentoMarcas(String v_IND, String v_CODIGO, String v_SIGLA, String v_DESCRIPCION)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_MARCAS_MANT", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IND", v_IND));
            cmd.Parameters.AddWithValue("@COD_MARCA", v_CODIGO);
            cmd.Parameters.AddWithValue("@SIGLA", v_SIGLA);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_DESCRIPCION);
            int i = cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return i.ToString();


        }






        #endregion

        #region "LISTAR INVENTARIO"

        public DataTable FPub_ListadoInventario_Cab(String v_CODIGO, String v_DESCRIPCION, DateTime v_FECHA1, DateTime v_FECHA2)
        {
            return FPriv_ListadoInventario_Cab( v_CODIGO,  v_DESCRIPCION,  v_FECHA1,  v_FECHA2);
        }

        private DataTable FPriv_ListadoInventario_Cab(String v_CODIGO,String v_DESCRIPCION,DateTime v_FECHA1,DateTime v_FECHA2)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_PRODUCTO_LISTA_CAB", cn.getCn);
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_CODIGO);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_DESCRIPCION);
            cmd.Parameters.AddWithValue("@FECHA1", v_FECHA1);
            cmd.Parameters.AddWithValue("@FECHA2", v_FECHA2);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }

        #endregion

        #region "Mantenimiento Inventario"


        public String FPub_MantenimientoInventario(String v_IND, String v_CODIGO, String v_CATEGORIA, String v_SUBCATEGORIA, String v_MARCA, String v_DESCRIPCION
                                                    , float v_PESO, String v_ESTADO, String v_CODIGO_X)
        {
            return FPriv_ManteniminentoInventario( v_IND,  v_CODIGO,  v_CATEGORIA,  v_SUBCATEGORIA,  v_MARCA,  v_DESCRIPCION
                                                    ,  v_PESO,  v_ESTADO,  v_CODIGO_X);
        }



        private String FPriv_ManteniminentoInventario(String v_IND, String v_CODIGO, String v_CATEGORIA, String v_SUBCATEGORIA, String v_MARCA, String v_DESCRIPCION
                                                    , float v_PESO, String v_ESTADO, String v_CODIGO_X)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_INVENTARIO_PRODUCTOS_MANT", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IND", v_IND));
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_CODIGO);
            cmd.Parameters.AddWithValue("@COD_CATEGORIA", v_CATEGORIA);
            cmd.Parameters.AddWithValue("@COD_SUBCATEGORIA", v_SUBCATEGORIA);
            cmd.Parameters.AddWithValue("@COD_MARCA", v_MARCA);
            cmd.Parameters.AddWithValue("@DESCRIPCION", v_DESCRIPCION);
            cmd.Parameters.AddWithValue("@PESO_KG", v_PESO);
            cmd.Parameters.AddWithValue("@COD_ESTADO", v_ESTADO);            
            cmd.Parameters.AddWithValue("@COD_PRODUCTO_X", v_CODIGO_X).Direction = ParameterDirection.InputOutput;
            cmd.ExecuteNonQuery();

            cn.getCn.Close();


            return cmd.Parameters["@COD_PRODUCTO_X"].Value.ToString();


        }






        #endregion

        #region "MOSTRAR DETALLE PRDUCTO"

        public DataTable FPub_MostrarDetalle_Producto(String v_CODIGO)
        {
            return FPriv_MostrarDetalle_Producto(v_CODIGO);
        }


        private DataTable FPriv_MostrarDetalle_Producto(String v_CODIGO)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_PRODUCTO_MOSTRAR_DATOS", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@COD_PRODUCTO", v_CODIGO);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }


        #endregion
    }
}
