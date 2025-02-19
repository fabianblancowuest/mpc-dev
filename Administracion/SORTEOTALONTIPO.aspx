
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOTALONTIPO.aspx.vb" Inherits="STRSYSTEM_Administracion_SORTEOTALONTIPO" title="Tratamiento Tabla TIPO DE TALON" Culture="es-AR"                         %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblSORTEOTALONTIPOTitulo" runat="server" Text="TIPO DE TALON"></asp:Label>         
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

              <asp:SqlDataSource ID="odsSORTEOTALONTIPO" runat="server"   
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="SORTEOTALONTIPOTRAERCADENA" SelectCommandType="StoredProcedure">             
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvSORTEOTALONTIPO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"           
                  DataKeyNames="IDSORTEOTALONTIPO      ,SORTEOTALONTIPOCODIGO        ,SORTEOTALONTIPODESCRIPCION          ,SORTEOTALONTIPOEXPLICACION         ,SORTEOTALONTIPOESTADO         ,SORTEOTALONTIPOESWEB         " 
               DataSourceID="odsSORTEOTALONTIPO"   
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDSORTEOTALONTIPO" HeaderText="ID"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDSORTEOTALONTIPO"/>
                     <asp:BoundField DataField="SORTEOTALONTIPOCODIGO" HeaderText="CODIGO TIPO TALON"           
                        SortExpression="SORTEOTALONTIPOCODIGO"/> 
                     <asp:BoundField DataField="SORTEOTALONTIPODESCRIPCION" HeaderText="DESCRIPCION TIPO TALON"             
                        SortExpression="SORTEOTALONTIPODESCRIPCION"/>  
                     <asp:BoundField DataField="SORTEOTALONTIPOEXPLICACION" HeaderText="EXPLICACION"         
                        SortExpression="SORTEOTALONTIPOEXPLICACION"/>  
                   <asp:TemplateField HeaderText="ESTADO"  SortExpression="SORTEOTALONTIPOESTADO" >       
                     <ItemTemplate>
                     <asp:CheckBox ID="SORTEOTALONTIPOESTADOBox"  runat="server" Checked='<% # Bind("SORTEOTALONTIPOESTADO") %>' Enabled="false"  />             
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="ES PARA VENTA WEB ?"  SortExpression="SORTEOTALONTIPOESWEB" >           
                     <ItemTemplate>
                     <asp:CheckBox ID="SORTEOTALONTIPOESWEBBox"  runat="server" Checked='<% # Bind("SORTEOTALONTIPOESWEB") %>' Enabled="false"  />              
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
            <asp:Label ID="olblIDSORTEOTALONTIPO" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOTALONTIPOCODIGO" runat="server" Text="CODIGO TIPO TALON:" CssClass="control-label"></asp:Label>            
         <asp:TextBox ID="otxtSORTEOTALONTIPOCODIGO" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOTALONTIPODESCRIPCION" runat="server" Text="DESCRIPCION TIPO TALON:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtSORTEOTALONTIPODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOTALONTIPOEXPLICACION" runat="server" Text="EXPLICACION:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtSORTEOTALONTIPOEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOTALONTIPOESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>           
      <asp:CheckBox ID="otxtSORTEOTALONTIPOESTADO" runat="server"  />       
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOTALONTIPOESWEB" runat="server" Text="ES PARA VENTA WEB ?:" CssClass="control-label"></asp:Label>              
      <asp:CheckBox ID="otxtSORTEOTALONTIPOESWEB" runat="server"  />       
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

 
