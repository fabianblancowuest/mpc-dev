
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEOTALONARIO.aspx.vb" Inherits="STRSYSTEM_Administracion_SORTEOTALONARIO" title="Tratamiento Tabla TALONARIOS PARA SORTEOS"                              %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblSORTEOTALONARIOTitulo" runat="server" Text="TALONARIOS PARA SORTEOS"></asp:Label>              
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE SORTEO:"   CssClass="control-label"></asp:Label>       
             <asp:SqlDataSource ID="odsSORTEOOperador" runat="server"      
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="SORTEOOPERADORSELECCIONA" SelectCommandType="StoredProcedure">               
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlSORTEOOperador" runat="server" DataSourceID="odsSORTEOOPERADOR"        
              DataTextField="SORTEODescripcion" DataValueField="idSORTEO" CssClass="form-control" AutoPostBack="True">       
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsSORTEOTALONARIO" runat="server"    
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="SORTEOTALONARIOTRAERID" SelectCommandType="StoredProcedure">          
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlSORTEOOperador" Name="idSORTEO" PropertyName="SelectedValue" Type="Int16"  />      
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvSORTEOTALONARIO" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"           
                  DataKeyNames="IDSORTEOTALONARIO      ,IDSORTEO   ,SORTEONUMERODESDE         ,SORTEONUMEROHASTA         ,FECHASOLICITUD    " 
               DataSourceID="odsSORTEOTALONARIO"    
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDSORTEOTALONARIO" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDSORTEOTALONARIO"/>
                     <asp:BoundField DataField="IDSORTEO" HeaderText="SORTEO"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDSORTEO"/>
                     <asp:BoundField DataField="SORTEONUMERODESDE" HeaderText="DESDE NUMERO"            
     SortExpression="SORTEONUMERODESDE">         
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="SORTEONUMEROHASTA" HeaderText="HASTA NUMERO"            
     SortExpression="SORTEONUMEROHASTA">        
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="FECHASOLICITUD" HeaderText="FECHA DE SOLICITUD"       
                        SortExpression="FECHASOLICITUD"   DataFormatString="{0:d}"/>
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
            <asp:Label ID="olblIDSORTEOTALONARIO" runat="server" Text="" Visible="false"></asp:Label> 
</div>
<div class="form-group">
<asp:Label ID="olblIDSORTEO" runat="server" Text="SORTEO:" CssClass="control-label"></asp:Label>     
                         <asp:SqlDataSource ID="odsSORTEO" runat="server"     
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="SORTEOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>        
                        <asp:DropDownList ID="oddlSORTEO" runat="server" DataSourceID="odsSORTEO" 
                DataTextField="SORTEODescripcion" DataValueField="IDSORTEO" CssClass="form-control">  
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblSORTEONUMERODESDE" runat="server" Text="DESDE NUMERO:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtSORTEONUMERODESDE" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblSORTEONUMEROHASTA" runat="server" Text="HASTA NUMERO:" CssClass="control-label"></asp:Label>             
         <asp:TextBox ID="otxtSORTEONUMEROHASTA" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>          
</div>
<div class="form-group">
<asp:Label ID="olblFECHASOLICITUD" runat="server" Text="FECHA DE SOLICITUD:" CssClass="control-label"></asp:Label>        
<asp:CalendarExtender ID="oceFECHASOLICITUD" runat="server" TargetControlID="otxtFECHASOLICITUD" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutFECHASOLICITUDPopup">                   
</asp:CalendarExtender>  
<asp:TextBox ID="otxtFECHASOLICITUD" CssClass="form-control" runat="server"></asp:TextBox>       
<asp:Button ID="obutFECHASOLICITUDPopup" runat="server" CssClass="obut-ocal-popup-button" />      
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

 
