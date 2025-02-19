<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="personaFisica.ascx.vb" Inherits="sitioWEB_personaFisica" %>
<asp:Panel ID="PanelPersona" runat="server">
    <div class="row">
        <div class="col-sm-3">
 
            <asp:TextBox ID="olblPersonaOrden" runat="server" Font-Size ="Small"  Enabled ="false"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="otxtPersonaSeleccionadaCodigo" runat="server"  Font-Size ="Small"  Enabled ="false" ></asp:TextBox>
        
        </div>
        <div class="col-sm-3">
         <asp:TextBox ID="otxtPersonaSeleccionadaDescripcion" runat="server" Font-Size ="Small" width="100%"  Enabled ="false"></asp:TextBox>
        </div>
         <div class="col-sm-3">
        <asp:Button ID="obutPersonaBuscar" runat="server" Text="Buscar" CssClass="btn-sucess" />
             <asp:Button ID="obutPersonaDescartar" runat="server" Text="Descartar" CssClass ="btn-Danger" />
        </div>

    </div>


    </asp:Panel>
<asp:Panel ID="PanelTitulo" runat="server">

 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server" Visible ="false" >
        
         <div class="row">
                    <asp:Label ID="olblBuscar" runat="server" Text="Localizar"   ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR "></asp:Label>
                        <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>    
                        <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-default" /> 
                 </div>  
                 <div>

              <asp:SqlDataSource ID="odsPERSONAFISICA" runat="server"  
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="PERSONAFISICATRAERCADENA" SelectCommandType="StoredProcedure">            
                  <SelectParameters>
                   <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvPERSONAFISICA" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"         
                  DataKeyNames="IDPERSONAFISICA     ,PERSONAFISICACODIGO       ,PERSONAFISICADESCRIPCION        ,PERSONAFISICAAPELLIDO       ,PERSONAFISICANOMBRES         ,PERSONAFISICANACIMIENTOFECHA          ,IDPERSONAFISICADOCUMENTOTIPO          ,PERSONAFISICADOCUMENTONUMERO             ,PERSONAFISICACUIT     ,PERSONAFISICATELEFONONUMERO            ,PERSONAFISICACORREOELECTRONICO            ,PERSONAFISICABARRIO       ,PERSONAFISICACALLE      ,PERSONAFISICALOCALIDAD        ,PERSONAFISICAPROFESION        ,PERSONAFISICADOMICILIOLABORAL         " 
               DataSourceID="odsPERSONAFISICA"  
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDPERSONAFISICA" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDPERSONAFISICA"/>
                     <asp:BoundField DataField="PERSONAFISICACODIGO" HeaderText="CODIGO (CUIT / DNI)"   Visible="false"    
                        SortExpression="PERSONAFISICACODIGO"/>
                     <asp:BoundField DataField="PERSONAFISICADESCRIPCION" HeaderText="DESCRIPCION (RAZON SOCIAL )"   Visible ="false"          
                        SortExpression="PERSONAFISICADESCRIPCION"/> 
                     <asp:BoundField DataField="PERSONAFISICAAPELLIDO" HeaderText="APELLIDO"       
                        SortExpression="PERSONAFISICAAPELLIDO"/>
                     <asp:BoundField DataField="PERSONAFISICANOMBRES" HeaderText="NOMBRES"          
                        SortExpression="PERSONAFISICANOMBRES"/> 
                     <asp:BoundField DataField="PERSONAFISICANACIMIENTOFECHA" HeaderText="FECHA DE NACIMIENTO"             
                        SortExpression="PERSONAFISICANACIMIENTOFECHA"   DataFormatString="{0:d}"/>  
                     <asp:BoundField DataField="IDPERSONAFISICADOCUMENTOTIPO" HeaderText="TIPO DE DOCUMENTO PERSONA FISICA"                  
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDPERSONAFISICADOCUMENTOTIPO"/>   
                     <asp:BoundField DataField="PERSONAFISICADOCUMENTONUMERO" HeaderText="NUMERO DE DOCUMENTO"                   
     SortExpression="PERSONAFISICADOCUMENTONUMERO">            
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="PERSONAFISICACUIT" HeaderText="CUIT"    
                        SortExpression="PERSONAFISICACUIT"/>
                     <asp:BoundField DataField="PERSONAFISICATELEFONONUMERO" HeaderText="NÙMERO DE TELEFONO /S"                
                        SortExpression="PERSONAFISICATELEFONONUMERO"/>    
                     <asp:BoundField DataField="PERSONAFISICACORREOELECTRONICO" HeaderText="CORREO ELECTRÒNICO / USUARIO DE ACCESO"                      
                        SortExpression="PERSONAFISICACORREOELECTRONICO"/>     
                     <asp:BoundField DataField="PERSONAFISICABARRIO" HeaderText="BARRIO"      
                        SortExpression="PERSONAFISICABARRIO"/>
                     <asp:BoundField DataField="PERSONAFISICACALLE" HeaderText="CALLE"      
                        SortExpression="PERSONAFISICACALLE"/>
                     <asp:BoundField DataField="PERSONAFISICALOCALIDAD" HeaderText="LOCALIDAD"        
                        SortExpression="PERSONAFISICALOCALIDAD"/>
                     <asp:BoundField DataField="PERSONAFISICAPROFESION" HeaderText="PROFESION"         
                        SortExpression="PERSONAFISICAPROFESION"/> 
                     <asp:BoundField DataField="PERSONAFISICADOMICILIOLABORAL" HeaderText="DOMICILIO LABORAL"           
                        SortExpression="PERSONAFISICADOMICILIOLABORAL"/>  
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
            <asp:Label ID="olblIDPERSONAFISICA" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICACODIGO" runat="server" Text="CODIGO (CUIT / DNI):" CssClass="control-label"></asp:Label>        
         <asp:TextBox ID="otxtPERSONAFISICACODIGO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICADESCRIPCION" runat="server" Text="DESCRIPCION (RAZON SOCIAL ):" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtPERSONAFISICADESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICAAPELLIDO" runat="server" Text="APELLIDO:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtPERSONAFISICAAPELLIDO" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICANOMBRES" runat="server" Text="NOMBRES:" CssClass="control-label"></asp:Label>            
         <asp:TextBox ID="otxtPERSONAFISICANOMBRES" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICANACIMIENTOFECHA" runat="server" Text="FECHA DE NACIMIENTO:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtPERSONAFISICANACIMIENTOFECHA" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>              

