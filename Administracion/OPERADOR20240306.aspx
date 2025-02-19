<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="OPERADOR20240306.aspx.vb" Inherits="STRSYSTEM_Administracion_OPERADOR20240306" title="Tratamiento Tabla OPERADORES DEL SISTEMA" Culture="es-AR"                            %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblOPERADORTitulo" runat="server" Text="OPERADORES DEL SISTEMA"></asp:Label>            
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                    <asp:Label ID="olblBuscar" runat="server" Text="Localizar"   ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR "></asp:Label>
                        <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>    
                        <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-default" /> 
                 </div>  
                 <div>

              <asp:SqlDataSource ID="odsOPERADOR" runat="server"  
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="OPERADORTRAERCADENA" SelectCommandType="StoredProcedure">           
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvOPERADOR" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" PageSize="15" PagerStyle-CssClass="pgr"         
                  DataKeyNames="IDOPERADOR,OPERADORCODIGO,OPERADORDESCRIPCION,OPERADORPASSWORD,OPERADOROBSERVACION,OPERADORTERMINAL,OPERADORULTIMOLOGIN,OPERADORESTADO,ESSUPERVISOR,IDSUPERVISOR,IDSORTEOCOMISION" 
               DataSourceID="odsOPERADOR"  
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" Font-Size="XX-Small" >
                 <AlternatingRowStyle CssClass="alt" />
                 <Columns>
                     <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                     <asp:BoundField DataField="IDOPERADOR" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IDOPERADOR" visible="False" />
                     <asp:BoundField DataField="OPERADORCODIGO" HeaderText="CORREO ELECTRÓNICO" SortExpression="OPERADORCODIGO" />
                     <asp:BoundField DataField="OPERADORDESCRIPCION" HeaderText="DESCRIPCION DEL OPERADOR" SortExpression="OPERADORDESCRIPCION" />
                     <asp:BoundField DataField="OPERADORPASSWORD" HeaderText="CONTRASEÑA" SortExpression="OPERADORPASSWORD" Visible="False" />
                     <asp:BoundField DataField="OPERADOROBSERVACION" HeaderText="OBSERVACIONES" SortExpression="OPERADOROBSERVACION" />
                     <asp:BoundField DataField="OPERADORTERMINAL" HeaderText="NÚMERO DE CELULAR" SortExpression="OPERADORTERMINAL" />
                     <asp:BoundField DataField="OPERADORULTIMOLOGIN" DataFormatString="{0:d}" HeaderText="ULTIMO ACCESO" SortExpression="OPERADORULTIMOLOGIN" />
                     <asp:TemplateField HeaderText="ESTADO DEL OPERADOR (ACTIVO / INACTIVO)" SortExpression="OPERADORESTADO">
                         <ItemTemplate>
                             <asp:CheckBox ID="OPERADORESTADOBox" runat="server" Checked='<% # Bind("OPERADORESTADO") %>' Enabled="false" />
                         </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="ES SUPERVISOR ?" SortExpression="ESSUPERVISOR">
                         <ItemTemplate>
                             <asp:CheckBox ID="ESSUPERVISORBox" runat="server" Checked='<% # Bind("ESSUPERVISOR") %>' Enabled="false" />
                         </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="IDSUPERVISOR" HeaderText="SUPERVISOR" InsertVisible="False" ReadOnly="True" SortExpression="IDSUPERVISOR" visible="False" />
                     <asp:BoundField DataField="IDSORTEOCOMISION" HeaderText="ESCALA COMISION SORTEO" InsertVisible="False" ReadOnly="True" SortExpression="IDSORTEOCOMISION" visible="False" />
                     <asp:BoundField DataField="supervisor" HeaderText="Supervisor" SortExpression="supervisor" />
                     <asp:BoundField DataField="Comision" HeaderText="Cosision" SortExpression="Comision" />
                 </Columns>
                 <PagerStyle CssClass="pgr" />
             </asp:GridView>    
              
          </div>
          </div>
 <br/>
 <br/>
 
 
 <div class="row">
     <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-success" />
 
 </div>
 
 </asp:Panel> 

    
 <asp:Panel ID="PanelAlta" runat="server" Visible="false">
<form class="form" role="form">

<div class="form-group">
            <asp:Label ID="olblIDOPERADOR" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORCODIGO" runat="server" Text="CORREO ELECTRÓNICO:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtOPERADORCODIGO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORDESCRIPCION" runat="server" Text="DESCRIPCION DEL OPERADOR:" CssClass="control-label"></asp:Label>                
         <asp:TextBox ID="otxtOPERADORDESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORPASSWORD" runat="server" Text="CONTRASEÑA:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtOPERADORPASSWORD" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblOPERADOROBSERVACION" runat="server" Text="OBSERVACIONES:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtOPERADOROBSERVACION" runat="server" CssClass="form-control" MaxLength="80"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORTERMINAL" runat="server" Text="NÚMERO DE CELULAR:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtOPERADORTERMINAL" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORULTIMOLOGIN" runat="server" Text="ULTIMO ACCESO:" CssClass="control-label"></asp:Label>           
<asp:CalendarExtender ID="oceOPERADORULTIMOLOGIN" runat="server" TargetControlID="otxtOPERADORULTIMOLOGIN" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutOPERADORULTIMOLOGINPopup">                             
</asp:CalendarExtender>  
<asp:TextBox ID="otxtOPERADORULTIMOLOGIN" CssClass="form-control" runat="server"></asp:TextBox>          
<asp:Button ID="obutOPERADORULTIMOLOGINPopup" runat="server" CssClass="obut-ocal-popup-button" />         
</div>
<div class="form-group">
<asp:Label ID="olblOPERADORESTADO" runat="server" Text="ESTADO DEL OPERADOR (ACTIVO / INACTIVO):" CssClass="control-label"></asp:Label>                
      <asp:CheckBox ID="otxtOPERADORESTADO" runat="server"  />      
</div>
<div class="form-group">
<asp:Label ID="olblESSUPERVISOR" runat="server" Text="ES SUPERVISOR ?:" CssClass="control-label"></asp:Label>         
      <asp:CheckBox ID="otxtESSUPERVISOR" runat="server"  />    
</div>
<div class="form-group">
<asp:Label ID="olblIDSUPERVISOR" runat="server" Text="SUPERVISOR:" CssClass="control-label"></asp:Label>       
                         <asp:SqlDataSource ID="odsSUPERVISOR" runat="server"      
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="SUPERVISORTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlSUPERVISOR" runat="server" DataSourceID="odsSUPERVISOR"   
                DataTextField="SUPERVISORDescripcion" DataValueField="IDSUPERVISOR" CssClass="form-control">     
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblIDSORTEOCOMISION" runat="server" Text="ESCALA COMISION SORTEO:" CssClass="control-label"></asp:Label>            
                         <asp:SqlDataSource ID="odsSORTEOCOMISION" runat="server"       
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="SORTEOCOMISIONTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>           
                        <asp:DropDownList ID="oddlSORTEOCOMISION" runat="server" DataSourceID="odsSORTEOCOMISION"      
                DataTextField="SORTEOCOMISIONDescripcion" DataValueField="IDSORTEOCOMISION" CssClass="form-control">        
            </asp:DropDownList> 
</div>

 <div class="col-sm-offset-2 col-sm-10">

               <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
               <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
       <br />
               <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success"  />
               <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
</div>               
</form> 




</asp:Panel> 
    

</asp:Content> 

 
