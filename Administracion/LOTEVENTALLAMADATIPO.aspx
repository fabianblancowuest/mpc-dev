
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="LOTEVENTALLAMADATIPO.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTALLAMADATIPO" title="Tratamiento Tabla TIPIFICACION DE
LLAMADAS A ADHERENTES POR LOTE" Culture="es-AR" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblLOTEVENTALLAMADATIPOTitulo" runat="server" Text="TIPIFICACION DE LLAMADAS A ADHERENTES POR LOTE"></asp:Label>                    
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE LOTEVENTALLAMADA:"   CssClass="control-label"></asp:Label>          
             <asp:SqlDataSource ID="odsLOTEVENTALLAMADAOperador" runat="server"         
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="LOTEVENTALLAMADAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">                   
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlLOTEVENTALLAMADAOperador" runat="server" DataSourceID="odsLOTEVENTALLAMADAOPERADOR"                
              DataTextField="LOTEVENTALLAMADADescripcion" DataValueField="idLOTEVENTALLAMADA" CssClass="form-control" AutoPostBack="True">               
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsLOTEVENTALLAMADATIPO" runat="server"     
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="LOTEVENTALLAMADATIPOTRAERID" SelectCommandType="StoredProcedure">            
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlLOTEVENTALLAMADAOperador" Name="idLOTEVENTALLAMADA" PropertyName="SelectedValue" Type="Int16"  />             
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvLOTEVENTALLAMADATIPO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"            
                  DataKeyNames="IDLOTEVENTALLAMADATIPO        ,IDLOTEVENTALLAMADA       ,LOTEVENTALLAMADATIPOCODIGO          ,LOTEVENTALLAMADATIPODESCRIPCION           ,LOTEVENTALLAMADATIPOEPLICACION           ,LOTEVENTALLAMADATIPOESTADO           " 
               DataSourceID="odsLOTEVENTALLAMADATIPO"     
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDLOTEVENTALLAMADATIPO" HeaderText="id"     
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTALLAMADATIPO"/> 
                     <asp:BoundField DataField="IDLOTEVENTALLAMADA" HeaderText="Encuesta / campaña"      
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTALLAMADA"/>
                     <asp:BoundField DataField="LOTEVENTALLAMADATIPOCODIGO" HeaderText="Codigo tipo llamada"        
                        SortExpression="LOTEVENTALLAMADATIPOCODIGO"/>   
                     <asp:BoundField DataField="LOTEVENTALLAMADATIPODESCRIPCION" HeaderText="Descripcion tipo llamada"         
                        SortExpression="LOTEVENTALLAMADATIPODESCRIPCION"/>    
                     <asp:BoundField DataField="LOTEVENTALLAMADATIPOEPLICACION" HeaderText="Explicacion"        
                        SortExpression="LOTEVENTALLAMADATIPOEPLICACION"/>   
                   <asp:TemplateField HeaderText="Estado"  SortExpression="LOTEVENTALLAMADATIPOESTADO" >       
                     <ItemTemplate>
                     <asp:CheckBox ID="LOTEVENTALLAMADATIPOESTADOBox"  runat="server" Checked='<% # Bind("LOTEVENTALLAMADATIPOESTADO")%>' Enabled="false"  />                 
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
            <asp:Label ID="olblIDLOTEVENTALLAMADATIPO" runat="server" Text="" Visible="false"></asp:Label>  
</div>
<div class="form-group">
<asp:Label ID="olblIDLOTEVENTALLAMADA" runat="server" Text="Encuesta / campaña:" CssClass="control-label"></asp:Label>        
                         <asp:SqlDataSource ID="odsLOTEVENTALLAMADA" runat="server"         
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTALLAMADATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>            
                        <asp:DropDownList ID="oddlLOTEVENTALLAMADA" runat="server" DataSourceID="odsLOTEVENTALLAMADA"         
                DataTextField="LOTEVENTALLAMADADescripcion" DataValueField="IDLOTEVENTALLAMADA" CssClass="form-control">          
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADATIPOCODIGO" runat="server" Text="Codigo tipo llamada:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtLOTEVENTALLAMADATIPOCODIGO" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADATIPODESCRIPCION" runat="server" Text="Descripcion tipo llamada:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtLOTEVENTALLAMADATIPODESCRIPCION" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADATIPOEPLICACION" runat="server" Text="Explicacion:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtLOTEVENTALLAMADATIPOEPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADATIPOESTADO" runat="server" Text="Estado:" CssClass="control-label"></asp:Label>          
      <asp:CheckBox ID="otxtLOTEVENTALLAMADATIPOESTADO" runat="server"  />         
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

 
