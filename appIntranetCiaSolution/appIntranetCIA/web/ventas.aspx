<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="ventas.aspx.cs" Inherits="appIntranetCIA.web.ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    VENTAS
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    
         <div class="col-md-12">
                            <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
                            </div>
                             <asp:Button runat="server" Text="." Width="1" BackColor="#FFFFFF" Height="1" />
                            <div class="col-md-12">
                                   <div class="form-group">
                                       
                                        <asp:Button runat="server" ID="btn_Nuevo" Text="NUEVO" Width="130px" CssClass="btn btn-info btn-fill"  />
                                        
                                        <asp:Button runat="server" Text="CATEGORIAS"  Width="130px" ID="btn_Categorias" CssClass="btn btn-info btn-fill"  />
                                        <asp:Button runat="server" Text="SUB-CATEG" Width="130px" ID="btn_SubCategorias" CssClass="btn btn-info btn-fill"  />                                      
                                        <asp:Button runat="server" Text="MARCAS" ID="btn_Marcas" Width="130px"  CssClass="btn btn-info btn-fill"  />
                                         <asp:Button runat="server" Text="IMPRIMIR" Width="130px"  CssClass="btn btn-warning btn-fill" />
                                        <asp:Button runat="server" ID="btn_ExportarExcel" Width="130px"  Text="EXCEL" BackColor="#1ABC9C" CssClass="btn btn-default btn-fill pull-right"  />
                                   </div>                                   
                             </div>  

                               
                                                                                       
                   

                 
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                
                                <div class="row">

                                     <!--FILTROS RAPIDOS DE BUSQUEDA-->
                                      <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Codigo :</label>
                                                <asp:TextBox runat="server"  onKeyPress="return checkIt(event)"  CssClass="form-control" placeHolder="1002..." ID="txt_Codigo" AutoCompleteType="Disabled" ></asp:TextBox>
                                                
                                            </div>
                                        </div>  

                                       

                                       <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Descripcion :</label>
                                                <asp:TextBox runat="server" CssClass="form-control" placeHolder="Cemento..." ID="txt_Descripcion"  AutoCompleteType="Disabled" ></asp:TextBox>                                              
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Desde:</label>
                                                <table>
                                                    
                                                    <tr>                                                       
                                                        <td>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_Fecha1"  AutoCompleteType="Disabled" ></asp:TextBox>
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
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_Fecha2"  AutoCompleteType="Disabled" ></asp:TextBox>
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
                                
                                    <div style="overflow:auto;height:100%;width:100%">
                                                                                              <asp:DataGrid ID="dg_Inventario" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="19"  AutoGenerateColumns="false"   >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke"   href="inventario_detalle.aspx?cod_producto=<%# Eval("COD_PRODUCTO") %>">
                                                                                                                   <%# Eval("COD_PRODUCTO") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="FEC REG" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("FECHA_REG") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="PRODUCTO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("DESCRIPCION") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="ESTADO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("ESTADO") %>                                                                                                 
                                                                                                  

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
