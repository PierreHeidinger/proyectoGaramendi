using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace bibliotecaClases
{
    public class claseUtilitarios
    {
        Conexion cn = new Conexion();

        

        #region "Distritos"


        public DataTable FPub_ListarDistritos(String v_Provincia)
        {
            return FPriv_ListarDistritos(v_Provincia);
        }


        private DataTable FPriv_ListarDistritos(String v_Provincia)
        {
                DataTable dt = new DataTable();

            
                cn.getCn.Open();
                SqlCommand cmd = new SqlCommand("SP_UTILITARIOS_LISTAR_DISTRITOS",cn.getCn);
                cmd.Parameters.AddWithValue("ID_PROVINCIA", v_Provincia);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);

                DataRow row = dt.NewRow();
                row["ID_DISTRITO"] = "0";
                row["DISTRITO"] = "--SELECCIONE--";
                dt.Rows.InsertAt(row,0);


                cn.getCn.Close();
            

            return dt; 
        }

        #endregion

        #region "Provincias"


        public DataTable FPub_ListarProvincias(String v_Provincia)
        {
            return FPriv_ListarProvincias(v_Provincia);
        }


        private DataTable FPriv_ListarProvincias(String v_Departamento)
        {
            DataTable dt = new DataTable();

            

                cn.getCn.Open();
                SqlCommand cmd = new SqlCommand("SP_UTILITARIOS_LISTAR_PROVINCIAS",cn.getCn);
                cmd.Parameters.AddWithValue("@ID_DEPARTAMENTO", v_Departamento);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataRow row = dt.NewRow();
                row["ID_PROVINCIA"] = "0";
                row["PROVINCIA"] = "--SELECCIONE--";
                dt.Rows.InsertAt(row,0);
                cn.getCn.Close();
            
    
            return dt;
        }


        #endregion

        #region "Departamentos"


        public DataTable FPub_ListarDepartamentos(String v_Departamento)
        {
            return FPriv_ListarDepartamentos(v_Departamento);
        }

        private DataTable FPriv_ListarDepartamentos(String v_Departamento)
        {
            DataTable dt = new DataTable();

            
                cn.getCn.Open();
                SqlCommand cmd = new SqlCommand("SP_UTILITARIOS_LISTAR_DEPARTAMENTOS", cn.getCn);
                cmd.Parameters.AddWithValue("@ID_DEPARTAMENTO", v_Departamento);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataRow row = dt.NewRow();
                row["ID_DEPARTAMENTO"] = "0";
                row["DEPARTAMENTO"] = "--SELECCIONE--";
                dt.Rows.InsertAt(row,0);
                cn.getCn.Close();
            
            return dt;
        }


        #endregion

    }
}
