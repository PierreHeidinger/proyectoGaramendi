<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="ventas_detalle.aspx.cs" Inherits="appIntranetCIA.web.ventas_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    ::VENTAS::
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <script>

        function openModal() {
            $('#modalSignUp').modal({ show: true });
        }

        function openModalP() {
            $('#modalProductos').modal({ show: true });
        }

        function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }

        function des() {
            document.getElementById('a_Productos').style.display = "none";
        }


        function acceptNum(evt) {
            var nav4 = window.Event ? true : false;
            // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
            var key = nav4 ? evt.which : evt.keyCode;
            return (key <= 13 || (key >= 48 && key <= 57) || key == 46);
        }



    </script>

    <asp:ScriptManager runat="server"></asp:ScriptManager>

    
     <div class="col-md-12">
                
                                                <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
               

    </div>
    <div class="col-md-12">
                                   <div class="form-group">
                                       
                                        <asp:Button runat="server" ID="btn_Ventas" OnClick="btn_Ventas_Click" Text="VENTAS" Width="130" CssClass="btn btn-warning btn-fill"  />
                                        <asp:Button runat="server" ID="btn_Consolidado" OnClick="btn_Consolidado_Click" Text="CONSOLIDADO" Width="130" CssClass="btn btn-default btn-fill"  />
                                        <asp:Button runat="server" ID="btn_Boleta" Text="BOLETA" Width="130" CssClass="btn btn-default btn-fill"  />
                                        <asp:Button runat="server" ID="btn_Factura" Text="FACTURA" Width="130" CssClass="btn btn-default btn-fill"  />
                                        <asp:Button runat="server" ID="btn_Guia" Text="GUIA R." Width="130" CssClass="btn btn-default btn-fill"  />                                      
                                       
                                   </div>                                   
                             </div>  

     <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                
                                
                            </div>

                            
                            <div class="content">


                                   
                                 

                                    <div class="row">
                                        
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <table>

                                                    <tr>
                                                        <td style="width:120%">
                                                                       <label> CLIENTE : </label>
                                                                      <asp:Label runat="server" CssClass="form-control" ID="lbl_Cliente"></asp:Label>
                                                                      <asp:Label runat="server" Visible="false" ID="lbl_cods_prod" CssClass="form-control"></asp:Label>
                                                        </td>
                                                        <td>
                                                              <asp:label runat="server" ID="lbl_codigo_cliente" style="color:white">0</asp:label>
                                                              <a onclick="openModal();"> <img src="../images/cliente.png" style="width:35px" runat="server" id="a_Clientes" /></a>
                                                        </td>
                                                        

                                                    </tr>
                                                </table>
                                     
                                              
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label> ESTADO : </label>
                                                <asp:RadioButtonList runat="server"  ID="rdo_Estado" OnSelectedIndexChanged="rdo_Estado_SelectedIndexChanged" AutoPostBack="true" onclick="return confirm('¿Esta seguro de continuar?')" ForeColor="RosyBrown">
                                                    <asp:ListItem Value="1"> EMITIDO </asp:ListItem>
                                                     <asp:ListItem Value="2">POR COBRAR</asp:ListItem>
                                                     <asp:ListItem Value="3"> CONFORME</asp:ListItem>
                                                     <asp:ListItem Value="4"> ANULADA</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label> VENTA Nª : </label>
                                                <asp:Label runat="server" CssClass="label label-danger"  ID="lbl_Codigo"></asp:Label> <br />
                                                <br />
                                              
                                                 <asp:Label runat="server" ID="lbl_Fecha_actual"></asp:Label> <br />
                                            </div>
                                        </div>
                                    </div>






                                                                              
                                   
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>

        <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                
                                
                            </div>

                            
                            <div class="content">


                                   <div class="row">

                                       <div class="col-md-12">
                                           <div class="form-group">
                                               <div class="col-md-4">
                                                    <a onclick="openModalP();"> <img src="../images/package_add_256.png"  style="width:35px" id="a_Productos" /></a>
                                                    <label>Agreagar Productos...</label>
                                                   </div>
                                                <div class="col-md-8">
                                                       <div class="btn-fill pull-right">
                                                        <label style="color:black">DISGREGAR IGV.</label>
                                                         <asp:RadioButtonList runat="server" ID="rdo_IGV" AutoPostBack="true" RepeatDirection="Horizontal" Font-Bold="true" OnSelectedIndexChanged="rdo_IGV_SelectedIndexChanged">
                                                             <asp:ListItem Value="1">SI</asp:ListItem>
                                                             <asp:ListItem Value="2" Selected="True">NO</asp:ListItem>
                                                         </asp:RadioButtonList>
                                                    </div>
                                                   </div>
                                            </div>
                                            
                                       </div>

                                   </div>
                                 

                                    <div class="row">
                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                              
                                                <div style="BORDER-BOTTOM-STYLE: inset; BORDER-RIGHT-STYLE: inset; WIDTH: 100%; BORDER-TOP-STYLE: inset; HEIGHT: 240px; BORDER-LEFT-STYLE: inset; OVERFLOW: auto">
                                                    <asp:GridView runat="server" ID="gv_Ventas" CssClass="table table-hover table-striped" AutoGenerateColumns="false" OnRowCommand="gv_Ventas_RowCommand">
                                                        <HeaderStyle BackColor="LightGray"  HorizontalAlign="Center"/>
                                                        <Columns>
                                                            
                                                            <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" />
                                                            <asp:BoundField DataField="PRODUCTO" HeaderText="PRODUCTO" />
                                                            <asp:TemplateField HeaderText="CANTIDAD">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txt_Cantidad_c" onKeyPress="return checkIt(event)" AutoPostBack="true" OnTextChanged="txt_Cantidad_c_TextChanged" Text ='<%# Eval("CANTIDAD") %>' style="text-align:center" Width="30px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="PRECIO U. S/.">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txt_Precio_u" onKeyPress="return acceptNum(event)" AutoPostBack="true" OnTextChanged="txt_Precio_u_TextChanged"  Text ='<%# Eval("PRECIO_V") %>' style="text-align:center" Width="60px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="UTILIDAD U. S/.">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txt_Utilidad_u"  onKeyPress="return acceptNum(event)" AutoPostBack="true" OnTextChanged="txt_Precio_u_TextChanged"  Text ='<%# Eval("UTILIDAD_UNIDAD") %>' style="text-align:center" Width="60px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="TOT. UTILI S/.">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txt_total_u" ReadOnly="true" onKeyPress="return acceptNum(event)"  AutoPostBack="true" OnTextChanged="txt_Precio_u_TextChanged"  Text ='<%# Eval("UTILIDAD_TOTAL_X") %>' style="text-align:center" Width="60px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="TOTAL V. S/.">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox runat="server" ID="txt_PrecioVenta" ReadOnly="true" BackColor="Salmon" Text ='<%# Eval("PRECIO_V") %>' style="text-align:center" Width="60px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField >
                                                                <ItemStyle HorizontalAlign="Center" BackColor="Goldenrod" />
                                                                <ItemTemplate>
                                                                       <asp:ImageButton  ImageUrl="~/images/borra.png" ID="img_eliminar" runat="server" CommandName="BORRAR" CommandArgument='<%# Eval("CODIGO") %>' Width="15" OnClientClick="return confirm('¿Desea quitar este producto de la venta?')"/>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>

                                                    </asp:GridView>
                                                </div>
                                              
                                            </div>
                                        </div>

                                        
                                      </div>

                                      <div class="row">

                                       <div class="col-md-12">
                                           <div class="form-group">
                                             
                                               <div class="col-md-2">
                                                   <label style="color:black">CANTIDAD TOTAL:</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right" Text="0" CssClass="form-control" ReadOnly="true" ID="txt_cantidad_total"></asp:TextBox>
                                               </div>
                                               <div class="col-md-2">
                                                   <label style="color:black">P.COMPRA TOTAL:</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right" Text="0.00" CssClass="form-control" ReadOnly="true" ID="txt_precio_c_total"></asp:TextBox>
                                               </div>
                                               <div class="col-md-2">
                                                   <label style="color:black">UTILIDAD TOTAL:</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right"  Text="0.00" CssClass="form-control" ReadOnly="true" ID="txt_utilidad_t"></asp:TextBox>
                                               </div> 
                                               <div class="col-md-2">
                                                   <label style="color:black">IGV:</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right"  Text="0.00" CssClass="form-control" ReadOnly="true" ID="txt_IGV"></asp:TextBox>
                                               </div> 
                                               <div class="col-md-2">
                                                   <label style="color:black">VENTA TOTAL:</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right"  Text="0.00" CssClass="form-control" ReadOnly="true" ID="txt_Total_venta"></asp:TextBox>
                                               </div>         
                                                <div class="col-md-2">
                                                   <label style="color:black">VENTA TOTAL + IGV :</label>
                                                   <asp:TextBox runat="server" BackColor="LightGray" style="text-align:right"  Text="0.00" CssClass="form-control" ReadOnly="true" ID="txt_Venta_Total_igv"></asp:TextBox>
                                               </div>                                      

                                            </div>
                                       </div>

                                      </div>






                                                                              
                                   
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>


     <div class="col-md-12">
                                   <div class="form-group">
                                       
    
    
                                  <div class="btn-fill pull-right">
                                      <table>
                                          <tr>
                                              <td>
                                                   <asp:Button  runat="server" CssClass="btn btn-danger btn-fill pull-right" ID="btn_Cancelar" Text="CANCELAR" />
                                              </td>
                                              <td>
                                                  &nbsp;
                                                  &nbsp;
                                              </td>
                                              <td>
                                                  <asp:Button  runat="server" CssClass="btn btn-success btn-fill pull-right" ID="btn_Grabar" Text="GRABAR" OnClick="btn_Grabar_Click" />
                                              </td>
                                          </tr>
                                      </table>
                                                    
                                                    
                                                    
                                            
                                    </div>
    </div>
         </div>
    
    
    

    







                     <div id="modalSignUp" class="modal" data-backdrop="false" >
                            <div class="modal-dialog">
                            <div class="modal-content" style="width:150%;margin-left:-180px;margin-top:100px">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                                
                            </div>
                            <div class="modal-body"> 
                              
                              

                                   
                                             <div class="row">
                                                 <div class="col-md-12" >

                                                     <div class="form-group">


                                                         <div class="col-md-6">
                         
                                                             <asp:TextBox runat="server" CssClass="form-control" onkeydown="return (event.keyCode!=13);"  placeHolder="Ingrese la Descripcion del Cliente...." ID="txt_Descripcion_cliente"></asp:TextBox>
                                                         </div>
                                                         <div class="col-md-6">
                                                             <div class="btn-fill pull-right">
                                                                 <asp:Button  runat="server" ID="btn_Buscar_Cliente" Text="BUSCAR" OnClick="btn_Buscar_cliente_Click"  Enabled="true" ViewStateMode="Enabled"  CssClass="btn btn-danger btn-fill pull-right"/>
                                                                 </div>
                                                         </div>                 
                                                     </div>

                                                 </div>
            
                                            </div>        
                                             <hr />
                                  <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                             <div class="row">
                                                 <div class="col-md-12" >

                                                     <div class="form-group">
                                                        
                                                         <div style="BORDER-BOTTOM-STYLE: inset; BORDER-RIGHT-STYLE: inset; WIDTH: 100%; BORDER-TOP-STYLE: inset; HEIGHT: 340px; BORDER-LEFT-STYLE: inset; OVERFLOW: auto">
                                                                                        <asp:GridView runat="server" ID="gv_CLientes" CssClass="table table-hover table-striped" AutoGenerateColumns="false" OnRowCommand="gv_CLientes_RowCommand" >
                                                                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#1ABC9C"></HeaderStyle>
                                                                                            <Columns>
                                                                                                
                                                                                               
                                                                                                <asp:TemplateField HeaderText="CODIGO">
                                                                                                    <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("COD_CLIENTE") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="CLIENTE">
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("CLIENTE") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="DOCUMENTO">
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("DNI_RUC_CLI") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                
                                                                                                 <asp:TemplateField>
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                    <ItemTemplate>
                                                                                                       <asp:Label runat="server" ID="lbl_codigo_x" Visible="false" Text='<%#Eval("COD_CLIENTE") %>'></asp:Label>
                                                                                                      <asp:CheckBox runat="server" ID="ckb_selected"  onclick="CheckOne(this)" />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                
                                                                                            </Columns>
                                                                                            
                                                                                        </asp:GridView>
                                                                                    </div>

                                                     </div>

                                                 </div>
         
                                            </div>      
         
         
   
                            
                             </ContentTemplate>
                                      <Triggers>
                                          <asp:AsyncPostBackTrigger ControlID="btn_Buscar_Cliente" EventName="Click" />
                                          
                                      </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                        <asp:Button runat="server" ID="btn_Cargar" OnClick="btn_Cargar_Click" CssClass="btn btn-info"  Text="CARGAR" />
                                                        
                                    </div>
                            </div>
                               
                            </div>
                            </div>
                            </div>

                     <div id="modalProductos" class="modal" data-backdrop="false" >
                            <div class="modal-dialog">
                            <div class="modal-content" style="width:150%;margin-left:-180px;margin-top:100px">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                                
                            </div>
                            <div class="modal-body"> 
                              
                              

                                   
                                             <div class="row">
                                                 <div class="col-md-12" >

                                                     <div class="form-group">


                                                         <div class="col-md-6">
                         
                                                             <asp:TextBox runat="server" CssClass="form-control" onkeydown="return (event.keyCode!=13);"  placeHolder="Ingrese la Descripcion del Producto...." ID="txt_descripcion_producto"></asp:TextBox>
                                                         </div>
                                                         <div class="col-md-6">
                                                             <div class="btn-fill pull-right">
                                                                 <asp:Button  runat="server" ID="btn_BuscarProductos" Text="BUSCAR" OnClick="btn_BuscarProductos_Click"   Enabled="true" ViewStateMode="Enabled"  CssClass="btn btn-danger btn-fill pull-right"/>
                                                                 </div>
                                                         </div>                 
                                                     </div>

                                                 </div>
            
                                            </div>        
                                             <hr />
                                  <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                             <div class="row">
                                                 <div class="col-md-12" >

                                                     <div class="form-group">
                                                        
                                                         <div style="BORDER-BOTTOM-STYLE: inset; BORDER-RIGHT-STYLE: inset; WIDTH: 100%; BORDER-TOP-STYLE: inset; HEIGHT: 340px; BORDER-LEFT-STYLE: inset; OVERFLOW: auto">
                                                                                        <asp:GridView runat="server" ID="gv_Productos" CssClass="table table-hover table-striped" AutoGenerateColumns="false" OnRowCommand="gv_CLientes_RowCommand" >
                                                                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" ForeColor="White" BackColor="#1ABC9C"></HeaderStyle>
                                                                                            <Columns>
                                                                                                
                                                                                               
                                                                                                <asp:TemplateField HeaderText="CODIGO">
                                                                                                    <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label runat="server" Text='<%# Eval("CODIGO") %>' ID="lbl_codigo_p"></asp:Label>
                                                                                                        
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="FECHA ING.">
                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("FEC") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="PRODUCTO">
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("DESCRIPCION") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="U. RESTANTES" HeaderStyle-HorizontalAlign="Right">
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("CANTIDAD_VARIABLE") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                               
                                                                                                <asp:TemplateField HeaderText="PRECIO S/." HeaderStyle-HorizontalAlign="Right">
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                    <ItemTemplate>
                                                                                                        <%# Eval("PRECIO") %>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>

                                                                                                
                                                                                                 <asp:TemplateField>
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                    <ItemTemplate>                                                                                                       
                                                                                                      <asp:CheckBox runat="server" ID="ckb_selected"  />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                
                                                                                            </Columns>
                                                                                            
                                                                                        </asp:GridView>
                                                                                    </div>

                                                     </div>

                                                 </div>
         
                                            </div>      
         
         
   
                            
                             </ContentTemplate>
                                      <Triggers>
                                          <asp:AsyncPostBackTrigger ControlID="btn_BuscarProductos" EventName="Click" />
                                          
                                      </Triggers>
                                </asp:UpdatePanel>
                                <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                        <asp:Button runat="server" ID="btn_Agregar_Productos" OnClick="btn_Agregar_Productos_Click" CssClass="btn btn-info"  Text="CARGAR" />
                                                        
                                    </div>
                            </div>
                               
                            </div>
                            </div>
                            </div>    

</asp:Content>
