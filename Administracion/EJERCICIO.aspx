<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EJERCICIO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EJERCICIO" title="Tratamiento Tabla EJERCICIO CONTABLE" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  <asp:Label ID="olblEJERCICIOTitulo" runat="server" Text="EJERCICIO CONTABLE"></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-default" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsEJERCICIO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="EJERCICIOTRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEJERCICIO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="240" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEJERCICIO  ,EJERCICIOCODIGO     ,EJERCICIODESCRIPCION      ,EJERCICIOFECHADESDE       ,EJERCICIOFECHAHASTA       ,EJERCICIOESTADO     "
                     DataSourceID="odsEJERCICIO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEJERCICIO" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEJERCICIO" />
                        <asp:BoundField DataField="EJERCICIOCODIGO" HeaderText="CODIGO EJERCICIO CONTABLE"
                           SortExpression="EJERCICIOCODIGO" />
                        <asp:BoundField DataField="EJERCICIODESCRIPCION" HeaderText="DESCRIPCION EJERCICIO CONTABLE"
                           SortExpression="EJERCICIODESCRIPCION" />
                        <asp:BoundField DataField="EJERCICIOFECHADESDE" HeaderText="FECHA INICIO EJERCICIO"
                           SortExpression="EJERCICIOFECHADESDE" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="EJERCICIOFECHAHASTA" HeaderText="FECHA FINAL DE EJERCICIO"
                           SortExpression="EJERCICIOFECHAHASTA" DataFormatString="{0:d}" />
                        <asp:TemplateField HeaderText="ESTADO ACTIVO DEL EJERCICIO" SortExpression="EJERCICIOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EJERCICIOESTADOBox" runat="server"
                                 Checked='<% # Bind("EJERCICIOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDEJERCICIO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIOCODIGO" runat="server" Text="CODIGO EJERCICIO CONTABLE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEJERCICIOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIODESCRIPCION" runat="server" Text="DESCRIPCION EJERCICIO CONTABLE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEJERCICIODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIOFECHADESDE" runat="server" Text="FECHA INICIO EJERCICIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CalendarExtender ID="oceEJERCICIOFECHADESDE" runat="server"
                     TargetControlID="otxtEJERCICIOFECHADESDE" Format="dd/MM/yyyy" PopupPosition="BottomRight"
                     PopupButtonID="obutEJERCICIOFECHADESDEPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtEJERCICIOFECHADESDE" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutEJERCICIOFECHADESDEPopup" runat="server" CssClass="obut-ocal-popup-button" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIOFECHAHASTA" runat="server" Text="FECHA FINAL DE EJERCICIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CalendarExtender ID="oceEJERCICIOFECHAHASTA" runat="server"
                     TargetControlID="otxtEJERCICIOFECHAHASTA" Format="dd/MM/yyyy" PopupPosition="BottomRight"
                     PopupButtonID="obutEJERCICIOFECHAHASTAPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtEJERCICIOFECHAHASTA" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutEJERCICIOFECHAHASTAPopup" runat="server" CssClass="obut-ocal-popup-button" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEJERCICIOESTADO" runat="server" Text="ESTADO ACTIVO DEL EJERCICIO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtEJERCICIOESTADO" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                     CssClass="btn-basic btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                     CssClass="btn basic btn btn-danger" />
               </div>
            </form>




         </asp:Panel>


      </asp:Content>