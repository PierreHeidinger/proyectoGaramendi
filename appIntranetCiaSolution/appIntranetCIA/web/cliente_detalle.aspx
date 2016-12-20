<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="cliente_detalle.aspx.cs" Inherits="appIntranetCIA.web.cliente_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    CLIENTES
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

                    <div class="col-md-12">
                                            <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
                    </div>
                      <div class="col-md-12">
                                                   <div class="form-group">
                                       
                                                       <asp:Button runat="server" ID="btn_Detalle" Text="DETALLE" CssClass="btn btn-info btn-fill" OnClick="btn_Detalle_Click"  />
                                                        <asp:Button runat="server" ID="btn_Editar" Text="EDITAR" CssClass="btn btn-info btn-fill" OnClick="btn_Editar_Click"  />
                                                       <asp:Button runat="server" ID="btn_Estado" Text="ESTADO" CssClass="btn btn-default btn-fill" OnClick="btn_Estado_Click"  />
                                                         
                                                        
                                                   </div>  
                                                                              
                      </div>  

   

                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                
                                
                            </div>

                            
                            <div class="content">

                                    <asp:Panel runat="server" ID="pnDatos">
                                
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Codigo :</label>
                                                <asp:TextBox runat="server" ID="txt_Codigo" ReadOnly="true" style="background-color:lightgray;border-top:solid 2px gray;border-left:solid 2px gray" CssClass="form-control"></asp:TextBox>                                                
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Tipo de documento :</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_TipoDocumento" OnSelectedIndexChanged="cbo_TipoDocumento_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="0">--SELECCIONE--</asp:ListItem>
                                                    <asp:ListItem Value="1">DNI</asp:ListItem>
                                                    <asp:ListItem Value="2">RUC</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Documento :</label>
                                                <asp:TextBox runat="server" ID="txt_NumDocumento" onKeyPress="return checkIt(event)" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>                                                
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label runat="server" visible="false"  id="lbl_nombre_nat">Nombres :</label>
                                                <asp:TextBox runat="server" Visible="false" ID="txt_Nombres" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                                
                                                <label runat="server" visible="false"  id="lbl_razon_social">Razon Social :</label>
                                                <asp:TextBox runat="server" Visible="false" ID="txt_RazonSocial" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label  runat="server" visible="false" id="lbl_apellido_nat">Apellidos</label>
                                                <asp:TextBox runat="server" Visible="false" ID="txt_Apellido" CssClass="form-control" AutoCompleteType="Disabled" ></asp:TextBox>
                                            </div>
                                        </div>

                                        <hr />
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Direccion : </label>
                                                <asp:TextBox runat="server" ID="txt_Direccion" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Departamento</label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Departamento" AutoPostBack="True" OnSelectedIndexChanged="cbo_Departamento_SelectedIndexChanged">
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Provincia</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Provincia" AutoPostBack="True" OnSelectedIndexChanged="cbo_Provincia_SelectedIndexChanged">
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Distrito</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Distrito">
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Telefono : </label>
                                                <asp:TextBox runat="server" ID="txt_Telefono" onKeyPress="return checkIt(event)" AutoCompleteType="Disabled" CssClass="form-control"></asp:TextBox>
                                               
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Celular</label>
                                                <asp:TextBox runat="server" ID="txt_Celular" onKeyPress="return checkIt(event)" AutoCompleteType="Disabled" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Estado : </label>
                                                <asp:DropDownList runat="server" Enabled="false" CssClass="form-control" ID="cbo_Estado">
                                                    <asp:ListItem Value="0">--SELECCIONE--</asp:ListItem>
                                                    <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                                                    <asp:ListItem Value="2">Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Fecha Registro :</label>
                                                <asp:Label runat="server" ID="lbl_FechaRegistro" Enabled="false" CssClass="form-control"></asp:Label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="btn-fill pull-right">
                                        <table>
                                            <tr>
                                                <td>
                                                     <asp:Button runat="server" ID="btn_Guardar" CssClass="btn btn-info btn-fill pull-righ" Text="GUARDAR" OnClick="btn_Guardar_Click"  />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    &nbsp;
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button  runat="server" CssClass="btn btn-danger btn-fill pull-right" ID="btn_Cancelar" Text="CANCELAR" OnClick="btn_Cancelar_Click"/>
                                                </td>
                                            </tr>
                                       
                                    
                                         
                                        </table>
                                    </div>
                                    
                                    </asp:Panel>


                                    <asp:Panel runat="server" Visible="false" ID="pnEstado">

                                       <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Codigo :</label>
                                                <asp:TextBox runat="server" ID="txt_CodigoHistorico" ReadOnly="true" style="background-color:lightgray;border-top:solid 2px gray;border-left:solid 2px gray" CssClass="form-control"></asp:TextBox>                                                
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Estado : </label>
                                                <asp:DropDownList runat="server"  CssClass="form-control" ID="cbo_EstadoCambio">                                         
                                                    <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                                                    <asp:ListItem Value="2">Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>¿Cual es el motivo del cambio de estado?  </label>
                                                <asp:TextBox runat="server" style="resize:none" ID="txt_Comentario" TextMode="MultiLine" CssClass="form-control" Rows="5"></asp:TextBox>
                                            </div>
                                        </div>

                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>HISTORICO CLIENTE : </label>
                                                <div style="BORDER-BOTTOM-STYLE: inset; BORDER-RIGHT-STYLE: inset; WIDTH: 80%; BORDER-TOP-STYLE: inset; HEIGHT: 300px; BORDER-LEFT-STYLE: inset; OVERFLOW: auto">
                                                                                              <asp:DataGrid ID="dg_Historico_clientes" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="19"  AutoGenerateColumns="false"   >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="DarkCyan"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="FECHA y HORA">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke" >
                                                                                                                   <%# Eval("FECHA_REGISTRO") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="TIPO" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("TIPO_EVENTO") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="COMENTARIO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="9%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("COMENTARIO") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      
                                                                                                        

                                                                                                        

                                                                                                  </Columns>
                                                                                 
                                                                                              </asp:DataGrid>
                                                 </div>
                                            </div>
                                        </div>








                                                                              
                                    </div>
                                        <div class="btn-fill pull-right">
                                       
                                                    <asp:Button  runat="server" CssClass="btn btn-danger btn-fill pull-right" ID="btn_CambioEstado" Text="Guardar" OnClick="btn_CambioEstado_Click"/>
                                            
                                    </div>
                                    </asp:Panel>
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>

         
    

</asp:Content>
