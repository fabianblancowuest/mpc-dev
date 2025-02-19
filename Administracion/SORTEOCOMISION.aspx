<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOCOMISION.aspx.vb" Inherits="STRSYSTEM_Administracion_SORTEOCOMISION" title="Tratamiento Tabla MANTENIMIENTO DE COMISIONES POR SORTEOS" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblSORTEOCOMISIONTitulo" runat="server" Text="MANTENIMIENTO DE COMISIONES POR SORTEO"></asp:Label>                  
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

              <asp:SqlDataSource ID="odsSORTEOCOMISION" runat="server"   
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="SORTEOCOMISIONTRAERCADENA" SelectCommandType="StoredProcedure">             
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvSORTEOCOMISION" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"          
                  DataKeyNames="IDSORTEOCOMISION      ,SORTEOCOMISIONCODIGO        ,SORTEOCOMISIONDESCRIPCION         ,SORTEOCOMISIONEXPLICACION         ,SORTEOCOMISIONESTADO         ,SORTEOCOMISIONLIQUIDACIONDIARIA         " 
               DataSourceID="odsSORTEOCOMISION"   
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDSORTEOCOMISION" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDSORTEOCOMISION"/>
                     <asp:BoundField DataField="SORTEOCOMISIONCODIGO" HeaderText="Codigo Comision"       
                        SortExpression="SORTEOCOMISIONCODIGO"/> 
                     <asp:BoundField DataField="SORTEOCOMISIONDESCRIPCION" HeaderText="Descripcion comisión"        
                        SortExpression="SORTEOCOMISIONDESCRIPCION"/>  
                     <asp:BoundField DataField="SORTEOCOMISIONEXPLICACION" HeaderText="Explicación"      
                        SortExpression="SORTEOCOMISIONEXPLICACION"/>  
                   <asp:TemplateField HeaderText="Estado"  SortExpression="SORTEOCOMISIONESTADO" >     
                     <ItemTemplate>
                     <asp:CheckBox ID="SORTEOCOMISIONESTADOBox"  runat="server" Checked='<% # Bind("SORTEOCOMISIONESTADO") %>' Enabled="false"  />             
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="Devengamiento diario de Comisiones"  SortExpression="SORTEOCOMISIONLIQUIDACIONDIARIA" >      
                     <ItemTemplate>
                     <asp:CheckBox ID="SORTEOCOMISIONLIQUIDACIONDIARIABox"  runat="server" Checked='<% # Bind("SORTEOCOMISIONLIQUIDACIONDIARIA") %>' Enabled="false"  />              
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
            <asp:Label ID="olblIDSORTEOCOMISION" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONCODIGO" runat="server" Text="Codigo Comision:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtSORTEOCOMISIONCODIGO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONDESCRIPCION" runat="server" Text="Descripcion comisión:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtSORTEOCOMISIONDESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONEXPLICACION" runat="server" Text="Explicación:" CssClass="control-label"></asp:Label>        
         <asp:TextBox ID="otxtSORTEOCOMISIONEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONESTADO" runat="server" Text="Estado:" CssClass="control-label"></asp:Label>        
      <asp:CheckBox ID="otxtSORTEOCOMISIONESTADO" runat="server"  />       
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONLIQUIDACIONDIARIA" runat="server" Text="Devengamiento diario de Comisiones:" CssClass="control-label"></asp:Label>          
      <asp:CheckBox ID="otxtSORTEOCOMISIONLIQUIDACIONDIARIA" runat="server"  />        
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

 
