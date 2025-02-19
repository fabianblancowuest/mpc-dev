
<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="GARRENDICION.aspx.vb" Inherits="STRSYSTEM_Administracion_GARRENDICION" title="Tratamiento Tabla RENDICION DE GASTOS" Culture="es-AR"                         %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>      
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>  


<asp:Panel ID="PanelTitulo" runat="server">
  <div class="row">
        <h1>

<asp:Label ID="olblGARRENDICIONTitulo" runat="server" Text="RENDICION DE GASTOS"></asp:Label>          
      </h1>
    </div>
 </asp:Panel> 

        <asp:Panel ID="Panel1" runat="server">
        
         <div class="row">
                   
                  <div class="form-group">  
             <asp:Label ID="Label1" runat="server" Text="SELECCIONE GAR:"   CssClass="control-label"></asp:Label>       
             <asp:SqlDataSource ID="odsGAROperador" runat="server"      
             ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"     
             SelectCommand="GAROPERADORSELECCIONA" SelectCommandType="StoredProcedure">             
              <SelectParameters>
              <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
                       </asp:SqlDataSource> 
                     <asp:DropDownList ID="oddlGAROperador" runat="server" DataSourceID="odsGAROPERADOR"      
              DataTextField="GARDescripcion" DataValueField="idGAR" CssClass="form-control" AutoPostBack="True">     
            </asp:DropDownList> 
</div>
</div>
<div>

              <asp:SqlDataSource ID="odsGARRENDICION" runat="server"  
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"  
                  SelectCommand="GARRENDICIONTRAERID" SelectCommandType="StoredProcedure">        
                <SelectParameters>
               <asp:ControlParameter ControlID="oddlGAROperador" Name="idGAR" PropertyName="SelectedValue" Type="Int16"  />   
               </SelectParameters>
              </asp:SqlDataSource>
<div class="table-responsive">
             <asp:GridView ID="ogvGARRENDICION" runat="server" AutoGenerateColumns="False"  CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"         
                  DataKeyNames="IDGARRENDICION    ,IDGAR  ,GARRENDICIONFECHA       ,IDGARCOMPROBANTETIPO        ,GARRENDICIONMONTOGAI        ,GARRENDICIONMONTOTRANSFERENCIAEMPRESA                ,GARRENDICIONMONTOOPERADORACUENTA               ,GARRENDICIONCOMPROBANTE          ,GARRENDICIONDESCRIPCION        ,GARRENDICIONCOMPROBANTEIMAGEN             ,GARRENDICIONESTADO       ,GARRENDICIONFECHAA       ,GARADMINISTRACIONRENDICIONOPERADOR             ,GARRENDICIONASIENTOCABECERA           " 
               DataSourceID="odsGARRENDICION"  
               EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado" 
               AllowSorting="True" >
               <Columns>
               <asp:CommandField ShowSelectButton="True" SelectText="Seleccione"> 
               </asp:CommandField> 
                     <asp:BoundField DataField="IDGARRENDICION" HeaderText="id"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDGARRENDICION"/>
                     <asp:BoundField DataField="IDGAR" HeaderText="GAR"    
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDGAR"/>
                     <asp:BoundField DataField="GARRENDICIONFECHA" HeaderText="FECHA GASTO"         
                        SortExpression="GARRENDICIONFECHA"   DataFormatString="{0:d}"/>
                     <asp:BoundField DataField="IDGARCOMPROBANTETIPO" HeaderText="TIPO COMPROBANTE"            
                        InsertVisible="False" ReadOnly="True" visible="False" 
                        SortExpression="IDGARCOMPROBANTETIPO"/> 
                     <asp:BoundField DataField="GARRENDICIONMONTOGAI" HeaderText="GASTO A RENDIR"          
     SortExpression="GARRENDICIONMONTOGAI">       
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="GARRENDICIONMONTOTRANSFERENCIAEMPRESA" HeaderText="TRANSFERENCIA"                   
     SortExpression="GARRENDICIONMONTOTRANSFERENCIAEMPRESA">                
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="GARRENDICIONMONTOOPERADORACUENTA" HeaderText="MONTO PROPIO DE OPERADOR"                      
     SortExpression="GARRENDICIONMONTOOPERADORACUENTA">              
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="GARRENDICIONCOMPROBANTE" HeaderText="COMPROBANTE"              
                        SortExpression="GARRENDICIONCOMPROBANTE"/>   
                     <asp:BoundField DataField="GARRENDICIONDESCRIPCION" HeaderText="DESCRIPCION"         
                        SortExpression="GARRENDICIONDESCRIPCION"/> 
                     <asp:BoundField DataField="GARRENDICIONCOMPROBANTEIMAGEN" HeaderText="IMAGEN"             
                        SortExpression="GARRENDICIONCOMPROBANTEIMAGEN"/>      
                   <asp:TemplateField HeaderText="ESTADO"  SortExpression="GARRENDICIONESTADO" >      
                     <ItemTemplate>
                     <asp:CheckBox ID="GARRENDICIONESTADOBox"  runat="server" Checked='<% # Bind("GARRENDICIONESTADO") %>' Enabled="false"  />          
                   </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                     <asp:BoundField DataField="GARRENDICIONFECHAA" HeaderText="FECHA DE RENDICION"          
                        SortExpression="GARRENDICIONFECHAA"   DataFormatString="{0:d}"/>
                     <asp:BoundField DataField="GARADMINISTRACIONRENDICIONOPERADOR" HeaderText="OPERADOR QUE TOMA RENDICION"                    
     SortExpression="GARADMINISTRACIONRENDICIONOPERADOR">            
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
                     <asp:BoundField DataField="GARRENDICIONASIENTOCABECERA" HeaderText="ASIENTO DE GASTO"             
     SortExpression="GARRENDICIONASIENTOCABECERA">          
     <ItemStyle HorizontalAlign="Right" />
     </asp:BoundField>
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
            <asp:Label ID="olblIDGARRENDICION" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form-group">
