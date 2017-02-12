<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consolidado.aspx.cs" Inherits="appIntranetCIA.web.documentos.consolidado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Formulario </title>
    <style type="text/css">
        .auto-style4 {
            width: 133px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style8 {
            width: 206px;
        }
        .auto-style10 {
            width: 393px;
        }
        .auto-style11 {
            width: 71px;
        }
        .auto-style12 {
            width: 335px;
        }
        .auto-style13 {
            width: 861px;
            height: 192px;
        }
    </style>
</head>
<body>
<form runat="server">
   
    <asp:Panel runat="server" ID="pnFactura" Visible="true" Width="883px">
        
         <h2>FORMULARIO PARA FACTURA</h2>
        <hr />
        <table border="0" class="auto-style13">

            <tr>
                <td class="auto-style8">CLIENTE :</td>
                <td colspan="5"><asp:Label runat="server" ID="lbl_Cliente"></asp:Label> </td>                 
            </tr>
            <tr>
                <td class="auto-style8">DIRECCION : </td>
                <td colspan="5"><asp:Label runat="server" ID="lbl_Direccion"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style8">RUC :</td>
                <td class="auto-style11"> <asp:Label runat="server" ID="lbl_Ruc"></asp:Label></td>
                <td class="auto-style12">Cond. PAGO :</td>
                <td class="auto-style4"><asp:TextBox runat="server" ID="lbl_cp"></asp:TextBox> </td>
            </tr>

            <tr>
                <td class="auto-style8">VENDEDOR :</td>
                <td class="auto-style11"><asp:TextBox runat="server" ID="lbl_Vendedor"></asp:TextBox></td>
                <td class="auto-style12">ORDEN C. :</td>
                <td class="auto-style4"><asp:TextBox runat="server" ID="lbl_Orden"></asp:TextBox></td>
                <td class="auto-style10">GUIA REM&nbsp; Nª</td>
                <td><asp:TextBox runat="server" ID="lbl_n_guia" CssClass="auto-style6"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style8">FECHA :</td>
                <td class="auto-style11"><%= DateTime.Now.ToShortDateString() %></td>
                <td class="auto-style8">Nª LETRAS : :</td>
                <td class="auto-style11"><asp:TextBox runat="server" ID="lbl_letras"></asp:TextBox></td>
                <td> MONEDA :</td>
                <td> <asp:DropDownList runat="server" ID="cbo_modena">
                    <asp:ListItem Selected="True" Value="S/.">SOLES</asp:ListItem>
                    <asp:ListItem Value="$ ">DOLARES</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>

        </table>
        <hr />
        
        <asp:Button runat="server" Font-Bold="true" BackColor="WindowFrame" BorderColor="WindowText" Width="150" ID="btn_Render" Text="LISTO" OnClick="btn_Render_Click" />

    </asp:Panel>
     
    <asp:Panel runat="server" ID="pnBoleta" Visible="false" Width="883px">
        
         <h2>FORMULARIO PARA Boleta</h2>
        <hr />
        <table border="0" class="auto-style13">

            <tr>
                <td class="auto-style8">Nª GUIA :</td>
                <td>  <asp:TextBox runat="server" ID="lbl_guia"></asp:TextBox> </td>                 
            </tr>
            <tr>
                <td class="auto-style8">TOTAL LETRAS : </td>
                <td><asp:TextBox runat="server" ID="lbl_totalletras"></asp:TextBox></td>
            </tr>
            

            <tr>
                <td class="auto-style8">MONEDA :</td>
                <td>
                    <asp:DropDownList ID="cbo_modena_boleta" runat="server" Height="16px" Width="129px">
                        <asp:ListItem Selected="True" Value="S/.">SOLES</asp:ListItem>
                        <asp:ListItem Value="$ ">DOLARES</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            

        </table>
        <hr />
        
        <asp:Button runat="server" Font-Bold="true" BackColor="WindowFrame" BorderColor="WindowText" Width="150" ID="btnBoleta" OnClick="btnBoleta_Click" Text="LISTO" />

    </asp:Panel>
</form>
</body>
</html>
