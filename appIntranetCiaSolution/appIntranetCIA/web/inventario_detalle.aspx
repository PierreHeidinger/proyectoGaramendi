<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="inventario_detalle.aspx.cs" Inherits="appIntranetCIA.web.inventario_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    Inventario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <script src="../Content/Utilidades.js"></script>


    <script>

        function Calculo(indicador) {

            if(indicador == 1){
                var cantidad = document.getElementById('<%= txt_Cantidad.ClientID %>').value;
               // var ptotal = document.getElementById('<%= txt_TotalCompra.ClientID %>').value;
                var punidad = document.getElementById('<%= txt_UnidadCompra.ClientID %>').value;

                var resultado = parseInt(cantidad) * parseFloat(punidad);
                var res = parseFloat(resultado).toFixed(2);
                document.getElementById('<%= txt_TotalCompra.ClientID %>').value = res;
            } else {

                 var cantidad = document.getElementById('<%= txt_Cantidad.ClientID %>').value;
               var ptotal = document.getElementById('<%= txt_TotalCompra.ClientID %>').value;
                // var punidad = document.getElementById('<%= txt_UnidadCompra.ClientID %>').value;

                var resultado = parseFloat(ptotal) / parseInt(cantidad);
                var res = parseFloat(resultado).toFixed(2);
                 document.getElementById('<%= txt_UnidadCompra.ClientID %>').value = res;
            }
        }


         function CalculoUtilidad(indicador) {

            if(indicador == 1){
                var cantidad = document.getElementById('<%= txt_Cantidad.ClientID %>').value;
               // var ptotal = document.getElementById('<%= txt_TotalCompra.ClientID %>').value;
                var punidad = document.getElementById('<%= txt_UnidadCompra.ClientID %>').value;

                var resultado = parseInt(cantidad) * parseFloat(punidad);
                var res = parseFloat(resultado).toFixed(2);
                document.getElementById('<%= txt_TotalCompra.ClientID %>').value = res;
            } else {

                 var cantidad = document.getElementById('<%= txt_Cantidad.ClientID %>').value;
               var ptotal = document.getElementById('<%= txt_TotalCompra.ClientID %>').value;
                // var punidad = document.getElementById('<%= txt_UnidadCompra.ClientID %>').value;

                var resultado = parseFloat(ptotal) / parseInt(cantidad);
                var res = parseFloat(resultado).toFixed(2);
                 document.getElementById('<%= txt_UnidadCompra.ClientID %>').value = res;
            }
        }

    </script>





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

                                    <div class="title">
                                        INGRESO DE PRODUCTOS
                                        <hr />
                                    </div>
                                       

                                    <div class="row">
                                        
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Producto :</label>
                                               <asp:TextBox runat="server" Enabled="false" CssClass="form-control" ID="txt_Producto"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="btn-fill pull-right"">
                                                    <asp:Button  runat="server" CssClass="btn btn-info btn-fill pull-right" ID="txt_Resumen" Text="RESUMEN" />
                                            </div>
                                        </div>
                   
                                        
                                    </div>
                                    <div class="row">
                                        
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Cantidad :</label>
                                               <asp:TextBox runat="server" style="text-align:right" onkeyup="Calculo(1);" Text="0" onKeyPress="return acceptNum(event)" CssClass="form-control" ID="txt_Cantidad"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Precio Total Compra :</label>
                                               <asp:TextBox runat="server" style="text-align:right" Text="0.00" onkeyup="Calculo(2);" CssClass="form-control" ID="txt_TotalCompra"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Precio x Unidad :</label>
                                               <asp:TextBox runat="server" style="text-align:right" Text="0.00" onkeyup="Calculo(1);"  CssClass="form-control" ID="txt_UnidadCompra"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Utiidad x Unidad :</label>
                                               <asp:TextBox runat="server" style="text-align:right" Text="0.00"   CssClass="form-control" ID="txt_UtilidadUnidad"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Utilidad Total :</label>
                                               <asp:TextBox runat="server" style="text-align:right" Text="0.00"   CssClass="form-control" ID="txt_UtilidadTotal"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Total Precio Venta :</label>
                                               <asp:TextBox runat="server" style="text-align:right" Text="0.00"   CssClass="form-control" ID="txt_VentaTotal"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                        
                                  
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="btn-fill pull-right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                             <asp:Button runat="server" OnClientClick="return confirm('¿Esta seguro del ingreso?');" ID="btn_Agregar" CssClass="btn btn-info btn-fill pull-righ" Text="AGREGAR" OnClick="btn_Agregar_Click"  />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                            &nbsp;
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Button  runat="server" CssClass="btn btn-danger btn-fill pull-right" ID="btn_Limpiar" Text="LIMPIAR" OnClick="btn_Limpiar_Click"/>
                                                        </td>
                                                    </tr>
                                       
                                    
                                         
                                                </table>
                                            </div>
                                            </div>
                                    </div>

                                    <div class="title">
                                        ALMACEN:
                                        <hr />
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                
                                                

                                                                                        <asp:DataGrid ID="dg_Almacen" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="19"  AutoGenerateColumns="false"   OnDeleteCommand="dg_Almacen_DeleteCommand"  OnItemDataBound="dg_Almacen_ItemDataBound"    >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke" >
                                                                                                                   <%# Eval("CODIGO") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="FEC REG" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("FEC_REG") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="C. INGRESO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("CANTIDAD_INGRESO") %>                                                                                                 
                                                                                                                   <asp:Label runat="server" ID="lbl_cantidad_ingreso" Visible="false" Text='<%# Eval("CANTIDAD_INGRESO") %>'></asp:Label>  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="C. RESTANTE">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("CANTIDAD_VARIABLE") %>                                                                                                 
                                                                                                                   <asp:Label runat="server" ID="lbl_cantidad_variable" Visible="false" Text='<%# Eval("CANTIDAD_VARIABLE") %>'></asp:Label>  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="P.COMPRA S/.">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("PRECIO_UNIDAD") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                       
                                                                                                     <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="P. VENTA S/.">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("PRECIO_VENTA") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="ESTADO">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%" />
                                                                                                          <ItemTemplate>   
                                                                                                                    <asp:Label runat="server" ID="lbl_estado" Visible="false" Text='<%# Eval("ESTADO") %>'></asp:Label>                                                                                              
                                                                                                                   <%# Eval("EST") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      <asp:TemplateColumn HeaderText="ANULAR" HeaderStyle-ForeColor="Red"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="1%" />
                                                                                                          <ItemTemplate>
                                                                                                              <asp:TextBox runat="server" ID="txt_codigo_x" Text='<%# Eval("CODIGO") %>' Visible="false"></asp:TextBox>
                                                                                                              <asp:ImageButton runat="server" ImageUrl="~/images/borra.png" Width="20" CommandName="Delete" OnClientClick="return confirm('¿Estas seguro de anular este Ingreso?');" ToolTip="ANULAR" />
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
