
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="LOTEVENTALLAMADA.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTALLAMADA" title="Tratamiento Tabla " Culture="es-AR"                        %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblLOTEVENTALLAMADATitulo" runat="server" Text=""></asp:Label>      
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

              <asp:SqlDataSource ID="odsLOTEVENTALLAMADA" runat="server"    
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="LOTEVENTALLAMADATRAERCADENA" SelectCommandType="StoredProcedure">              
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvLOTEVENTALLAMADA" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"            
                  DataKeyNames="IDLOTEVENTALLAMADA       ,LOTEVENTALLAMADACODIGO         ,LOTEVENTALLAMADADESCRIPCION           ,LOTEVENTALLAMADAEXPLICACION          ,LOTEVENTALLAMADAESTADO          " 
               DataSourceID="odsLOTEVENTALLAMADA"    
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDLOTEVENTALLAMADA" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTALLAMADA"/>
                     <asp:BoundField DataField="LOTEVENTALLAMADACODIGO" HeaderText="Encuesta"        
                        SortExpression="LOTEVENTALLAMADACODIGO"/>  
                     <asp:BoundField DataField="LOTEVENTALLAMADADESCRIPCION" HeaderText="Descripcion tipo llamada"        
                        SortExpression="LOTEVENTALLAMADADESCRIPCION"/>   
                     <asp:BoundField DataField="LOTEVENTALLAMADAEXPLICACION" HeaderText="Explicacion"        
                        SortExpression="LOTEVENTALLAMADAEXPLICACION"/>   
                   <asp:TemplateField HeaderText="Estado (activo / inactivo )"  SortExpression="LOTEVENTALLAMADAESTADO" >  
                     <ItemTemplate>
                     <asp:CheckBox ID="LOTEVENTALLAMADAESTADOBox"  runat="server" Checked='<% # Bind("LOTEVENTALLAMADAESTADO") %>' Enabled="false"  />               
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
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
            <asp:Label ID="olblIDLOTEVENTALLAMADA" runat="server" Text="" Visible="false"></asp:Label> 
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADACODIGO" runat="server" Text="Encuesta:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtLOTEVENTALLAMADACODIGO" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADADESCRIPCION" runat="server" Text="Descripcion tipo llamada:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtLOTEVENTALLAMADADESCRIPCION" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADAEXPLICACION" runat="server" Text="Explicacion:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtLOTEVENTALLAMADAEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADAESTADO" runat="server" Text="Estado (activo / inactivo ):" CssClass="control-label"></asp:Label>      
      <asp:CheckBox ID="otxtLOTEVENTALLAMADAESTADO" runat="server"  />        
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

 
