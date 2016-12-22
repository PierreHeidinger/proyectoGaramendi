<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="inventario_detalle.aspx.cs" Inherits="appIntranetCIA.web.inventario_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    Inventario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">




      <div class="col-md-12">
                                            <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
                    </div>
                      <div class="col-md-12">
                                                   <div class="form-group">
                                                        <asp:Button runat="server" ID="btn_Inventario" Text="INVENTARIO" Width="130px" CssClass="btn btn-warning btn-fill" OnClick="btn_Inventario_Click"  />
                                                       <asp:Button runat="server" ID="btn_Detalle" Text="DETALLE" Width="130px" CssClass="btn btn-info btn-fill" OnClick="btn_Detalle_Click"  />
                                                        <asp:Button runat="server" ID="btn_Editar" Text="EDITAR" Width="130px" CssClass="btn btn-info btn-fill" OnClick="btn_Editar_Click"  />
                                                       <asp:Button runat="server" ID="btn_Almacen" Text="ALMACEN" Width="130px" CssClass="btn btn-default btn-fill" OnClick="btn_Almacen_Click"     />
                                                         
                                                        
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
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Categoria :</label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Categoria" AutoPostBack="True" OnSelectedIndexChanged="cbo_Categoria_SelectedIndexChanged" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Sub Categoria :</label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_SubCategoria" AutoPostBack="False" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Marca  : </label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Marca" AutoPostBack="False" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>Descripcion :</label>
                                                <asp:TextBox runat="server" ID="txt_Descripcion" style="text-transform:uppercase"  AutoCompleteType="Disabled" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Peso Kg. :</label>
                                                <asp:TextBox runat="server" ID="txt_Peso"  style="text-align:right" onKeyPress="return checkIt(event)" AutoCompleteType="Disabled" Text="0.00" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                       
                                    </div>

                                   

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Estado : </label>
                                                <asp:DropDownList runat="server" Enabled="false" CssClass="form-control" ID="cbo_Estado">                                                    
                                                    <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                                                    <asp:ListItem Value="2">Descontinuado</asp:ListItem>
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
                                                    <asp:Button  runat="server" CssClass="btn btn-danger btn-fill pull-right" Text="CANCELAR" ID="btn_Cancelar" OnClick="btn_Cancelar_Click" />
                                                </td>
                                            </tr>
                                       
                                    
                                         
                                        </table>
                                    </div>
                                    
                                    </asp:Panel>

                                    <asp:Panel ID="pnAlmancen" runat="server" Visible="false">

                                       
                                       

                                    <div class="row">
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Categoria :</label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList1" AutoPostBack="True" OnSelectedIndexChanged="cbo_Categoria_SelectedIndexChanged" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Sub Categoria :</label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList2" AutoPostBack="False" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Marca  : </label>
                                               <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList3" AutoPostBack="False" >
                                               </asp:DropDownList>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Descripcion :</label>
                                                

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
                                        </div>
                                        
                                       
                                    </div>

                                   

                                    


                                    

                                    </asp:Panel>
                                    
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>








</asp:Content>
