﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace bibliotecaClases
{
    public class Conexion
    {
       // SqlConnection cn = new SqlConnection("server=.\\SQLEXPRESS;database=CIA_BD;uid=sa;pwd=sql");
        SqlConnection cn = new SqlConnection("server=.\\PIERRE;database=CIA_BD;uid=sa;pwd=sql");


        public SqlConnection getCn
        {
            get { return cn; }
        }
    }
}
