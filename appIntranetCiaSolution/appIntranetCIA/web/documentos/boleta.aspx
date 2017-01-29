<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="boleta.aspx.cs" Debug="true" Inherits="appIntranetCIA.web.documentos.boleta" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Factura.html</title>
    <style type="text/css">
        .auto-style1 {
            width: 132px;
        }
        .auto-style2 {
            width: 1139px;
        }
        .auto-style3 {
            width: 116px;
        }
        .auto-style4 {
            width: 79px;
        }
        .auto-style5 {
            width: 132px;
            height: 46px;
        }
        .auto-style6 {
            height: 46px;
        }
        .auto-style7 {
            width: 482px;
        }
        .auto-style8 {
            width: 110px;
        }
        .auto-style9 {
            width: 99px;
            height: 6px;
        }
    </style>
</head>
<body  style="font-family:Arial;font-size:6px">
    <form runat="server">
                  <!-- Cabezera -->
                    <div align="center">
                        <table width="970" border="0">
                          <tr>
                            <td width="60%"  height="0"> </td>      
                            <td>
                                <table width="100%" border="0" style="height:100px">
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
                                          <td class="auto-style5"></td>
                                          <td valign="bottom" align="left" class="auto-style6"><asp:Label Width="680px"  style="font-family:sans-serif;font-size:13px"  runat="server" ID="lbl_Cliente" ></asp:Label> 
                                          <%= vg_fecha.ToString("dd") %>&nbsp;&nbsp;&nbsp; <%= vg_fecha.ToString("MM") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= vg_fecha.ToString("yyy") %></td>
                                      </tr>
                                      <tr>
                                          <td class="auto-style1"></td>
                                          <td valign="bottom" align="left" ><asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_Direccion" Width="550px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lbl_Dni" style="font-family:sans-serif;font-size:13px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" ID="lbl_guia" style="font-family:sans-serif;font-size:13px"></asp:Label></td>
                                      </tr>
                                </table>
                            </td> 
                                  
                          </tr>        
                        </table>
                    </div>
                    <div style="height:10px">

                    </div>
                    <!-- CONTENIDO-PRODUCTOS -->
                    <div align="center" style="width:970px" >
                        <div style="height:170px">
                         <table   border="0">
                            <tr valign="top" style="height:1%">
                              <th scope="col" class="auto-style3"></th>
                              <th scope="col" class="auto-style4"></th>
                              <th scope="col" class="auto-style7"></th>
                              <th width="121" scope="col"> </th>
                              <th width="121" scope="col"> </th>
                            </tr>

                             <% int i = 1; %>                           <% foreach (System.Data.DataRow rows in oDs_Detalle.Rows)
                               { %>
                             
                            <tr valign="top" style="height:1%">
                              <td class="auto-style3"><div style="font-family:sans-serif;font-size:13px" align="right" class="auto-style8"><%= rows["CANTIDAD"] %></div></td>
                              <td class="auto-style4"><div  style="font-family:sans-serif;font-size:13px" align="center">Kg.</div></td>
                              <td class="auto-style7"><div style="font-family:sans-serif;font-size:13px" align="left"><%= rows["PRODUCTO"] %></div></td>
                              <td><div align="right" style="font-family:sans-serif;font-size:13px" class="auto-style9"><%= double.Parse(rows["VENTA_BOLETA_X"].ToString()) + (double.Parse(rows["VENTA_BOLETA_X"].ToString()) * 0.18) %></div></td>
                              <td><div align="center" style="font-family:sans-serif;font-size:13px"><%= double.Parse(rows["PRECIO_VENTA_X"].ToString()) + (double.Parse(rows["PRECIO_VENTA_X"].ToString()) * 0.18) %></div></td>
                            </tr>                         
                             <% i++; %>                           <% } %>
                                             
                          </table>
                         </div>  
                            <table width="970" border="0">
                            <tr>
                            <td height="58" class="auto-style2" style="text-align:center"><br /><br /><asp:Label runat="server" ID="lbl_letras" style="font-family:sans-serif;font-size:13px" Text="doscientos soles ccin cero centimos"></asp:Label></td>
                            <td width="120"><div align="left"><asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_TOTAL"></asp:Label></div></td>
                            </tr>
                         </table>
                    </div>
    </form>
</body>
</html>