</div>
<div class="form-group">
<asp:Label ID="olblIDPERSONAFISICADOCUMENTOTIPO" runat="server" Text="TIPO DE DOCUMENTO PERSONA FISICA:" CssClass="control-label"></asp:Label>                   
                         <asp:SqlDataSource ID="odsPERSONAFISICADOCUMENTOTIPO" runat="server"            
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="PERSONAFISICADOCUMENTOTIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>               
                        <asp:DropDownList ID="oddlPERSONAFISICADOCUMENTOTIPO" runat="server" DataSourceID="odsPERSONAFISICADOCUMENTOTIPO"               
                DataTextField="PERSONAFISICADOCUMENTOTIPODescripcion" DataValueField="IDPERSONAFISICADOCUMENTOTIPO" CssClass="form-control">                 
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICADOCUMENTONUMERO" runat="server" Text="NUMERO DE DOCUMENTO:" CssClass="control-label"></asp:Label>                     
         <asp:TextBox ID="otxtPERSONAFISICADOCUMENTONUMERO" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>              
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICACUIT" runat="server" Text="CUIT:" CssClass="control-label"></asp:Label>     
         <asp:TextBox ID="otxtPERSONAFISICACUIT" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>      
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICATELEFONONUMERO" runat="server" Text="NÙMERO DE TELEFONO /S:" CssClass="control-label"></asp:Label>                  
         <asp:TextBox ID="otxtPERSONAFISICATELEFONONUMERO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>             
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICACORREOELECTRONICO" runat="server" Text="CORREO ELECTRÒNICO / USUARIO DE ACCESO:" CssClass="control-label"></asp:Label>                       
         <asp:TextBox ID="otxtPERSONAFISICACORREOELECTRONICO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>             
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICABARRIO" runat="server" Text="BARRIO:" CssClass="control-label"></asp:Label>        
         <asp:TextBox ID="otxtPERSONAFISICABARRIO" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>        
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICACALLE" runat="server" Text="CALLE:" CssClass="control-label"></asp:Label>       
         <asp:TextBox ID="otxtPERSONAFISICACALLE" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>       
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICALOCALIDAD" runat="server" Text="LOCALIDAD:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtPERSONAFISICALOCALIDAD" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICAPROFESION" runat="server" Text="PROFESION:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtPERSONAFISICAPROFESION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblPERSONAFISICADOMICILIOLABORAL" runat="server" Text="DOMICILIO LABORAL:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtPERSONAFISICADOMICILIOLABORAL" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>          
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
