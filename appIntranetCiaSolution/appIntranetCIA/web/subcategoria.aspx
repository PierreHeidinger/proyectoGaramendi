<%@ Page Title="" Language="C#" MasterPageFile="~/web/page.Master" AutoEventWireup="true" CodeBehind="subcategoria.aspx.cs" Inherits="appIntranetCIA.web.subcategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePage" runat="server">
    SUB-CATEGORIAS
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
                                        <div class="col-md-4">
                                            <div class="form-group">                                              
                                                            <label>CATEGORIA :</label>
                                                            <asp:DropDownList runat="server" ID="cbo_Categoria" CssClass="form-control"></asp:DropDownList> 
                                            </div>
                                        </div>
                                       
                                         

                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label> DESCRIPCION </label>
                                                <asp:TextBox runat="server" ID="txt_Descripcion" style="text-transform:uppercase" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-4" >
                                            <div class="form-group">
                                                <label style="color:white"> .................................................................................................................................... </label>
                                                <asp:Button runat="server" ID="btn_Agregar" Text="AGREGAR" CssClass="btn btn-info btn-fill pull-righ" OnClick="btn_Agregar_Click" />
                                            </div>
                                        </div>

                                    </div>

                                 

                                    <div class="row">
                                        
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>HISTORICO CLIENTE : </label>
                                            <!--    <div style="overflow:auto;height:370px"> -->
                                                                                              <asp:DataGrid ID="dg_SubCategorias" runat="server" Width="100%" CssClass="table table-hover table-striped"   
                                                                                                  PageSize="5"  AutoGenerateColumns="false" OnDeleteCommand="dg_SubCategorias_DeleteCommand" OnPageIndexChanged="dg_SubCategorias_PageIndexChanged" AllowPaging="True"   >                                                                                                                                                                                                                                                                                                                                 
                                                                                                  <HeaderStyle  Font-Bold="true"  ForeColor="White" BackColor="#1ABC9C"/>
                                                                                                  <Columns>
                                                                                                      <asp:TemplateColumn HeaderText="CODIGO">
                                                                                                          <HeaderStyle HorizontalAlign="Center" />
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="2%"  BackColor="#9abcc3"  />
                                                                                                          <ItemTemplate>
                                                                                                              <a style="color:whitesmoke" >
                                                                                                                   <%# Eval("COD_SUBCATEGORIA") %></a>                                                                                                  

                                                                                                          </ItemTemplate>


                                                                                                      </asp:TemplateColumn>
                                                                                                      <asp:TemplateColumn HeaderText="DESCRIPCION" HeaderStyle-HorizontalAlign="Center">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="5%"  />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%#   Eval("DESCRIPCION") %>                
                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="CANTEGORIA">
                                                                                                          <ItemStyle HorizontalAlign="Left" Width="1%" />
                                                                                                          <ItemTemplate>                                                                                                 
                                                                                                                   <%# Eval("CATEGORIA") %>                                                                                       
                                                                                                  

                                                                                                          </ItemTemplate>

                                                                                                      </asp:TemplateColumn>

                                                                                                      <asp:TemplateColumn>
                                                                                                          <ItemStyle HorizontalAlign="Center" Width="1%" />
                                                                                                          <ItemTemplate>
                                                                                                              <asp:TextBox runat="server" ID="cod_subCategoria_delete" Text='<%# Eval("COD_SUBCATEGORIA") %>' Visible="false"></asp:TextBox>
                                                                                                              <asp:ImageButton runat="server" ImageUrl="~/images/borra.png" Width="30" CommandName="Delete" OnClientClick="return confirm('¿Estas seguro de borrar esta catoria?');" ToolTip="BORRAR" />
                                                                                                          </ItemTemplate>
                                                                                                      </asp:TemplateColumn>                                                                                                     
                                                                                                        
                                                                                                      
                                                                                                        

                                                                                                  </Columns>
                                                                                                 <PagerStyle Mode="NumericPages" HorizontalAlign="Left" 
                                                                                                                    VerticalAlign="Middle" 
                                                                                                                Font-Size="14pt" Wrap="True" BorderStyle="None"    />
                                                                                                   
                                                                                              </asp:DataGrid>
                                            <!--     </div> -->
                                            </div>
                                        </div>

                                    </div>






                                                                              
                                   
                                    <div class="clearfix"></div>
                            </div>
                            
                        </div>
                    </div>








</asp:Content>
