
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="BARRIOLOTECOMISIONEXTRA.aspx.vb" Inherits="STRSYSTEM_Administracion_BARRIOLOTECOMISIONEXTRA" title="Tratamiento Tabla COMISION EXTRA
POR LOTE VENDIDO" Culture="es-AR" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblBARRIOLOTECOMISIONEXTRATitulo" runat="server" Text="COMISION EXTRA POR LOTE VENDIDO"></asp:Label>                 
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIO LOTE:"   CssClass="control-label"></asp:Label>       
             <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"      
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="BARRIOLOTEOPERADORSELECCIONA" SelectCommandType="StoredProcedure">               
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server" DataSourceID="odsBARRIOLOTEOPERADOR"          
              DataTextField="BARRIOLOTEDescripcion" DataValueField="idBARRIOLOTE" CssClass="form-control" AutoPostBack="True">         
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsBARRIOLOTECOMISIONEXTRA" runat="server"      
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="BARRIOLOTECOMISIONEXTRATRAERID" SelectCommandType="StoredProcedure">            
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlBARRIOLOTEOperador" Name="idBARRIOLOTE" PropertyName="SelectedValue" Type="Int16"  />       
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvBARRIOLOTECOMISIONEXTRA" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"             
                  DataKeyNames="IDBARRIOLOTECOMISIONEXTRA        ,IDBARRIOLOTE    ,BARRIOLOTECOMISIONEXTRAEXPLICACION           ,BARRIOLOTECOMISIONEXTRAMONTO           ,FECHAVIGENCIADESDE       ,FECHAVIGENCIAHASTA       " 
               DataSourceID="odsBARRIOLOTECOMISIONEXTRA"      
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDBARRIOLOTECOMISIONEXTRA" HeaderText="id"     
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDBARRIOLOTECOMISIONEXTRA"/> 
                     <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="Lote"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDBARRIOLOTE"/>
                     <asp:BoundField DataField="BARRIOLOTECOMISIONEXTRAEXPLICACION" HeaderText="Explicacion"         
                        SortExpression="BARRIOLOTECOMISIONEXTRAEXPLICACION"/>    
                     <asp:BoundField DataField="BARRIOLOTECOMISIONEXTRAMONTO" HeaderText="Monto de comision Adicional"         
     SortExpression="BARRIOLOTECOMISIONEXTRAMONTO">           
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="FECHAVIGENCIADESDE" HeaderText="Vigente desde Fecha"      
                        SortExpression="FECHAVIGENCIADESDE"   DataFormatString="{0:d}"/>
                     <asp:BoundField DataField="FECHAVIGENCIAHASTA" HeaderText="Vigente hasta Fecha"     
                        SortExpression="FECHAVIGENCIAHASTA"   DataFormatString="{0:d}"/>
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
            <asp:Label ID="olblIDBARRIOLOTECOMISIONEXTRA" runat="server" Text="" Visible="false"></asp:Label>   
</div>
<div class="form-group">
<asp:Label ID="olblIDBARRIOLOTE2" runat="server" Text="Lote:" CssClass="control-label"></asp:Label>   
                         <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="BARRIOLOTETraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>         
                        <asp:DropDownList ID="oddlBARRIOLOTE" runat="server" DataSourceID="odsBARRIOLOTE"  
                DataTextField="BARRIOLOTEDescripcion" DataValueField="IDBARRIOLOTE" CssClass="form-control">    
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblBARRIOLOTECOMISIONEXTRAEXPLICACION" runat="server" Text="Explicacion:" CssClass="control-label"></asp:Label>          
         <asp:TextBox ID="otxtBARRIOLOTECOMISIONEXTRAEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblBARRIOLOTECOMISIONEXTRAMONTO" runat="server" Text="Monto de comision Adicional:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtBARRIOLOTECOMISIONEXTRAMONTO" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>            
</div>
<div class="form-group">
<asp:Label ID="olblFECHAVIGENCIADESDE" runat="server" Text="Vigente desde Fecha:" CssClass="control-label"></asp:Label>        
<asp:CalendarExtender ID="oceFECHAVIGENCIADESDE" runat="server" TargetControlID="otxtFECHAVIGENCIADESDE" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutFECHAVIGENCIADESDEPopup">                           
</asp:CalendarExtender>  
<asp:TextBox ID="otxtFECHAVIGENCIADESDE" CssClass="form-control" runat="server"></asp:TextBox>         
<asp:Button ID="obutFECHAVIGENCIADESDEPopup" runat="server" CssClass="obut-ocal-popup-button" />         
</div>
<div class="form-group">
<asp:Label ID="olblFECHAVIGENCIAHASTA" runat="server" Text="Vigente hasta Fecha:" CssClass="control-label"></asp:Label>       
<asp:CalendarExtender ID="oceFECHAVIGENCIAHASTA" runat="server" TargetControlID="otxtFECHAVIGENCIAHASTA" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutFECHAVIGENCIAHASTAPopup">                          
</asp:CalendarExtender>  
<asp:TextBox ID="otxtFECHAVIGENCIAHASTA" CssClass="form-control" runat="server"></asp:TextBox>         
<asp:Button ID="obutFECHAVIGENCIAHASTAPopup" runat="server" CssClass="obut-ocal-popup-button" />        
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

 
