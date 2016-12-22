using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace bibliotecaClases
{
    public class claseUsuario
    {

        Conexion cn = new Conexion();


        #region AUTHENTICAR USUARIO

        public DataTable FPub_AuthenticarLogin(String v_Usuario, String v_Password)
        {
            return FPriv_AuthenticarLogin(v_Usuario, v_Password);
        }


        private DataTable FPriv_AuthenticarLogin(String v_Usuario,String v_Password)
        {

            cn.getCn.Open();
            SqlCommand cmd = new SqlCommand("SP_USUARIO_AUTHENTICAR", cn.getCn);
            cmd.Parameters.AddWithValue("@USUARIO",v_Usuario);
            cmd.Parameters.AddWithValue("@PASSWORD", v_Password);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;

        }

        #endregion
    }
}
