<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="appIntranetCIA.web.login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    


    <title> ::GARAMENDI::</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Majestic Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- font files -->
    <link href='//fonts.googleapis.com/css?family=Muli:400,300,300italic,400italic' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Comfortaa:400,300,700' rel='stylesheet' type='text/css'/>
    <!-- /font files -->
    <!-- css files -->
    <link href="../../Content/login/css/animate-custom.css" rel="stylesheet" />
    <link href="../../Content/login/css/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        
                    <br />
                    <br />
                    <br />
                    <br />
                    
                           		
                    <div id="container_demo" >
                        <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                        <a class="hiddenanchor" id="toregister"></a>
                        <a class="hiddenanchor" id="tologin"></a>
                        <div id="wrapper">
                            <div id="login" class="animate form">
			                     
                                
                                <asp:Login runat="server" ID="login1" OnAuthenticate="login_Authenticate"> 
                                <LayoutTemplate>
                                    <h2>Ingreso Intranet</h2> 
                                                <p> 
                                    <label for="username" class="uname" data-icon="u" ><span>Usuario</span></label>
                                   <asp:TextBox runat="server" CssClass="field" placeHolder="Enter Username" ID="UserName" ></asp:TextBox>
                                     <asp:RequiredFieldValidator runat="server" ID="UserNameRequerid" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio"></asp:RequiredFieldValidator>
                                    </p>
                                    <p> 
                                    <label for="password" class="youpasswd" data-icon="p"><span>Password</span></label>
                                    <asp:TextBox runat="server" CssClass="field" TextMode="Password"  placeHolder="Enter Password" ID="Password" ></asp:TextBox>    
                                        <asp:RequiredFieldValidator runat="server"  ID="PasswordRequerid" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria"></asp:RequiredFieldValidator>
                                    </p>         
                                   <p class="login button">
                      
                                         <asp:Literal ID="FailureText" runat="server" EnableViewState="false"></asp:Literal>
                                  <asp:Button runat="server" CssClass="flat-button signin" ID="LoginButton" CommandName="login"  Text="Log in" ValidationGroup="ctl06" />
                                   </p>   
                                </LayoutTemplate>
                              </asp:Login> 



                            </div>
		                    
	                    </div>
                    </div>
                    <p class="agileits">© <%= DateTime.Today.Year.ToString() %> UNITEC-PERU  All Rights Reserved </p> 


    </form>
</body>
</html>
