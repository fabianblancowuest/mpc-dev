<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="PLANCUENTAGRUPO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_PLANCUENTAGRUPO" title="Tratamiento Tabla MANTENIMIENTO DE GRUPOS DE
CUENTAS CONTABLES" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h2 class="titulo-rol">
               <asp:Label ID="olblPLANCUENTAGRUPOTitulo" runat="server"
                  Text="MANTENIMIENTO DE GRUPOS DE CUENTAS CONTABLES"></asp:Label>
            </h2>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn-basic btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsPLANCUENTAGRUPO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="PLANCUENTAGRUPOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvPLANCUENTAGRUPO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDPLANCUENTAGRUPO       ,PLANCUENTAGRUPOCODIGO          ,PLANCUENTAGRUPODESCRIPCION           ,PLANCUENTAGRUPOESTADO          "
                     DataSourceID="odsPLANCUENTAGRUPO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDPLANCUENTAGRUPO" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDPLANCUENTAGRUPO" />
                        <asp:BoundField DataField="PLANCUENTAGRUPOCODIGO" HeaderText="CODIGO DE GRUPO"
                           SortExpression="PLANCUENTAGRUPOCODIGO" />
                        <asp:BoundField DataField="PLANCUENTAGRUPODESCRIPCION" HeaderText="DESCRIPCION DE GRUPO"
                           SortExpression="PLANCUENTAGRUPODESCRIPCION" />
                        <asp:TemplateField HeaderText="ESTADO DE GRUPO" SortExpression="PLANCUENTAGRUPOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="PLANCUENTAGRUPOESTADOBox" runat="server"
                                 Checked='<% # Bind("PLANCUENTAGRUPOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDPLANCUENTAGRUPO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPLANCUENTAGRUPOCODIGO" runat="server" Text="CODIGO DE GRUPO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtPLANCUENTAGRUPOCODIGO" runat="server" CssClass="form-control" MaxLength="20">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPLANCUENTAGRUPODESCRIPCION" runat="server" Text="DESCRIPCION DE GRUPO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtPLANCUENTAGRUPODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="100"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblPLANCUENTAGRUPOESTADO" runat="server" Text="ESTADO DE GRUPO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtPLANCUENTAGRUPOESTADO" runat="server" />
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