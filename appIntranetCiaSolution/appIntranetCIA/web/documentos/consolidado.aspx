<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consolidado.aspx.cs" Inherits="appIntranetCIA.web.documentos.consolidado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
  
     <form id="form1" runat="server">
    <div>
    <center>
				<TABLE id="Table1" style="Z-INDEX: 101; POSITION: absolute; WIDTH: 680px; TOP: 12px; LEFT: 8px"
					cellSpacing="1" cellPadding="1" width="680" border="0">
					<TR>
						<TD style="WIDTH: 3px"></TD>
						<TD style="WIDTH: 310px"></TD>
						<TD style="WIDTH: 37px"></TD>
						<TD style="WIDTH: 371px" align="right"></TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 3px" colSpan="2">&nbsp;</TD>
						<TD style="WIDTH: 37px"></TD>
						<TD style="WIDTH: 371px"></TD>
						<TD></TD>
					</TR>
					<TR align="center">
						<TD colSpan="5"><font style="FONT-FAMILY: Arial; FONT-SIZE: 17px; FONT-WEIGHT: bold">CONSOLIDADO DE COMPRA N° <asp:Label runat="server" ID="lbl_CodigoVenta"></asp:Label>
							</font>
						</TD>
                        <td style="height:100px">

                        </td>
					</TR>
					<TR>
						<TD style="WIDTH: 3px"></TD>
						<TD style="WIDTH: 310px"></TD>
						<TD style="WIDTH: 37px"></TD>
						<TD style="WIDTH: 371px"></TD>
						<TD align="right"><span id="lbl_Fecha" style="font-family:Arial;font-size:8pt;"><asp:Label runat="server" id="lbl_fecha"></asp:Label></span></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 690px" vAlign="top" colSpan="4"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">
                            
                            <font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">CLIENTE : </font>
							<font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
								<asp:Label runat="server" ID="lbl_cliente"></asp:Label>
							</font>
                            <br />
                            TELF :
							</font><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
								 <asp:Label runat="server" ID="lbl_telefono"></asp:Label>
							</font>
							
						</TD>
						<TD></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 540px" colSpan="3"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">DIRECCION
							</font>
							<br>
							<font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
								<asp:Label runat="server" ID="lbl_direccion"></asp:Label>
							</font>
						</TD>
						<TD style="WIDTH: 318px"></TD>
						<TD style="HEIGHT: 1px"></TD>
					</TR>
					
					<TR>
						<TD style="HEIGHT: 193px" colSpan="5">
							<div id="xxx" style="WIDTH: 680px; HEIGHT: 100%">
								<TABLE id="Table2" style="WIDTH: 680px; HEIGHT: 40px" cellSpacing="1" cellPadding="1" width="680"
									border="0">
									<TR>
										<TD colSpan="7" height="2">
											<HR width="100%" SIZE="1">
										</TD>
									</TR>
									<TR>
										
										<TD style="WIDTH: 340px"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">ARTICULO
											</font>
										</TD>
										<TD style="WIDTH: 70px"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">GARANTIA
											</font>
										</TD>
										<TD style="WIDTH: 42px" align="center"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">CANT.
											</font>
										</TD>
										<TD style="WIDTH: 58px" align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">COSTO
											</font>
										</TD>
										<TD align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">UTIL. 
												 </font>
										</TD>
										<TD align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">TOTAL
											</font>
										</TD>
									</TR>
									<TR>
										<TD style="HEIGHT:11px" colSpan="7" height="11">
											<HR width="100%" SIZE="1">
										</TD>
									</TR>

                                    <%  
                                        if(oDs_Detalle.Rows.Count > 0) { 
                                        for (int i = 0; i < oDs_Detalle.Rows.Count; i++)
                                        {       %>
									
									<TR vAlign="top">
										
										<TD style="WIDTH: 300px" vAlign="top"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												<%= oDs_Detalle.Rows[i]["PRODUCTO"] %>
											</font>
										</TD>
										<TD style="WIDTH: 70px" vAlign="top"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												--
											</font>
										</TD>
										<TD style="WIDTH: 42px" vAlign="top" align="center"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												<%= oDs_Detalle.Rows[i]["CANTIDAD"] %>
											</font>
										</TD>
										<TD style="WIDTH: 58px" vAlign="top" align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												<%= oDs_Detalle.Rows[i]["PRECIO_V"] %>
											</font>
										</TD>
										<TD vAlign="top" align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												<%= oDs_Detalle.Rows[i]["UTILIDAD_UNIDAD"] %>
											</font>
										</TD>
										<TD vAlign="top" align="right"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
											    <%=  Math.Round(decimal.Parse( oDs_Detalle.Rows[i]["PRECIO_VENTA_X"].ToString()),2) %>
											</font>
										</TD>
									</TR>							
									
                                    <% }
                                        }; %>
									
								</TABLE>
							</div>
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 1px" colSpan="5">
							<HR width="100%" SIZE="1">
						</TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 5px" colSpan="5"><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
								<TABLE id="Table4" style="WIDTH: 688px" cellSpacing="1" cellPadding="1" width="688" border="0">
									<TR>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">FORMA DE PAGO</FONT></TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												EFECTIVO
											</font>
										</TD>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">SUB TOTAL S/. </FONT>
										</TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 13px; FONT-WEIGHT: bold">
												<asp:Label runat="server" ID="lbl_sub_total"></asp:Label>
											</font>
										</TD>
									</TR>
									<TR>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">FECHA DE 
												VENTA </FONT>
										</TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												<asp:Label runat="server" ID="lbl_Fecha_Venta"></asp:Label>
											</font>
										</TD>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">IGV S/.</FONT></TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 13px; FONT-WEIGHT: bold">
												<asp:Label runat="server" ID="lbl_IGV"></asp:Label>
											</font>
										</TD>
									</TR>
									<TR>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">LUGAR DE 
												ENTREGA</FONT></TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
												
											</font>
										</TD>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">TOTAL S/.</FONT></TD>
										<TD><font style="FONT-FAMILY: Verdana; FONT-SIZE: 13px; FONT-WEIGHT: bold">
												<asp:Label runat="server" ID="lbl_Total_venta"></asp:Label>
											</font>
										</TD>
									</TR>
									<TR>
										<TD><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px; FONT-WEIGHT: bold">OBSERVACIONES</FONT></TD>
										<TD colSpan="3"><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px"></FONT></TD>
									</TR>
									<TR>
										<TD style="FONT-FAMILY: Verdana; FONT-SIZE: 11px" colSpan="4"></TD>
									</TR>
									<TR>
										<TD colSpan="4"><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px"></FONT></TD>
									</TR>
								</TABLE>
							</font>
						</TD>
					</TR>
					<TR>
						<TD colSpan="5" align="right">
							<TABLE id="Table3" style="WIDTH: 688px; HEIGHT: 110px" cellSpacing="1" cellPadding="1"
								width="688" border="0">
								<TR>
									<TD>&nbsp;&nbsp;
									</TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>&nbsp;&nbsp;
									</TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD align="center"><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">
											<hr width="170">
											<b>&nbsp;</b><br>
											 </FONT>
									</TD>
									
								</TR>
								
								<TR>
									<TD align="left" colSpan="3"><FONT style="FONT-FAMILY: Verdana; FONT-SIZE: 11px">ADJUNTAR 
											COPIA DE ESTE CONSOLIDADO PARA VERIFICAR LA VENTA</FONT></TD>
								</TR>
                                <tr>
                                    <td>
                                        <center>
                                         <img onclick="window.print()" src="../../images/documentprint.png" />
                                        </center>
                                    </td>
                                </tr>
							</TABLE>
							<span id="Label1" style="font-family:Arial;font-size:8pt;font-weight:bold;width:60px;">RG-33-LOG</span>
						</TD>
					</TR>
				</TABLE>
			</center>

    </div>

        
</form>
</body>
</html>
