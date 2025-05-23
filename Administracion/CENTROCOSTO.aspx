
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="CENTROCOSTO.aspx.vb" Inherits="STRSYSTEM_Administracion_CENTROCOSTO" title="Tratamiento Tabla CENTROS DE COSTO" Culture="es-AR"                           %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblCENTROCOSTOTitulo" runat="server" Text="CENTROS DE COSTO"></asp:Label>           
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

              <asp:SqlDataSource ID="odsCENTROCOSTO" runat="server"   
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="CENTROCOSTOTRAERCADENA" SelectCommandType="StoredProcedure">            
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvCENTROCOSTO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="200" PagerStyle-CssClass="pgr"          
                  DataKeyNames="IDCENTROCOSTO     ,CENTROCOSTOCODIGO        ,CENTROCOSTODESCRIPCION         ,CENTROCOSTOEXPLICACION        ,CENTROCOSTOESTADO        ,CENTROCOSTOIMPUTABLE         " 
               DataSourceID="odsCENTROCOSTO"   
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDCENTROCOSTO" HeaderText="ID"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDCENTROCOSTO"/>
                     <asp:BoundField DataField="CENTROCOSTOCODIGO" HeaderText="CODIGO CENTRO COSTO"             
                        SortExpression="CENTROCOSTOCODIGO"/> 
                     <asp:BoundField DataField="CENTROCOSTODESCRIPCION" HeaderText="DESCRIPCION CENTRO COSTO"               
                        SortExpression="CENTROCOSTODESCRIPCION"/>  
                     <asp:BoundField DataField="CENTROCOSTOEXPLICACION" HeaderText="EXPLICACION CENTRO COSTO"              
                        SortExpression="CENTROCOSTOEXPLICACION"/> 
                   <asp:TemplateField HeaderText="ESTADO CENTROCOSTO"  SortExpression="CENTROCOSTOESTADO" >            
                     <ItemTemplate>
                     <asp:CheckBox ID="CENTROCOSTOESTADOBox"  runat="server" Checked='<% # Bind("CENTROCOSTOESTADO") %>' Enabled="false"  />            
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="ES IMPUTABLE (CABECERA DE RUBRO)"  SortExpression="CENTROCOSTOIMPUTABLE" >              
                     <ItemTemplate>
                     <asp:CheckBox ID="CENTROCOSTOIMPUTABLEBox"  runat="server" Checked='<% # Bind("CENTROCOSTOIMPUTABLE") %>' Enabled="false"  />             
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
            <asp:Label ID="olblIDCENTROCOSTO" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblCENTROCOSTOCODIGO" runat="server" Text="CODIGO CENTRO COSTO:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtCENTROCOSTOCODIGO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblCENTROCOSTODESCRIPCION" runat="server" Text="DESCRIPCION CENTRO COSTO:" CssClass="control-label"></asp:Label>                
         <asp:TextBox ID="otxtCENTROCOSTODESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblCENTROCOSTOEXPLICACION" runat="server" Text="EXPLICACION CENTRO COSTO:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtCENTROCOSTOEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblCENTROCOSTOESTADO" runat="server" Text="ESTADO CENTROCOSTO:" CssClass="control-label"></asp:Label>               
      <asp:CheckBox ID="otxtCENTROCOSTOESTADO" runat="server"  />       
</div>
<div class="form-group">
<asp:Label ID="olblCENTROCOSTOIMPUTABLE" runat="server" Text="ES IMPUTABLE (CABECERA DE RUBRO):" CssClass="control-label"></asp:Label>                 
      <asp:CheckBox ID="otxtCENTROCOSTOIMPUTABLE" runat="server"  />       
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

 
