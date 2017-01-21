<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="factura.aspx.cs" Inherits="appIntranetCIA.web.documentos.factura" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Factura.html</title>
    <style type="text/css">
        .auto-style1 {
            width: 208px;
        }
        .auto-style2 {
            width: 125px;
        }
        .auto-style3 {
            height: 33px;
        }
        .auto-style4 {
            margin-top: 0px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

  <!-- Cabezera -->
    <div align="center">
        <table width="970" border="0">
          <tr>
            <td width="60%"  height="160"> </td>      
            <td>
                <table width="100%" border="0"  height="100%">
                      <tr>
                          <td> <center><label></label></center></td>
                      </tr>
                      <tr>
                          <td> <center><label></label></center> </td>
                      </tr>
                      <tr>
                          <td><center> </center></td>
                      </tr>
                </table>
            </td>  
          </tr>        
        </table>
          <table width="970" border="0">
          <tr>
            <td width="60%"  height="110"> 
                <table width="100%" border="0"  height="100%">
                      <tr>
                          <td width="100">&nbsp;</td>
                          <td colspan="3"><asp:Label runat="server" ID="lbl_cliente"></asp:Label></td>
                      </tr>
                      <tr>
                          <td>&nbsp;</td>
                          <td colspan="3"><asp:Label runat="server" ID="lbl_direccion"></asp:Label></td>
                      </tr>
                      <tr>
                          <td></td>
                          <td colspan="3">&nbsp;</td>
                      </tr>
                      <tr>
                          <td>&nbsp;</td>
                          <td class="auto-style1"><asp:Label runat="server" ID="lbl_ruc"></asp:Label></td>
                          <td class="auto-style2">&nbsp;</td>
                          <td><asp:Label runat="server" ID="lbl_condicionPago"></asp:Label></td>
                      </tr>
                </table>
            </td>      
            <td>
                <table width="100%" border="0"  height="100%" class="auto-style4">
                      
                      <tr>
                          <td class="auto-style3" align="center"><%= DateTime.Now.Day %>/ <%= DateTime.Now.ToString("MM") %> / <%= DateTime.Now.Year %></td>
                      </tr>
                      <tr>
                          <td valign="botton" class="auto-style3" align="left"><asp:Label runat="server" ID="lbl_ven"></asp:Label>&nbsp;<asp:Label runat="server" ID="lbl_num_or"></asp:Label>&nbsp;<asp:Label runat="server" ID="lbl_num_guia"></asp:Label></td>
                      </tr>
                </table>
            </td>  
          </tr>        
        </table>
    </div>
    <div align="center">
    <div style="height:40px">

                    </div>
                    <!-- CONTENIDO-PRODUCTOS -->
                    <div align="center"  >
                        <div style="height:400px">
                         <table   border="0">
                            <tr valign="top" style="height:1%">
                              <th width="61" scope="col"></th>
                              <th width="61" scope="col"></th>
                              <th width="531" scope="col"></th>
                              <th width="121" scope="col"> </th>
                              <th width="121" scope="col"> </th>
                            </tr>

                             <% int i = 1; %><% foreach (System.Data.DataRow rows in oDs_Detalle.Rows)
                               { %>
                             
                            <tr valign="top" style="height:1%">
                              <td><div align="center"><%= rows["CANTIDAD"] %></div></td>
                              <td><div align="left"><%= i.ToString() %></div></td>
                              <td><div align="left"><%= rows["PRODUCTO"] %></div></td>
                              <td><div align="right"><%= rows["VENTA_BOLETA_X"] %></div></td>
                              <td><div align="right"><%= rows["PRECIO_VENTA_X"] %></div></td>
                            </tr>                         
                             <% i++; %><% } %>
                                             
                          </table>
                         </div>  
                            <table width="970" border="0">
                            <tr>
                            <td width="826" height="58"><div align="right"><strong></strong></div></td>
                            <td width="120">
                                <div align="left">
                                    <table>
                                        <tr>
                                            <td> <strong><asp:Label runat="server" ID="lbl_subtotal"></asp:Label></strong></td>
                                        </tr>
                                        <tr>
                                            <td> <strong><asp:Label runat="server" ID="lbl_igv"></asp:Label></strong></td>
                                        </tr>
                                        <tr>
                                            <td> <strong><asp:Label runat="server" ID="lbl_total"></asp:Label></strong></td>
                                        </tr>
                                    </table>
                                   

                                </div>
                            </td>
                            </tr>
                            
                         </table>
                    </div>
        </div>
    </form>
</body>
</html>