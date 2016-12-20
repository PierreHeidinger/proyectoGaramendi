<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="clientes.aspx.cs" Inherits="appIntranetCIA.web.clientes" %>
<asp:Content ID="contectTitle" ContentPlaceHolderID="titlePage" runat="server">Clientes</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

                            <div class="col-md-12">
                            <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
                            </div>
                <div class="row">
                             
                            <div class="col-md-12">
                                   <div class="form-group">
                                       <asp:Button runat="server" Text="." Width="1" BackColor="#F9F5F5" Height="1" BorderStyle="None" />
                                        <asp:Button runat="server" ID="btn_Nuevo" Text="NUEVO" CssClass="btn btn-info btn-fill" OnClick="btn_Nuevo_Click" />
                                        <asp:Button runat="server" Text="IMPRIMIR" Visible="false" CssClass="btn btn-info btn-fill" />
                                       <asp:Button runat="server" ID="btn_ExportarExcel" Visible="false" Text="EXCEL" BackColor="#1ABC9C" CssClass="btn btn-default btn-fill pull-right" OnClick="btn_ExportarExcel_Click" />
                                   </div>                                   
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
                                                <asp:TextBox runat="server"  onKeyPress="return checkIt(event)"  CssClass="form-control" placeHolder="1002..." ID="txt_Codigo" OnTextChanged="txt_Codigo_TextChanged" AutoCompleteType="Disabled"></asp:TextBox>
                                                
                                            </div>
                                        </div>  

                                       <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Documento :</label>
                                                <asp:TextBox runat="server" onKeyPress="return checkIt(event)"  CssClass="form-control" placeHolder="087383831..." ID="txt_Documento" OnTextChanged="txt_Documento_TextChanged" AutoCompleteType="Disabled"></asp:TextBox>
                                                
                                            </div>
                                        </div>  

                                       <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Descripcion :</label>
                                                <asp:TextBox runat="server" CssClass="form-control" placeHolder="G y M ..." ID="txt_Descripcion" OnTextChanged="txt_Descripcion_TextChanged" AutoCompleteType="Disabled"></asp:TextBox>
                                                
                                            </div>
                                        </div>


                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Tipo :</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_TipoDocumento" OnSelectedIndexChanged="cbo_TipoDocumento_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="%">--TODOS--</asp:ListItem>
                                                    <asp:ListItem Value="1">Natural</asp:ListItem>
                                                    <asp:ListItem Value="2">Juridica</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>
                                        
                                      <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Estado :</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="cbo_Estado" OnSelectedIndexChanged="cbo_Estado_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="%">--TODOS--</asp:ListItem>
                                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                                    <asp:ListItem Value="2">Inactivo</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                            </div>
                                        </div>

                                </div>


                                
                            </div>
                            <div class="content">
                                
                                    <div style="overflow:auto;height:100%;width:100%">
                                                                                              <asp:DataGrid ID="DG_CLIENTES" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="19"  AutoGenerateColumns="false"  OnItemDataBound="DG_CLIENTES_ItemDataBound" >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke"   href="cliente_detalle.aspx?cod_cliente=<%# Eval("COD_CLIENTE") %>">
                                                                                                                   <%# Eval("COD_CLIENTE") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="FEC REG" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("FECHA_REG") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="CLIENTE">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="9%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("NOMBRES_X") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Left" HeaderText="TIPO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("TIPO_CLI") %>                                                                                                 
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                       
                                                                                                       
                                                                                                      <asp:TemplateColumn  HeaderStyle-HorizontalAlign="Left" HeaderText="DOCUMENTO">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="2%"   />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("DOCUMENTO") %>                                                                                                
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                     </asp:TemplateColumn>

                                                                                                      <asp:TemplateColumn  HeaderStyle-HorizontalAlign="Center" HeaderText="ESTADO">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"   />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("ESTADO") %>                                                                                                 
                                                                                                                   <asp:Label runat="server" Visible="false" ID="lbl_Estado" Text='<%# Eval("ESTADO") %>'></asp:Label>

                                                                                                          </ItemTemplate>

                                                                                                     </asp:TemplateColumn>

                                                                                                        

                                                                                                  </Columns>
                                                                                 
                                                                                              </asp:DataGrid>
                                                                                               </div>


                                   </div>
                                    
                                    <div class="clearfix"></div>
                                
                            </div>
                        </div>
       

</asp:Content>
