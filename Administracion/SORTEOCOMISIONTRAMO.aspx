
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOCOMISIONTRAMO.aspx.vb" Inherits="STRSYSTEM_Administracion_SORTEOCOMISIONTRAMO" title="Tratamiento Tabla MANTENIMIENTO DE
TRAMO DE COMISIONES SORTEO" Culture="es-AR" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblSORTEOCOMISIONTRAMOTitulo" runat="server" Text="MANTENIMIENTO DE TRAMO DE COMISIONES SORTEO"></asp:Label>                      
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE SORTEOCOMISION:"   CssClass="control-label"></asp:Label>         
             <asp:SqlDataSource ID="odsSORTEOCOMISIONOperador" runat="server"        
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="SORTEOCOMISIONOPERADORSELECCIONA" SelectCommandType="StoredProcedure">                 
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlSORTEOCOMISIONOperador" runat="server" DataSourceID="odsSORTEOCOMISIONOPERADOR"              
              DataTextField="SORTEOCOMISIONDescripcion" DataValueField="idSORTEOCOMISION" CssClass="form-control" AutoPostBack="True">             
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsSORTEOCOMISIONTRAMO" runat="server"      
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="SORTEOCOMISIONTRAMOTRAERID" SelectCommandType="StoredProcedure">            
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlSORTEOCOMISIONOperador" Name="idSORTEOCOMISION" PropertyName="SelectedValue" Type="Int16"  />           
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvSORTEOCOMISIONTRAMO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"             
                  DataKeyNames="IDSORTEOCOMISIONTRAMO,IDSORTEOCOMISION,SORTEOCOMISIONTRAMOCODIGO,SORTEOCOMISIONTRAMODESCRIPCION,SORTEOCOMISIONTRAMODESDE,SORTEOCOMISIONTRAMOHASTA,SORTEOCOMISIONTRAMOPORCENTAJE,SORTEOCOMISIONTRAMOSUPERVISOR,SORTEOCOMISIONTRAMOMONTOFIJO" 
               DataSourceID="odsSORTEOCOMISIONTRAMO"      
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
                 <AlternatingRowStyle CssClass="alt" />
                 <Columns>
                     <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                     <asp:BoundField DataField="IDSORTEOCOMISIONTRAMO" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="IDSORTEOCOMISIONTRAMO" visible="False" />
                     <asp:BoundField DataField="IDSORTEOCOMISION" HeaderText="COMISION" InsertVisible="False" ReadOnly="True" SortExpression="IDSORTEOCOMISION" visible="False" />
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMOCODIGO" HeaderText="CODIGO DEL TRAMO" SortExpression="SORTEOCOMISIONTRAMOCODIGO" />
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMODESCRIPCION" HeaderText="DESCRIPCION DEL TRAMO" SortExpression="SORTEOCOMISIONTRAMODESCRIPCION" />
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMODESDE" HeaderText="DESDE CANTIDAD DE TALONES" SortExpression="SORTEOCOMISIONTRAMODESDE">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMOHASTA" HeaderText="HASTA CANTIDAD DE TALONES" SortExpression="SORTEOCOMISIONTRAMOHASTA">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMOPORCENTAJE" HeaderText="PORCENTAJE COMISION VENDEDOR" SortExpression="SORTEOCOMISIONTRAMOPORCENTAJE">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMOSUPERVISOR" HeaderText="PORCENTAJE COMISION SUPERVISOR" SortExpression="SORTEOCOMISIONTRAMOSUPERVISOR">
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>
                     <asp:BoundField DataField="SORTEOCOMISIONTRAMOMONTOFIJO" DataFormatString="{0:c}" HeaderText="MONTO FIJO VENDEDOR" SortExpression="SORTEOCOMISIONTRAMOMONTOFIJO">
                     <ItemStyle HorizontalAlign="Right" />
                     </asp:BoundField>
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
            <asp:Label ID="olblIDSORTEOCOMISIONTRAMO" runat="server" Text="" Visible="false"></asp:Label>   
</div>
<div class="form-group">
<asp:Label ID="olblIDSORTEOCOMISION" runat="server" Text="COMISION:" CssClass="control-label"></asp:Label>       
                         <asp:SqlDataSource ID="odsSORTEOCOMISION" runat="server"       
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="SORTEOCOMISIONTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>           
                        <asp:DropDownList ID="oddlSORTEOCOMISION" runat="server" DataSourceID="odsSORTEOCOMISION"      
                DataTextField="SORTEOCOMISIONDescripcion" DataValueField="IDSORTEOCOMISION" CssClass="form-control">        
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMOCODIGO" runat="server" Text="CODIGO DEL TRAMO:" CssClass="control-label"></asp:Label>                
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMOCODIGO" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMODESCRIPCION" runat="server" Text="DESCRIPCION DEL TRAMO:" CssClass="control-label"></asp:Label>                  
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMODESCRIPCION" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>             
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMODESDE" runat="server" Text="DESDE CANTIDAD DE TALONES:" CssClass="control-label"></asp:Label>                  
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMODESDE" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMOHASTA" runat="server" Text="HASTA CANTIDAD DE TALONES:" CssClass="control-label"></asp:Label>                 
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMOHASTA" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMOPORCENTAJE" runat="server" Text="PORCENTAJE COMISION VENDEDOR:" CssClass="control-label"></asp:Label>                      
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMOPORCENTAJE" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>              
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMOSUPERVISOR" runat="server" Text="PORCENTAJE COMISION SUPERVISOR:" CssClass="control-label"></asp:Label>                      
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMOSUPERVISOR" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>             
</div>
<div class="form-group">
<asp:Label ID="olblSORTEOCOMISIONTRAMOMONTOFIJO" runat="server" Text="MONTO FIJO VENDEDOR:" CssClass="control-label"></asp:Label>                  
         <asp:TextBox ID="otxtSORTEOCOMISIONTRAMOMONTOFIJO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>             
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

 
