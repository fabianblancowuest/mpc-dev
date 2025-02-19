<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="SORTEO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_SORTEO" title="Tratamiento Tabla SORTEOS" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  <asp:Label ID="olblSORTEOTitulo" runat="server" Text="SORTEOS"></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row contenedor-flexible margenes-y">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-basic btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsSORTEO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="SORTEOTRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvSORTEO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDSORTEO   ,SORTEOCODIGO      ,SORTEODESCRIPCION       ,SORTEOEXPLICACION      ,SORTEOESTADO      ,FECHADESDE     ,FECHAHASTA     "
                     DataSourceID="odsSORTEO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDSORTEO" HeaderText="id" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDSORTEO" />
                        <asp:BoundField DataField="SORTEOCODIGO" HeaderText="Codigo Sorteo"
                           SortExpression="SORTEOCODIGO" />
                        <asp:BoundField DataField="SORTEODESCRIPCION" HeaderText="Descripcion sorteo"
                           SortExpression="SORTEODESCRIPCION" />
                        <asp:BoundField DataField="SORTEOEXPLICACION" HeaderText="Explicacion del Sorteo"
                           SortExpression="SORTEOEXPLICACION" />
                        <asp:TemplateField HeaderText="Estado del Sorteo" SortExpression="SORTEOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="SORTEOESTADOBox" runat="server" Checked='<% # Bind("SORTEOESTADO") %>'
                                 Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FECHADESDE" HeaderText="Desde fecha" SortExpression="FECHADESDE"
                           DataFormatString="{0:d}" />
                        <asp:BoundField DataField="FECHAHASTA" HeaderText="Hasta fecha" SortExpression="FECHAHASTA"
                           DataFormatString="{0:d}" />
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
                  <asp:Label ID="olblIDSORTEO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOCODIGO" runat="server" Text="Codigo Sorteo:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtSORTEOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEODESCRIPCION" runat="server" Text="Descripcion sorteo:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOEXPLICACION" runat="server" Text="Explicacion del Sorteo:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtSORTEOEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblSORTEOESTADO" runat="server" Text="Estado del Sorteo:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtSORTEOESTADO" runat="server" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblFECHADESDE" runat="server" Text="Desde fecha:" CssClass="control-label">
                  </asp:Label>
                  <asp:CalendarExtender ID="oceFECHADESDE" runat="server" TargetControlID="otxtFECHADESDE"
                     Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHADESDEPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtFECHADESDE" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutFECHADESDEPopup" runat="server" CssClass="obut-ocal-popup-button" />
               </div>
               <div class="form-group">
                  <asp:Label ID="olblFECHAHASTA" runat="server" Text="Hasta fecha:" CssClass="control-label">
                  </asp:Label>
                  <asp:CalendarExtender ID="oceFECHAHASTA" runat="server" TargetControlID="otxtFECHAHASTA"
                     Format="dd/MM/yyyy" PopupPosition="BottomRight" PopupButtonID="obutFECHAHASTAPopup">
                  </asp:CalendarExtender>
                  <asp:TextBox ID="otxtFECHAHASTA" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:Button ID="obutFECHAHASTAPopup" runat="server" CssClass="obut-ocal-popup-button" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta"
                     CssClass="btn-basic btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta"
                     CssClass="btn-basic btn btn-danger" />
               </div>
            </form>




         </asp:Panel>


      </asp:Content>