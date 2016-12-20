<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="categoria.aspx.cs" Inherits="appIntranetCIA.web.categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    Inventario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="col-md-12">
                
                                                <asp:Literal runat="server" ID="lt_Notificacion"></asp:Literal>
               

    </div>
    <div class="col-md-12">
                                   <div class="form-group">
                                       
                                        <asp:Button runat="server" ID="btn_Inventario" Text="INVENTARIO" CssClass="btn btn-warning btn-fill" OnClick="btn_Inventario_Click"  />
                                        
                                       
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
                                                <table>
                                                    <tr>
                                                        <td style="width:70%">
                                                            <label>CATEGORIA :</label>
                                                            <asp:TextBox runat="server" ID="txt_Categoria" AutoCompleteType="Disabled" style="text-transform:uppercase" CssClass="form-control"></asp:TextBox>
                                                        </td>  
                                                        <td>
                                                            &nbsp;
                                                        </td>                                                   
                                                        <td style="vertical-align:bottom">
                                                            
                                                            <asp:Button runat="server" ID="btn_Agregar" Text="AGREGAR" CssClass="btn btn-info btn-fill pull-righ" OnClick="btn_Agregar_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                                
                                            </div>
                                        </div>
                                       
                                         

                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                
                                            </div>
                                        </div>

                                    </div>

                                 

                                    <div class="row">
                                        
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>HISTORICO CLIENTE : </label>
                                                <div style="overflow:auto">
                                                                                              <asp:DataGrid ID="dg_Categorias" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="19"  AutoGenerateColumns="false" OnDeleteCommand="dg_Categorias_DeleteCommand"   >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke" >
                                                                                                                   <%# Eval("COD_CATEGORIA") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="DESCRIPCION" HeaderStyle-HorizontalAlign="Left">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="5%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("DESCRIPCION") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="SUB-CANTEGORIAS">
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="1%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("CANTIDAD") %>                                                                                       
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      <asp:TemplateColumn>
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="1%" />
                                                                                                          <ItemTemplate>
                                                                                                              <asp:TextBox runat="server" Text='<%# Eval("COD_CATEGORIA") %>' Visible="false" ID="txt_Codigo_dg"></asp:TextBox>
                                                                                                              <asp:ImageButton runat="server" CommandName="Delete" ImageUrl="~/images/borra.png" Width="30" OnClientClick="return confirm('¿Estas seguro de borrar esta catoria?');" ToolTip="BORRAR" />
                                                                                                          </ItemTemplate>
                                                                                                      </asp:TemplateColumn>                                                                                                     
                                                                                                        
                                                                                                     
                                                                                                        

                                                                                                  </Columns>
                                                                                 
                                                                                              </asp:DataGrid>
                                                 </div>
                                            </div>
                                        </div>

                                    </div>






                                                                              
                                   
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>













</asp:Content>
