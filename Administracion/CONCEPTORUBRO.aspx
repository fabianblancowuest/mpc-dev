
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="CONCEPTORUBRO.aspx.vb" Inherits="STRSYSTEM_Administracion_CONCEPTORUBRO" title="Tratamiento Tabla RUBRO DE CONCEPTOS" Culture="es-AR"                               %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row contenedor-flexible margenes-y">
        <h2 class="titulo-rol">
           <asp:Label ID="olblCONCEPTORUBROTitulo" runat="server" Text="RUBRO DE CONCEPTOS"></asp:Label>              
         </h2>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row contenedor-flexible margenes-y">
                    <asp:Label ID="olblBuscar" runat="server" Text="Localizar"   ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR "></asp:Label>
                        <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>    
                        <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-basic btn-primary" /> 
                 </div>  
                 <div>

              <asp:SqlDataSource ID="odsCONCEPTORUBRO" runat="server"    
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="CONCEPTORUBROTRAERCADENA" SelectCommandType="StoredProcedure">              
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvCONCEPTORUBRO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"           
                  DataKeyNames="IDCONCEPTORUBRO       ,CONCEPTORUBROCODIGO         ,CONCEPTORUBRODESCRIPCION          ,CONCEPTORUBROEXPLICACION          ,CONCEPTORUBROCUENTADEBITA           ,CONCEPTORUBROESTADO          " 
               DataSourceID="odsCONCEPTORUBRO"    
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDCONCEPTORUBRO" HeaderText="ID"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDCONCEPTORUBRO"/>
                     <asp:BoundField DataField="CONCEPTORUBROCODIGO" HeaderText="CODIGO RUBRO"            
                        SortExpression="CONCEPTORUBROCODIGO"/>  
                     <asp:BoundField DataField="CONCEPTORUBRODESCRIPCION" HeaderText="DESCRIPCION RUBRO"              
                        SortExpression="CONCEPTORUBRODESCRIPCION"/>   
                     <asp:BoundField DataField="CONCEPTORUBROEXPLICACION" HeaderText="EXPLICACION RUBRO"             
                        SortExpression="CONCEPTORUBROEXPLICACION"/>   
                   <asp:TemplateField HeaderText="DEBITA CUENTA (ACTIVE=VERDADERO , INACTIVO=FALSO)"  SortExpression="CONCEPTORUBROCUENTADEBITA" >                    
                     <ItemTemplate>
                     <asp:CheckBox ID="CONCEPTORUBROCUENTADEBITABox"  runat="server" Checked='<% # Bind("CONCEPTORUBROCUENTADEBITA") %>' Enabled="false"  />                  
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="ESTADO RUBRO (ACTIVO=TRUE,BAJA =FALSE)"  SortExpression="CONCEPTORUBROESTADO" >                
                     <ItemTemplate>
                     <asp:CheckBox ID="CONCEPTORUBROESTADOBox"  runat="server" Checked='<% # Bind("CONCEPTORUBROESTADO") %>' Enabled="false"  />               
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
     <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-success btn-basic" />
 
 </div>
 
 </asp:Panel> 

    
 <asp:Panel ID="PanelAlta" runat="server" Visible="false">
<form class="form" role="form">

<div class="form-group">
            <asp:Label ID="olblIDCONCEPTORUBRO" runat="server" Text="" Visible="false"></asp:Label> 
</div>
<div class="form-group">
<asp:Label ID="olblCONCEPTORUBROCODIGO" runat="server" Text="CODIGO RUBRO:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtCONCEPTORUBROCODIGO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblCONCEPTORUBRODESCRIPCION" runat="server" Text="DESCRIPCION RUBRO:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtCONCEPTORUBRODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblCONCEPTORUBROEXPLICACION" runat="server" Text="EXPLICACION RUBRO:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtCONCEPTORUBROEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblCONCEPTORUBROCUENTADEBITA" runat="server" Text="DEBITA CUENTA (ACTIVE=VERDADERO , INACTIVO=FALSO):" CssClass="control-label"></asp:Label>                       
      <asp:CheckBox ID="otxtCONCEPTORUBROCUENTADEBITA" runat="server"  />         
</div>
<div class="form-group">
<asp:Label ID="olblCONCEPTORUBROESTADO" runat="server" Text="ESTADO RUBRO (ACTIVO=TRUE,BAJA =FALSE):" CssClass="control-label"></asp:Label>                    
      <asp:CheckBox ID="otxtCONCEPTORUBROESTADO" runat="server"  />        
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

 
