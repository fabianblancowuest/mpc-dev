<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EJERCICIODETALLE.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EJERCICIODETALLE" title="Tratamiento Tabla PERIODOS DE UN EJERCICIO CONTABLE"
   Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblEJERCICIODETALLETitulo" runat="server" Text="PERIODOS DE UN EJERCICIO CONTABLE">
               </asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="periodos-ejercicio-contable">

            <div class="row">

               <div class="contenedor-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE EJERCICIO:" CssClass="mx-2">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsEJERCICIOOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EJERCICIOOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEJERCICIOOperador" runat="server" DataSourceID="odsEJERCICIOOPERADOR"
                     DataTextField="EJERCICIODescripcion" DataValueField="idEJERCICIO" CssClass="input"
                     AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsEJERCICIODETALLE" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EJERCICIODETALLETRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlEJERCICIOOperador" Name="idEJERCICIO"
                        PropertyName="SelectedValue" Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEJERCICIODETALLE" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEJERCICIODETALLE     ,IDEJERCICIO  ,EJERCICIODETALLECODIGO       ,EJERCICIODETALLEDESCRIPCION        ,EJERCICIODETALLEFECHADESDE          ,EJERCICIODETALLEFECHAHASTA         ,EJERCICIODETALLEESTADO        "
                     DataSourceID="odsEJERCICIODETALLE"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEJERCICIODETALLE" HeaderText="PERIODO EJERCICIO"
                           InsertVisible="False" ReadOnly="True" visible="False" SortExpression="IDEJERCICIODETALLE" />
                        <asp:BoundField DataField="IDEJERCICIO" HeaderText="EJERCICIO" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEJERCICIO" />
                        <asp:BoundField DataField="EJERCICIODETALLECODIGO" HeaderText="CODIGO PERIODO"
                           SortExpression="EJERCICIODETALLECODIGO" />
                        <asp:BoundField DataField="EJERCICIODETALLEDESCRIPCION" HeaderText="DESCRIPCION PERIOODO"
                           SortExpression="EJERCICIODETALLEDESCRIPCION" />
                        <asp:BoundField DataField="EJERCICIODETALLEFECHADESDE" HeaderText="FECHA INICIO PER�ODO"
                           SortExpression="EJERCICIODETALLEFECHADESDE" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="EJERCICIODETALLEFECHAHASTA" HeaderText="FECHA FINAL PER�ODO"
                           SortExpression="EJERCICIODETALLEFECHAHASTA" DataFormatString="{0:d}" />
                        <asp:TemplateField HeaderText="ESTADO DEL PER�ODO" SortExpression="EJERCICIODETALLEESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EJERCICIODETALLEESTADOBox" runat="server"
                                 Checked='<% # Bind("EJERCICIODETALLEESTADO") %>' Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                     </Columns>
                  </asp:GridView>

               </div>
            </div>
            <br />
            <br />


            <div class="row">
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn-basic btn btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDEJERCICIODETALLE" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEJERCICIO" runat="server" Text="EJERCICIO:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEJERCICIO" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EJERCICIOTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEJERCICIO" runat="server" DataSourceID="odsEJERCICIO"
                     DataTextField="EJERCICIODescripcion" DataValueField="IDEJERCICIO" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODETALLECODIGO" runat="server" Text="CÓDIGO PERÍODO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEJERCICIODETALLECODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODETALLEDESCRIPCION" runat="server" Text="DESCRIPCION PERÍODO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEJERCICIODETALLEDESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODETALLEFECHADESDE" runat="server" Text="FECHA INICIO PERÍODO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CalendarExtender ID="oceEJERCICIODETALLEFECHADESDE" runat="server"
                     TargetControlID="otxtEJERCICIODETALLEFECHADESDE" Format="dd/MM/yyyy" PopupPosition="BottomRight"
                     PopupButtonID="obutEJERCICIODETALLEFECHADESDEPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtEJERCICIODETALLEFECHADESDE" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutEJERCICIODETALLEFECHADESDEPopup" runat="server"
                     CssClass="obut-ocal-popup-button" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODETALLEFECHAHASTA" runat="server" Text="FECHA FINAL PERÍODO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CalendarExtender ID="oceEJERCICIODETALLEFECHAHASTA" runat="server"
                     TargetControlID="otxtEJERCICIODETALLEFECHAHASTA" Format="dd/MM/yyyy" PopupPosition="BottomRight"
                     PopupButtonID="obutEJERCICIODETALLEFECHAHASTAPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtEJERCICIODETALLEFECHAHASTA" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutEJERCICIODETALLEFECHAHASTAPopup" runat="server"
                     CssClass="obut-ocal-popup-button" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODETALLEESTADO" runat="server" Text="ESTADO DEL PERÍODO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtEJERCICIODETALLEESTADO" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10 text-center">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <div class="contenedor-flexible">
                     <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                        CssClass="btn-basic btn btn-success" />
                     <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                        CssClass="btn-basic btn btn-danger" />
                  </div>
               </div>
            </form>




         </asp:Panel>


      </asp:Content>