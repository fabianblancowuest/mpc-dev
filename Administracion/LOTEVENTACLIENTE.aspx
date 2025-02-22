
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="LOTEVENTACLIENTE.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTACLIENTE" title="Tratamiento Tabla CLIENTES POR VENTAS DE LOTES"                             %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblLOTEVENTACLIENTETitulo" runat="server" Text="CLIENTES POR VENTAS DE LOTES"></asp:Label>             
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE LOTEVENTA:"   CssClass="control-label"></asp:Label>       
             <asp:SqlDataSource ID="odsLOTEVENTAOperador" runat="server"      
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="LOTEVENTAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">               
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlLOTEVENTAOperador" runat="server" DataSourceID="odsLOTEVENTAOPERADOR"          
              DataTextField="LOTEVENTADescripcion" DataValueField="idLOTEVENTA" CssClass="form-control" AutoPostBack="True">         
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsLOTEVENTACLIENTE" runat="server"   
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="LOTEVENTACLIENTETRAERID" SelectCommandType="StoredProcedure">          
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlLOTEVENTAOperador" Name="idLOTEVENTA" PropertyName="SelectedValue" Type="Int16"  />       
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvLOTEVENTACLIENTE" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"          
                  DataKeyNames="IDLOTEVENTACLIENTE      ,IDLOTEVENTA    ,LOTEVENTACLIENTESECUENCIA         ,LOTEVENTACLIENTENOMBRE         ,LOTEVENTACLIENTEDNI      ,LOTEVENTACLIENTEDOMICILIO       ,LOTEVENTACLIENTETELEFONO         ,LOTEVENTACLIENTECORREO         ,IDCLIENTEIVA  ,LOTEVENTACLIENTECUIT      ,LOTEVENTACLIENTEOBSERVACION          " 
               DataSourceID="odsLOTEVENTACLIENTE"   
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDLOTEVENTACLIENTE" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTACLIENTE"/>
                     <asp:BoundField DataField="IDLOTEVENTA" HeaderText="Identitificacion de venta"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTA"/>
                     <asp:BoundField DataField="LOTEVENTACLIENTESECUENCIA" HeaderText="Secuencia de comprador"         
     SortExpression="LOTEVENTACLIENTESECUENCIA">         
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="LOTEVENTACLIENTENOMBRE" HeaderText="Apellido y nombre comprador"        
                        SortExpression="LOTEVENTACLIENTENOMBRE"/>  
                     <asp:BoundField DataField="LOTEVENTACLIENTEDNI" HeaderText="DNI"    
                        SortExpression="LOTEVENTACLIENTEDNI"/>
                     <asp:BoundField DataField="LOTEVENTACLIENTEDOMICILIO" HeaderText="Domicilio"     
                        SortExpression="LOTEVENTACLIENTEDOMICILIO"/>
                     <asp:BoundField DataField="LOTEVENTACLIENTETELEFONO" HeaderText="Telefono"       
                        SortExpression="LOTEVENTACLIENTETELEFONO"/>  
                     <asp:BoundField DataField="LOTEVENTACLIENTECORREO" HeaderText="Correo"       
                        SortExpression="LOTEVENTACLIENTECORREO"/>  
                     <asp:BoundField DataField="IDCLIENTEIVA" HeaderText="Condicion IVA"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDCLIENTEIVA"/>
                     <asp:BoundField DataField="LOTEVENTACLIENTECUIT" HeaderText="Numero de CUIL / CUIT"     
                        SortExpression="LOTEVENTACLIENTECUIT"/>
                     <asp:BoundField DataField="LOTEVENTACLIENTEOBSERVACION" HeaderText="OBSERVACIONES"              
                        SortExpression="LOTEVENTACLIENTEOBSERVACION"/>   
               </Columns>
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
            <asp:Label ID="olblIDLOTEVENTACLIENTE" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblIDLOTEVENTA" runat="server" Text="Identitificacion de venta:" CssClass="control-label"></asp:Label>
                         <asp:SqlDataSource ID="odsLOTEVENTA" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlLOTEVENTA" runat="server" DataSourceID="odsLOTEVENTA"  
                DataTextField="LOTEVENTADescripcion" DataValueField="IDLOTEVENTA" CssClass="form-control">    
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTESECUENCIA" runat="server" Text="Secuencia de comprador:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtLOTEVENTACLIENTESECUENCIA" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTENOMBRE" runat="server" Text="Apellido y nombre comprador:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtLOTEVENTACLIENTENOMBRE" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTEDNI" runat="server" Text="DNI:" CssClass="control-label"></asp:Label>      
         <asp:TextBox ID="otxtLOTEVENTACLIENTEDNI" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>       
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTEDOMICILIO" runat="server" Text="Domicilio:" CssClass="control-label"></asp:Label>      
         <asp:TextBox ID="otxtLOTEVENTACLIENTEDOMICILIO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTETELEFONO" runat="server" Text="Telefono:" CssClass="control-label"></asp:Label>        
         <asp:TextBox ID="otxtLOTEVENTACLIENTETELEFONO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTECORREO" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>        
         <asp:TextBox ID="otxtLOTEVENTACLIENTECORREO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblIDCLIENTEIVA" runat="server" Text="Condicion IVA:" CssClass="control-label"></asp:Label>  
                         <asp:SqlDataSource ID="odsCLIENTEIVA" runat="server"    
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="CLIENTEIVATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>       
                        <asp:DropDownList ID="oddlCLIENTEIVA" runat="server" DataSourceID="odsCLIENTEIVA" 
                DataTextField="CLIENTEIVADescripcion" DataValueField="IDCLIENTEIVA" CssClass="form-control"> 
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTECUIT" runat="server" Text="Numero de CUIL / CUIT:" CssClass="control-label"></asp:Label>       
         <asp:TextBox ID="otxtLOTEVENTACLIENTECUIT" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>       
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTACLIENTEOBSERVACION" runat="server" Text="OBSERVACIONES:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtLOTEVENTACLIENTEOBSERVACION" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>           
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

 
