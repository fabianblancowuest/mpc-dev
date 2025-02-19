
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="PLANCUENTARUBRO.aspx.vb" Inherits="STRSYSTEM_Administracion_PLANCUENTARUBRO" title="Tratamiento Tabla MANTENIMIENTO DE RUBROS DE
CUENTAS CONTABLES" Culture="es-AR" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblPLANCUENTARUBROTitulo" runat="server" Text="MANTENIMIENTO DE RUBROS DE CUENTAS CONTABLES"></asp:Label>                      
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

              <asp:SqlDataSource ID="odsPLANCUENTARUBRO" runat="server"    
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="PLANCUENTARUBROTRAERCADENA" SelectCommandType="StoredProcedure">              
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvPLANCUENTARUBRO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"            
                  DataKeyNames="IDPLANCUENTARUBRO       ,PLANCUENTARUBROCODIGO          ,PLANCUENTARUBRODESCRIPCION           ,PLANCUENTARUBROESTADO          " 
               DataSourceID="odsPLANCUENTARUBRO"     
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDPLANCUENTARUBRO" HeaderText="RUBRO"       
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDPLANCUENTARUBRO"/>
                     <asp:BoundField DataField="PLANCUENTARUBROCODIGO" HeaderText="CODIGO DE RUBRO"             
                        SortExpression="PLANCUENTARUBROCODIGO"/>  
                     <asp:BoundField DataField="PLANCUENTARUBRODESCRIPCION" HeaderText="DESCRIPCION DE RUBRO"               
                        SortExpression="PLANCUENTARUBRODESCRIPCION"/>    
                   <asp:TemplateField HeaderText="ESTADO DE RUBRO"  SortExpression="PLANCUENTARUBROESTADO" >           
                     <ItemTemplate>
                     <asp:CheckBox ID="PLANCUENTARUBROESTADOBox"  runat="server" Checked='<% # Bind("PLANCUENTARUBROESTADO") %>' Enabled="false"  />               
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
            <asp:Label ID="olblIDPLANCUENTARUBRO" runat="server" Text="" Visible="false"></asp:Label> 
</div>
<div class="form-group">
<asp:Label ID="olblPLANCUENTARUBROCODIGO" runat="server" Text="CODIGO DE RUBRO:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtPLANCUENTARUBROCODIGO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblPLANCUENTARUBRODESCRIPCION" runat="server" Text="DESCRIPCION DE RUBRO:" CssClass="control-label"></asp:Label>                
         <asp:TextBox ID="otxtPLANCUENTARUBRODESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblPLANCUENTARUBROESTADO" runat="server" Text="ESTADO DE RUBRO:" CssClass="control-label"></asp:Label>               
      <asp:CheckBox ID="otxtPLANCUENTARUBROESTADO" runat="server"  />        
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

 
