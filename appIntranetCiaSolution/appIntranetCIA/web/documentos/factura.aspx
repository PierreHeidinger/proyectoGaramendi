<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="factura.aspx.cs" Inherits="appIntranetCIA.web.documentos.factura" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Factura.html</title>
    <style type="text/css">
        .auto-style3 {
            height: 33px;
        }
        .auto-style4 {
            margin-top: 0px;
        }
        .auto-style5 {
            width: 457px;
        }
        .auto-style9 {
            width: 63%;
        }
        .auto-style11 {
            width: 134px;
            height: 2px;
        }
        .auto-style12 {
            height: 2px;
        }
        .auto-style13 {
            width: 134px;
            height: 4px;
        }
        .auto-style14 {
            height: 4px;
        }
        .auto-style16 {
            width: 126px;
        }
        .auto-style17 {
            width: 277px;
            height: 13px;
        }
        .auto-style18 {
            width: 134px;
            height: 13px;
        }
        .auto-style20 {
            width: 72px;
        }
        .auto-style21 {
            width: 83px;
        }
        .auto-style23 {
            height: 92%;
        }
        .auto-style24 {
            width: 99px;
        }
        .auto-style25 {
            height: 13px;
        }
    </style>
</head>
<body >

    <form id="form1" runat="server">

  <!-- Cabezera -->
    <div align="center">
        <table width="970" border="0">
          <tr>
            <td width="60%"  height="94"> </td>      
            <td>
                <table width="100%" border="0"  >
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
          <table width="950" border="0">
          <tr>
            <td  height="110" class="auto-style9"> 
                <table width="100%" border="0" class="auto-style23">
                    <tr>
                        <td style="height:5px"></td>
                    </tr>
                      <tr>
                          <td class="auto-style11"></td>
                          <td colspan="3" style="text-align:left;vertical-align:bottom" class="auto-style12" ><asp:Label  runat="server" style="font-family:sans-serif;font-size:13px" ID="lbl_cliente"></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="auto-style13"></td>
                          <td colspan="3"  style="text-align:left;vertical-align:bottom;font-family:sans-serif;font-size:13px" class="auto-style14"><asp:Label runat="server" style="font-family:sans-serif;font-size:13px" ID="lbl_direccion"></asp:Label></td>
                      </tr>
                          
                      <tr>
                                                  
                          <td class="auto-style18"></td>
                          <td class="auto-style17" style="text-align:left;vertical-align:top"><asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_ruc"></asp:Label></td>
                          <td style="text-align:left;vertical-align:top" class="auto-style25"><asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_condicionPago"></asp:Label></td>
                      </tr>
                </table>
            </td>      
            <td>
                <table width="100%" border="0"  height="100%" class="auto-style4">
                      
                      <tr >
                          <td class="auto-style3" align="center" style="vertical-align:bottom"> &nbsp;<%= DateTime.Now.Day %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= DateTime.Now.ToString("MM") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%= DateTime.Now.Year %></td>
                      </tr>
                      <tr>
                          <td  class="auto-style3" style="vertical-align:bottom" align="left"><asp:Label runat="server" ID="lbl_ven" style="font-family:sans-serif;font-size:13px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_num_or"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_num_guia"></asp:Label></td>
                      </tr>
                </table>
            </td>  
          </tr>        
        </table>
    </div>
    
                    <!-- CONTENIDO-PRODUCTOS -->
                    <div align="center" style="width:970px" >
                        <div style="height:313px">
                         <table   border="0">
                            

                             <% int i = 1; %><% foreach (System.Data.DataRow rows in oDs_Detalle.Rows)
                               { %>
                             
                            <tr valign="top" style="height:1%">
                              <td class="auto-style16" style="text-align:center;font-family:sans-serif;font-size:13px"><%= rows["CANTIDAD"] %></td>
                              <td class="auto-style24" style="font-family:sans-serif;font-size:13px">kg.</td>
                              <td class="auto-style5" style="font-family:sans-serif;font-size:13px"><%= rows["PRODUCTO"] %></td>
                              <td class="auto-style20" style="text-align:right;font-family:sans-serif;font-size:13px"><%= rows["VENTA_BOLETA_X_D"].ToString() %></td>
                              <td class="auto-style21" style="text-align:right;font-family:sans-serif;font-size:13px"><%= rows["PRECIO_VENTA_X_D"].ToString() %></td>
                            </tr>                         
                             <% i++; %><% } %>
                                             
                          </table>
                          
                         </div> 
                            <div style="height:15px;width:970px;text-align:left">
                              &nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" ID="lbl_letras" T></asp:Label>
                            </div> 
                            <table width="970" border="0">
                            <tr>
                            <td width="826" height="58"><div align="right"><strong></strong></div></td>
                            <td width="70">
                                <div align="left">
                                    <table>
                                        <tr>
                                            <td>  <%= moneda %> <asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_subtotal"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>  <%= moneda %> <asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_igv"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>  <%= moneda %> <asp:Label style="font-family:sans-serif;font-size:13px" runat="server" ID="lbl_total"></asp:Label></td>
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