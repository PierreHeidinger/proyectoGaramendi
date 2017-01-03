<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="ventas.aspx.cs" Inherits="appIntranetCIA.web.ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    VENTAS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    
         <div class="col-md-12">
                            <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
                            </div>
                             <asp:Button runat="server" Text="." Width="1" BackColor="#F9F5F5" BorderStyle="None" Height="1" />
                            <div class="col-md-12">
                                   <div class="form-group">
                                       
                                        <asp:Button runat="server" ID="btn_Nuevo" Text="NUEVO" Width="130px" CssClass="btn btn-info btn-fill" OnClick="btn_Nuevo_Click"  />
                                        
                                        <asp:Button runat="server" Text="CATEGORIAS"  Width="130px" ID="btn_Categorias" CssClass="btn btn-info btn-fill"  />
                                        <asp:Button runat="server" Text="SUB-CATEG" Width="130px" ID="btn_SubCategorias" CssClass="btn btn-info btn-fill"  />                                      
                                        <asp:Button runat="server" Text="MARCAS" ID="btn_Marcas" Width="130px"  CssClass="btn btn-info btn-fill"  />
                                         <asp:Button runat="server" Text="REPORTES" Visible="false" ID="btn_Reportes" Width="130px"  CssClass="btn btn-warning btn-fill" />
                                        <asp:Button runat="server" ID="btn_ExportarExcel" Width="130px"  Text="EXCEL" BackColor="#1ABC9C" CssClass="btn btn-default btn-fill pull-right" OnClick="btn_ExportarExcel_Click"  />
                                   </div>                                   
                             </div>  

                               
                                                                                       
                   

                 
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                
                                <div class="row">

                                     <!--FILTROS RAPIDOS DE BUSQUEDA-->
                                      <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Cliente :</label>
                                                <asp:TextBox runat="server"   CssClass="form-control" placeHolder="Jose..." ID="txt_Cliente" AutoCompleteType="Disabled" OnTextChanged="txt_Cliente_TextChanged" ></asp:TextBox>
                                                
                                            </div>
                                        </div>  

                                       

                                       <div class="col-md-2" style="display:none">
                                            <div class="form-group">
                                                <label>Producto :</label>
                                                <asp:TextBox runat="server" CssClass="form-control" placeHolder="tv" ID="txt_Producto" OnTextChanged="txt_Cliente_TextChanged" AutoCompleteType="Disabled" ></asp:TextBox>                                              
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Desde:</label>
                                                <table>
                                                    
                                                    <tr>                                                       
                                                        <td>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_Fecha1" OnTextChanged="txt_Cliente_TextChanged"  AutoCompleteType="Disabled" ></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <img src="../images/icono_calendario.png" id="IMG_FECHA" width="35" />        
                                                            <ajaxtoolkit:CalendarExtender runat="server" id="CalendarExtendfer1"  TargetControlID="txt_Fecha1" Format="dd/MM/yyyy"  PopupButtonID="IMG_FECHA">
                                                                                    </ajaxtoolkit:CalendarExtender>   
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                                
                                                                                   
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Hasta :</label>
                                                <table>
                                                    
                                                    <tr>                                                       
                                                        <td>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_Fecha2" OnTextChanged="txt_Cliente_TextChanged"  AutoCompleteType="Disabled" ></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <img src="../images/icono_calendario.png" id="IMG_FECHA1" width="35" />        
                                                            <ajaxtoolkit:CalendarExtender runat="server" id="CalendarExtender1"  TargetControlID="txt_Fecha2" Format="dd/MM/yyyy"  PopupButtonID="IMG_FECHA1">
                                                                                    </ajaxtoolkit:CalendarExtender>   
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                                
                                                                                   
                                            </div>
                                        </div>


                                        

                                </div>


                                
                            </div>
                            <div class="content">
                                
                                    <div style="overflow:auto;height:550px;width:100%">
                                                                                              <asp:DataGrid ID="dg_ventas" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                   AutoGenerateColumns="false" >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke"   href="ventas_detalle.aspx?cod_venta=<%# Eval("COD_VENTA") %>">
                                                                                                                   <%# Eval("COD_VENTA") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="FEC VEN" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("FECHA_REG") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="CLIENTE" HeaderStyle-HorizontalAlign="Left">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="6%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("CLIENTE") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="CANTIDAD">
                                                                                                          <ItemStyle HorizontalAlign="Right" Width="1%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("CANTIDAD") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="COMPRA S/.">
                                                                                                          <ItemStyle HorizontalAlign="Right" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("TOTAL_COMPRA") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="UTILIDAD S/.">
                                                                                                          <ItemStyle HorizontalAlign="Right" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("TOTAL_UTILIDAD") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                       
                                                                                                      <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="IGV">
                                                                                                          <ItemStyle HorizontalAlign="Right" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("IGV") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                    <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="VENTA S/.">
                                                                                                          <ItemStyle HorizontalAlign="Right" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("TOTAL_VENTA") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                       
                                                                                                     <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="ESTADO">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%" BackColor="Goldenrod" Font-Bold="true" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("EST") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        

                                                                                                  </Columns>
                                                                                      
                                                                                 
                                                                                              </asp:DataGrid>
                                                                                               </div>

                              
                                <!-- -->

                                   </div>
                                    
                                    <div class="clearfix"></div>




                                
                            </div>
                        </div>






</asp:Content>
