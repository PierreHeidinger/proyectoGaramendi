<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="boleta.aspx.cs" Inherits="appIntranetCIA.web.documentos.boleta" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Factura.html</title>
</head>
<body bgcolor="#FBFDDF">
    <form runat="server">
                  <!-- Cabezera -->
                    <div align="center">
                        <table width="970" border="0">
                          <tr>
                            <td width="60%"  height="160"> </td>      
                            <td>
                                <table width="100%" border="0" style="height:160px">
                                      <tr>
                                          <td> </td>
                                      </tr>
                                      <tr>
                                          <td> </td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                      </tr>
                                </table>
                            </td>  
                          </tr>        
                        </table>
                          <table width="970" border="0">
                          <tr>
                            <td width="100%"  height="70"> 
                                <table width="100%" border="0"  height="100%">
                                      <tr>
                                          <td width="100"></td>
                                          <td valign="bottom" align="left"><asp:Label Width="600px" runat="server" ID="lbl_Cliente"></asp:Label> Fecha : 
                                          </td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                          <td valign="bottom" align="left" ><asp:Label runat="server" ID="lbl_Direccion" Width="450px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lbl_Dni"></asp:Label></td>
                                      </tr>
                                </table>
                            </td>        
                          </tr>        
                        </table>
                    </div>

                    <!-- CONTENIDO-PRODUCTOS -->
                    <div align="center" >
                        <div style="height:400px">
                         <table   border="0">
                            <tr valign="top" style="height:1%">
                              <th width="81" scope="col"></th>
                              <th width="81" scope="col"></th>
                              <th width="531" scope="col"></th>
                              <th width="121" scope="col"> </th>
                              <th width="121" scope="col"> </th>
                            </tr>


                           <% foreach (System.Data.DataRow rows in oDs_Detalle.Rows)
                               { %>

                            <tr valign="top" style="height:1%">
                              <td><div align="center"><%= rows["CANTIDAD"] %></div></td>
                              <td><div align="center"><%= rows["CANTIDAD"] %></div></td>
                              <td><div align="left"><%= rows["PRODUCTO"] %></div></td>
                              <td><div align="right"><%= rows["VENTA_BOLETA_X"] %></div></td>
                              <td><div align="right"><%= rows["PRECIO_VENTA_X"] %></div></td>
                            </tr>                         
                             
                           <% } %>
                                             
                          </table>
                         </div>  
                            <table width="970" border="0">
                            <tr>
                            <td width="826" height="58"><div align="right"><strong></strong></div></td>
                            <td width="120"><div align="left"><strong><asp:Label runat="server" ID="lbl_TOTAL"></asp:Label></strong></div></td>
                            </tr>
                         </table>
                    </div>
    </form>
</body>
</html>