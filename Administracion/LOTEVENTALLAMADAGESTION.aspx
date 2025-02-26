
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="LOTEVENTALLAMADAGESTION.aspx.vb" Inherits="STRSYSTEM_Administracion_LOTEVENTALLAMADAGESTION" title="Tratamiento Tabla GESTION DE
LLAMADAS POR BARRIO Y LOTE." Culture="es-AR" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblLOTEVENTALLAMADAGESTIONTitulo" runat="server" Text="GESTION DE LLAMADAS POR BARRIO Y LOTE."></asp:Label>                    
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE OPERADOR:"   CssClass="control-label"></asp:Label>        
             <asp:SqlDataSource ID="odsOPERADOROperador" runat="server"      
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="OPERADOROPERADORSELECCIONA" SelectCommandType="StoredProcedure">                
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlOPERADOROperador" runat="server" DataSourceID="odsOPERADOROPERADOR"           
              DataTextField="OPERADORDescripcion" DataValueField="idOPERADOR" CssClass="form-control" AutoPostBack="True">          
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsLOTEVENTALLAMADAGESTION" runat="server"       
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="LOTEVENTALLAMADAGESTIONTRAERID" SelectCommandType="StoredProcedure">             
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlOPERADOROperador" Name="idOPERADOR" PropertyName="SelectedValue" Type="Int16"  />        
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvLOTEVENTALLAMADAGESTION" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"              
                  DataKeyNames="IDLOTEVENTALLAMADAGESTION         ,IDOPERADOR    ,IDLOTEVENTA    ,IDLOTEVENTALLAMADATIPO        ,LOTEVENTALLAMADAFECHA         ,LOTEVENTALLAMADACOMENTARIO           " 
               DataSourceID="odsLOTEVENTALLAMADAGESTION"       
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDLOTEVENTALLAMADAGESTION" HeaderText="id"       
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTALLAMADAGESTION"/>  
                     <asp:BoundField DataField="IDOPERADOR" HeaderText="Operador"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDOPERADOR"/>
                     <asp:BoundField DataField="IDLOTEVENTA" HeaderText="Lote adherido"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTA"/>
                     <asp:BoundField DataField="IDLOTEVENTALLAMADATIPO" HeaderText="Tipificacion de llamada"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDLOTEVENTALLAMADATIPO"/> 
                     <asp:BoundField DataField="LOTEVENTALLAMADAFECHA" HeaderText="Fecha"        
     SortExpression="LOTEVENTALLAMADAFECHA">         
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="LOTEVENTALLAMADACOMENTARIO" HeaderText="Comentario del operador."         
                        SortExpression="LOTEVENTALLAMADACOMENTARIO"/>    
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
            <asp:Label ID="olblIDLOTEVENTALLAMADAGESTION" runat="server" Text="" Visible="false"></asp:Label>    
</div>
<div class="form-group">
<asp:Label ID="olblIDOPERADOR" runat="server" Text="Operador:" CssClass="control-label"></asp:Label>    
                         <asp:SqlDataSource ID="odsOPERADOR" runat="server"      
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="OPERADORTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlOPERADOR" runat="server" DataSourceID="odsOPERADOR"    
                DataTextField="OPERADORDescripcion" DataValueField="IDOPERADOR" CssClass="form-control">     
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblIDLOTEVENTA" runat="server" Text="Lote adherido:" CssClass="control-label"></asp:Label>   
                         <asp:SqlDataSource ID="odsLOTEVENTA" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlLOTEVENTA" runat="server" DataSourceID="odsLOTEVENTA"  
                DataTextField="LOTEVENTADescripcion" DataValueField="IDLOTEVENTA" CssClass="form-control">    
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblIDLOTEVENTALLAMADATIPO" runat="server" Text="Tipificacion de llamada:" CssClass="control-label"></asp:Label>      
                         <asp:SqlDataSource ID="odsLOTEVENTALLAMADATIPO" runat="server"         
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTALLAMADATIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>             
                        <asp:DropDownList ID="oddlLOTEVENTALLAMADATIPO" runat="server" DataSourceID="odsLOTEVENTALLAMADATIPO"          
                DataTextField="LOTEVENTALLAMADATIPODescripcion" DataValueField="IDLOTEVENTALLAMADATIPO" CssClass="form-control">            
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADAFECHA" runat="server" Text="Fecha:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="otxtLOTEVENTALLAMADAFECHA" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblLOTEVENTALLAMADACOMENTARIO" runat="server" Text="Comentario del operador.:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtLOTEVENTALLAMADACOMENTARIO" runat="server" CssClass="form-control" MaxLength="0"></asp:TextBox>            
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
    
    
 <asp:Panel ID="PanelAtaNovedad" runat="server" Visible="false">
<form class="form" role="form">

<div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>    
</div>
<div class="form-group">
<asp:Label ID="Label3" runat="server" Text="Operador:" CssClass="control-label"></asp:Label>    
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server"      
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="OPERADORTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsOPERADOR"    
                DataTextField="OPERADORDescripcion" DataValueField="IDOPERADOR" CssClass="form-control">     
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="Label4" runat="server" Text="Lote adherido:" CssClass="control-label"></asp:Label>   
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTATraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsLOTEVENTA"  
                DataTextField="LOTEVENTADescripcion" DataValueField="IDLOTEVENTA" CssClass="form-control">    
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="Label5" runat="server" Text="Tipificacion de llamada:" CssClass="control-label"></asp:Label>      
                         <asp:SqlDataSource ID="SqlDataSource3" runat="server"         
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="LOTEVENTALLAMADATIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>             
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="odsLOTEVENTALLAMADATIPO"          
                DataTextField="LOTEVENTALLAMADATIPODescripcion" DataValueField="IDLOTEVENTALLAMADATIPO" CssClass="form-control">            
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="Label6" runat="server" Text="Fecha:" CssClass="control-label"></asp:Label>         
         <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="Label7" runat="server" Text="Comentario del operador.:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" MaxLength="0"></asp:TextBox>            
</div>

 <div class="col-sm-offset-2 col-sm-10">

               <asp:Label ID="Label8" runat="server" Text="" Visible="false"></asp:Label>
               <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
       <br />
               <asp:Button ID="Button1" runat="server" Text="Confirma Alta" CssClass="btn btn-success"  />
               <asp:Button ID="Button2" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
</div>               
</form> 




</asp:Panel> 
</asp:Content> 

 
