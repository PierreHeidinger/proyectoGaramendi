using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace bibliotecaClases
{
    public class claseClientes
    {
        Conexion cn = new Conexion();


        #region "Listar Clientes"

        public DataTable FPub_ListarClientes(String v_COD_CLIENTE, String v_DOCUMENTO, String v_CLIENTE, String v_TIPO, String v_ESTADO)
        {
            return FPriv_ListarClientes( v_COD_CLIENTE,  v_DOCUMENTO,  v_CLIENTE,  v_TIPO,  v_ESTADO);
        }


        private DataTable FPriv_ListarClientes(String v_COD_CLIENTE ,String v_DOCUMENTO,String v_CLIENTE,String v_TIPO,String v_ESTADO)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_CLIENTES_LISTAR_CAB", cn.getCn);
            cmd.Parameters.AddWithValue("@COD_CLIENTE", v_COD_CLIENTE);
            cmd.Parameters.AddWithValue("@DOCUMENTO", v_DOCUMENTO);
            cmd.Parameters.AddWithValue("@CLIENTE", v_CLIENTE);
            cmd.Parameters.AddWithValue("@TIPO", v_TIPO);
            cmd.Parameters.AddWithValue("@ESTADO", v_ESTADO);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cn.getCn.Close();
            return dt;

        }

        #endregion

        #region "Mantenimiento Clientes"


        public String FPub_MantenimientoClientes(String v_IND, String v_CODIGO, String v_CLIENTE, String v_APELLIDO, String v_RAZON, String v_TIPO, String v_DOCUMENTO, String v_DIRECCION
                                                    , String v_TELEFONO, String v_CELULAR, String v_COD_DISTRITO, String v_COD_PROVINCIA, String v_COD_DEPARTAMENTO, String v_COD_USUARIO
                                                    , String v_ESTADO,String v_COMENTARIO, String v_COD_CLIENTE_X)
        {
            return FPriv_ManteniminentoClientes(v_IND, v_CODIGO, v_CLIENTE, v_APELLIDO, v_RAZON, v_TIPO, v_DOCUMENTO, v_DIRECCION
                                                    , v_TELEFONO, v_CELULAR, v_COD_DISTRITO, v_COD_PROVINCIA, v_COD_DEPARTAMENTO, v_COD_USUARIO
                                                    , v_ESTADO,v_COMENTARIO,v_COD_CLIENTE_X);
        }



        private String FPriv_ManteniminentoClientes(String v_IND, String v_CODIGO, String v_CLIENTE, String v_APELLIDO, String v_RAZON, String v_TIPO, String v_DOCUMENTO, String v_DIRECCION
                                                    , String v_TELEFONO, String v_CELULAR, String v_COD_DISTRITO, String v_COD_PROVINCIA, String v_COD_DEPARTAMENTO, String v_COD_USUARIO
                                                    , String v_ESTADO,String v_COMENTARIO, String v_COD_CLIENTE_X)
        {
            cn.getCn.Open();

            SqlCommand cmd = new SqlCommand("SP_CLIENTES_MANTENIMINTO_CAB", cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;

          
               
                cmd.Parameters.Add(new SqlParameter("@IND_A", v_IND));
                cmd.Parameters.AddWithValue("@COD_CLIENTE", v_CODIGO);
                cmd.Parameters.AddWithValue("@NOM_CLIENTE", v_CLIENTE);
                cmd.Parameters.AddWithValue("@APE_CLIENTE", v_APELLIDO);
                cmd.Parameters.AddWithValue("@RAZ_CLIENTE", v_RAZON);
                cmd.Parameters.AddWithValue("@TIPO_DC", v_TIPO);
                cmd.Parameters.AddWithValue("@DOCUMENTO", v_DOCUMENTO);
                cmd.Parameters.AddWithValue("@DIRECCION", v_DIRECCION);
                cmd.Parameters.AddWithValue("@TELEFONO", v_TELEFONO);
                cmd.Parameters.AddWithValue("@CELULAR", v_CELULAR);
                cmd.Parameters.AddWithValue("@COD_DISTRITO", v_COD_DISTRITO);
                cmd.Parameters.AddWithValue("@COD_PROVINCIA", v_COD_PROVINCIA);
                cmd.Parameters.AddWithValue("@COD_DEPARTAMENTO", v_COD_DEPARTAMENTO);
                cmd.Parameters.AddWithValue("@COD_USUARIO", v_COD_USUARIO);
                cmd.Parameters.AddWithValue("@ESTADO", v_ESTADO);
                cmd.Parameters.AddWithValue("@COMENTARIO", v_COMENTARIO);
                cmd.Parameters.AddWithValue("@COD_CLIENTE_X", v_COD_CLIENTE_X).Direction = ParameterDirection.InputOutput;
                cmd.ExecuteNonQuery();

            cn.getCn.Close();
           

            return cmd.Parameters["@COD_CLIENTE_X"].Value.ToString();

           
        }






        #endregion

        #region "Mostrar Detalle Cliente"

        public DataTable FPub_MostrarDetalle_Cliente(String v_CODIGO)
        {
            return FPriv_MostrarDetalle_Cliente(v_CODIGO);
        }


        private DataTable FPriv_MostrarDetalle_Cliente(String v_CODIGO)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_CLIENTES_MOSTRAR_DETALLE",cn.getCn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@COD_CLIENTE", v_CODIGO);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cn.getCn.Close();
            return dt;
        }


        #endregion

        #region "Mostrar Historico Clientes"

        public DataTable FPub_MostrarHistorioCliente(String v_COD_CLIENTE)
        {
            return FPriv_MostrarHistorioCliente(v_COD_CLIENTE);
        }


        private DataTable FPriv_MostrarHistorioCliente(String v_COD_CLIENTE)
        {
            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_CLIENTES_MOSTRAR_HISTORICO", cn.getCn);
            cmd.Parameters.AddWithValue("@COD_CLIENTE", v_COD_CLIENTE);            
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cn.getCn.Close();
            return dt;

        }

        #endregion


    }
}
