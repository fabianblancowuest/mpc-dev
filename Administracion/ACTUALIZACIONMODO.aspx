<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="ACTUALIZACIONMODO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_ACTUALIZACIONMODO" title="Tratamiento Tabla MODO DE ACTUALIZACION" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h1 class="titulo-rol">
                  <asp:Label ID="olblACTUALIZACIONMODOTitulo" runat="server" Text="MODO DE ACTUALIZACIÓN"></asp:Label>
               </h1>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="row contenedor-flexible margenes-y">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn-basic btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsACTUALIZACIONMODO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="ACTUALIZACIONMODOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvACTUALIZACIONMODO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDACTUALIZACIONMODO      ,ACTUALIZACIONMODOCODIGO         ,ACTUALIZACIONMODODESCRIPCION          ,ACTUALIZACIONMODOEXPLICACION         ,ACTUALIZACIONMODOCANTIDADMESES            ,ACTUALIZACIONMODOESTADO         "
                     DataSourceID="odsACTUALIZACIONMODO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDACTUALIZACIONMODO" HeaderText="id" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDACTUALIZACIONMODO" />
                        <asp:BoundField DataField="ACTUALIZACIONMODOCODIGO" HeaderText="Codigo actualizacion"
                           SortExpression="ACTUALIZACIONMODOCODIGO" />
                        <asp:BoundField DataField="ACTUALIZACIONMODODESCRIPCION"
                           HeaderText="Descripcion de la actualizacion" SortExpression="ACTUALIZACIONMODODESCRIPCION" />
                        <asp:BoundField DataField="ACTUALIZACIONMODOEXPLICACION"
                           HeaderText="Periodo en que se actualizan los costos"
                           SortExpression="ACTUALIZACIONMODOEXPLICACION" />
                        <asp:BoundField DataField="ACTUALIZACIONMODOCANTIDADMESES"
                           HeaderText="Cantidad de meses del intervalo" SortExpression="ACTUALIZACIONMODOCANTIDADMESES">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Estado" SortExpression="ACTUALIZACIONMODOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="ACTUALIZACIONMODOESTADOBox" runat="server"
                                 Checked='<% # Bind("ACTUALIZACIONMODOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDACTUALIZACIONMODO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACTUALIZACIONMODOCODIGO" runat="server" Text="Codigo actualizacion:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACTUALIZACIONMODOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACTUALIZACIONMODODESCRIPCION" runat="server"
                     Text="Descripcion de la actualizacion:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACTUALIZACIONMODODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACTUALIZACIONMODOEXPLICACION" runat="server"
                     Text="Periodo en que se actualizan los costos:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACTUALIZACIONMODOEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACTUALIZACIONMODOCANTIDADMESES" runat="server"
                     Text="Cantidad de meses del intervalo:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACTUALIZACIONMODOCANTIDADMESES" runat="server" CssClass="form-control"
                     MaxLength="4"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACTUALIZACIONMODOESTADO" runat="server" Text="Estado:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtACTUALIZACIONMODOESTADO" runat="server" />
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