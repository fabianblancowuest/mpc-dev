
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="RECIBOADHESION.aspx.vb" Inherits="STRSYSTEM_Administracion_RECIBOADHESION" title="Tratamiento Tabla " Culture="es-AR"                     %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblRECIBOADHESIONTitulo" runat="server" Text=""></asp:Label>     
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

              <asp:SqlDataSource ID="odsRECIBOADHESION" runat="server"   
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="RECIBOADHESIONTRAERCADENA" SelectCommandType="StoredProcedure">            
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvRECIBOADHESION" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"          
                  DataKeyNames="IDRECIBOADHESION     ,RECIBOADHESIONCODIGO        ,RECIBOADHESIONDESCRIPCION         ,RECIBOADHESIONESTADO        ,IDLOTEVENTA    ,RECIBONUMERO      ,RECIBOFECHACOBRANZA        ,RECIBOMONTOEFECTIVO        ,RECIBOMONTOTRANSFERENCIA          " 
               DataSourceID="odsRECIBOADHESION"   
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDRECIBOADHESION" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDRECIBOADHESION"/>
                     <asp:BoundField DataField="RECIBOADHESIONCODIGO" HeaderText="CODIGO RECIBO"          
                        SortExpression="RECIBOADHESIONCODIGO"/> 
                     <asp:BoundField DataField="RECIBOADHESIONDESCRIPCION" HeaderText="RECIBO EXTENSION"           
                        SortExpression="RECIBOADHESIONDESCRIPCION"/>  
                     <asp:BoundField DataField="RECIBOADHESIONESTADO" HeaderText="ESTADO"         
     SortExpression="RECIBOADHESIONESTADO">        
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="IDLOTEVENTA" HeaderText="LOTE VENTA"     
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTA"/>
                     <asp:BoundField DataField="RECIBONUMERO" HeaderText="NUMERO DE RECIBO"         
     SortExpression="RECIBONUMERO">     
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="RECIBOFECHACOBRANZA" HeaderText="FECHA RECIBO"          
                        SortExpression="RECIBOFECHACOBRANZA"   DataFormatString="{0:d}"/> 
                     <asp:BoundField DataField="RECIBOMONTOEFECTIVO" HeaderText="EFECTIVO"        
     SortExpression="RECIBOMONTOEFECTIVO">       
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="RECIBOMONTOTRANSFERENCIA" HeaderText="MONTO"          
     SortExpression="RECIBOMONTOTRANSFERENCIA">          
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
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
            <asp:Label ID="olblIDRECIBOADHESION" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOADHESIONCODIGO" runat="server" Text="CODIGO RECIBO:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtRECIBOADHESIONCODIGO" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOADHESIONDESCRIPCION" runat="server" Text="RECIBO EXTENSION:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtRECIBOADHESIONDESCRIPCION" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOADHESIONESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtRECIBOADHESIONESTADO" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblIDLOTEVENTA" runat="server" Text="LOTE VENTA:" CssClass="control-label"></asp:Label>      
                         <asp:SqlDataSource ID="odsLOTEVENTA" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlLOTEVENTA" runat="server" DataSourceID="odsLOTEVENTA"  
                DataTextField="LOTEVENTADescripcion" DataValueField="IDLOTEVENTA" CssClass="form-control">    
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblRECIBONUMERO" runat="server" Text="NUMERO DE RECIBO:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtRECIBONUMERO" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>      
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOFECHACOBRANZA" runat="server" Text="FECHA RECIBO:" CssClass="control-label"></asp:Label>            
<asp:CalendarExtender ID="oceRECIBOFECHACOBRANZA" runat="server" TargetControlID="otxtRECIBOFECHACOBRANZA" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutRECIBOFECHACOBRANZAPopup">                               
</asp:CalendarExtender>  
<asp:TextBox ID="otxtRECIBOFECHACOBRANZA" CssClass="form-control" runat="server"></asp:TextBox>           
<asp:Button ID="obutRECIBOFECHACOBRANZAPopup" runat="server" CssClass="obut-ocal-popup-button" />          
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOMONTOEFECTIVO" runat="server" Text="EFECTIVO:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtRECIBOMONTOEFECTIVO" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblRECIBOMONTOTRANSFERENCIA" runat="server" Text="MONTO:" CssClass="control-label"></asp:Label>            
         <asp:TextBox ID="otxtRECIBOMONTOTRANSFERENCIA" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>           
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

 
