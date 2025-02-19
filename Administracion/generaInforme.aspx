<%@ Page Language="VB" AutoEventWireup="true" CodeFile="generaInforme.aspx.vb" Inherits="administracion_generaInforme" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>   


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generación de Informes</title>

</head>
<body>
    <form id="form1" runat="server">
        
<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelSeleccion" runat="server">
 <div>
   <asp:Label ID="Label1" runat="server" Text="Generación de Informes de venta de sorteo por vendedor"></asp:Label>
            
 </div>
<div>
</div>

     <div>
         <asp:RadioButtonList ID="orbInforme" runat="server" AutoPostBack="True" Height="16px" RepeatDirection="Horizontal" >
             <asp:ListItem Selected="True" Value="4">Cirugía</asp:ListItem>
             <asp:ListItem Value="2">Clinica Medica</asp:ListItem>
             <asp:ListItem Value="1">Nutricion</asp:ListItem>
             <asp:ListItem Value="3">Salud Mental</asp:ListItem>
             </asp:RadioButtonList>
         <asp:Label ID="olblHistoriaClinica" runat="server" Text="" Visible="false"></asp:Label>

      
     </div>

    <div>
<asp:Label ID="olblINFORMEFECHA" runat="server" Text="Fecha de Informe:" ></asp:Label>      
<asp:CalendarExtender ID="oceINFORMEFECHA" runat="server" TargetControlID="otxtINFORMEFECHA" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutINFORMEFECHAPopup">                       
</asp:CalendarExtender>  
<asp:TextBox ID="otxtINFORMEFECHA" CssClass="form-control" runat="server"></asp:TextBox>        
<asp:Button ID="obutINFORMEFECHAPopup" runat="server" CssClass="obut-ocal-popup-button" />       


    </div>

    <div>
        <asp:Button ID="obutFormatoImpresion" runat="server" Text="Formato Impresion" ToolTip ="Al presionar este botón se ocultan los argumentos de búsqueda para imprimir de manera limpia el informe"  />

    </div>
        </asp:Panel>

         <% Response.Write(armarquilombo(Session("idOperador"), Session("idOperador")))%> 
         
    </form>
</body>
</html>