<asp:Label ID="olblIDGAR" runat="server" Text="GAR:" CssClass="control-label"></asp:Label>  
                         <asp:SqlDataSource ID="odsGAR" runat="server"   
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="GARTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>       
                        <asp:DropDownList ID="oddlGAR" runat="server" DataSourceID="odsGAR" 
                DataTextField="GARDescripcion" DataValueField="IDGAR" CssClass="form-control">
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONFECHA" runat="server" Text="FECHA GASTO:" CssClass="control-label"></asp:Label>          
<asp:CalendarExtender ID="oceGARRENDICIONFECHA" runat="server" TargetControlID="otxtGARRENDICIONFECHA" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutGARRENDICIONFECHAPopup">                          
</asp:CalendarExtender>  
<asp:TextBox ID="otxtGARRENDICIONFECHA" CssClass="form-control" runat="server"></asp:TextBox>         
<asp:Button ID="obutGARRENDICIONFECHAPopup" runat="server" CssClass="obut-ocal-popup-button" />        
</div>
<div class="form-group">
<asp:Label ID="olblIDGARCOMPROBANTETIPO" runat="server" Text="TIPO COMPROBANTE:" CssClass="control-label"></asp:Label>              
                         <asp:SqlDataSource ID="odsGARCOMPROBANTETIPO" runat="server"          
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"   
                SelectCommand="GARCOMPROBANTETIPOTraerOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>             
                        <asp:DropDownList ID="oddlGARCOMPROBANTETIPO" runat="server" DataSourceID="odsGARCOMPROBANTETIPO"            
                DataTextField="GARCOMPROBANTETIPODescripcion" DataValueField="IDGARCOMPROBANTETIPO" CssClass="form-control">             
            </asp:DropDownList> 
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONMONTOGAI" runat="server" Text="GASTO A RENDIR:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtGARRENDICIONMONTOGAI" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONMONTOTRANSFERENCIAEMPRESA" runat="server" Text="TRANSFERENCIA:" CssClass="control-label"></asp:Label>                    
         <asp:TextBox ID="otxtGARRENDICIONMONTOTRANSFERENCIAEMPRESA" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>                 
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONMONTOOPERADORACUENTA" runat="server" Text="MONTO PROPIO DE OPERADOR:" CssClass="control-label"></asp:Label>                       
         <asp:TextBox ID="otxtGARRENDICIONMONTOOPERADORACUENTA" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>                
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONCOMPROBANTE" runat="server" Text="COMPROBANTE:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtGARRENDICIONCOMPROBANTE" runat="server" CssClass="form-control" MaxLength="14"></asp:TextBox>           
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONDESCRIPCION" runat="server" Text="DESCRIPCION:" CssClass="control-label"></asp:Label>           
         <asp:TextBox ID="otxtGARRENDICIONDESCRIPCION" runat="server" CssClass="form-control" TextMode="MultiLine" height="500px" ></asp:TextBox>         
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONCOMPROBANTEIMAGEN" runat="server" Text="IMAGEN:" CssClass="control-label"></asp:Label>              
         <asp:TextBox ID="otxtGARRENDICIONCOMPROBANTEIMAGEN" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>              
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>         
      <asp:CheckBox ID="otxtGARRENDICIONESTADO" runat="server"  />      
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONFECHAA" runat="server" Text="FECHA DE RENDICION:" CssClass="control-label"></asp:Label>            
<asp:CalendarExtender ID="oceGARRENDICIONFECHAA" runat="server" TargetControlID="otxtGARRENDICIONFECHAA" Format="dd/MM/yyyy"  PopupPosition="BottomRight"   PopupButtonID="obutGARRENDICIONFECHAAPopup">                            
</asp:CalendarExtender>  
<asp:TextBox ID="otxtGARRENDICIONFECHAA" CssClass="form-control" runat="server"></asp:TextBox>         
<asp:Button ID="obutGARRENDICIONFECHAAPopup" runat="server" CssClass="obut-ocal-popup-button" />         
</div>
<div class="form-group">
<asp:Label ID="olblGARADMINISTRACIONRENDICIONOPERADOR" runat="server" Text="OPERADOR QUE TOMA RENDICION:" CssClass="control-label"></asp:Label>                      
         <asp:TextBox ID="otxtGARADMINISTRACIONRENDICIONOPERADOR" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>              
</div>
<div class="form-group">
<asp:Label ID="olblGARRENDICIONASIENTOCABECERA" runat="server" Text="ASIENTO DE GASTO:" CssClass="control-label"></asp:Label>               
         <asp:TextBox ID="otxtGARRENDICIONASIENTOCABECERA" runat="server" CssClass="form-control" MaxLength="4"></asp:TextBox>           
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

 
