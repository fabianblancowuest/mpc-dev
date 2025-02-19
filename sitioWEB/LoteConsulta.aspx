<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoteConsulta.aspx.vb" Inherits="sitioWEB_LoteConsulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap-pachu-cemmi.css" rel="stylesheet" />
    <title>Consulta de lotes Mi Primer Casa</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="olblBarrio" runat="server" Text="Barrio:" CssClass="control-label"></asp:Label>        
        </div>
        <div>
          <asp:Label ID="Label1" runat="server" Text="Manzana:" CssClass="control-label"></asp:Label>        
        </div>

          <div>
          <asp:Label ID="Label2" runat="server" Text="Parcela:" CssClass="control-label"></asp:Label>        
        </div>
            <div>
                   <br />
          <asp:Label ID="Label4" runat="server" Text="Características del terreno:" CssClass="control-label"></asp:Label>        
        </div>
          <div>
     
          <asp:Label ID="Label5" runat="server" Text="Metros de frente:" CssClass="control-label"></asp:Label>        
        </div>
          <div>
     
          <asp:Label ID="Label6" runat="server" Text="Metros de Fondo:" CssClass="control-label"></asp:Label>        
        </div>
          <div>
           <asp:Label ID="Label7" runat="server" Text="Monto de Adhesión:" CssClass="control-label"></asp:Label>        
        </div>
          <div>
 
          <asp:Label ID="Label8" runat="server" Text="Monto total en bolsas de cemento:" CssClass="control-label"></asp:Label>        
        </div>
         <div>
          <asp:Label ID="Label9" runat="server" Text="Plazos disponibles de financiación:" CssClass="control-label"></asp:Label>        
        </div>

       
        <div>
            <br />
               <asp:Label ID="Label3" runat="server" Text="Si lo desea, podemos ponerlo en contacto con un representante que podrá satisfacer todas sus inquietudes:" CssClass="control-label"></asp:Label>        
 

        </div>
         <div>
              <asp:Panel ID="PanelBotones" runat="server" Visible="true">
               <asp:Button ID="obutDeseaAsesoramiento" runat="server" Text="Desea asesoramiento? " CssClass="btn btn-success"  />
       
               <asp:Button ID="obutNoDeseaAsesoramiento" runat="server" Text="No desea asesoramiento " CssClass="btn btn-danger"  />
        </asp:Panel>  

         </div>
         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
             <div>
             <asp:Label ID="Label10" runat="server" Text="Apellido y Nombres:" CssClass="control-label"></asp:Label>        
                <asp:TextBox ID="otxtOPERADORCODIGO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>     
       
                 
                  </div>
          <div>
           <asp:Label ID="Label11" runat="server" Text="Número de Celular de contacto " CssClass="control-label"></asp:Label>        
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>     
              
              
               </div>
          <div>
 
          <asp:Label ID="Label12" runat="server" Text="Correo electrónico:" CssClass="control-label"></asp:Label>        

                       <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>     
        </div>
     <div>
 
          <asp:Label ID="olblMensaje" runat="server" Text="" CssClass="control-label"></asp:Label>        

                     
        </div>     
 <div>

               <asp:Button ID="Button1" runat="server" Text="Enviar solicitud de asesoramiento a representante " CssClass="btn btn-success"  />
         
               <asp:Button ID="Button2" runat="server" Text="Volver" CssClass="btn btn-danger"  />
        </div>
         </asp:Panel>
    </form>
</body>
</html>
