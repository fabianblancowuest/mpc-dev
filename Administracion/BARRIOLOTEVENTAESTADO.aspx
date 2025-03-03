<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
   CodeFile="BARRIOLOTEVENTAESTADO.aspx.vb" Inherits="STRSYSTEM_Administracion_BARRIOLOTEVENTAESTADO"
   title="Tratamiento Tabla ESTADO DE VENTA" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblBARRIOLOTEVENTAESTADOTitulo" runat="server" Text="ESTADO DE VENTA DE LOTES">
               </asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="estado-venta-lotes">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="input">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsBARRIOLOTEVENTAESTADO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOLOTEVENTAESTADOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvBARRIOLOTEVENTAESTADO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDBARRIOLOTEVENTAESTADO         ,BARRIOLOTEVENTAESTADOCODIGO           ,BARRIOLOTEVENTAESTADODESCRIPCION            ,BARRIOLOTEVENTAESTADODISPONIBLE            "
                     DataSourceID="odsBARRIOLOTEVENTAESTADO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                           <ItemStyle />
                        </asp:CommandField>
                        <asp:BoundField DataField="IDBARRIOLOTEVENTAESTADO" HeaderText="id" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDBARRIOLOTEVENTAESTADO" />
                        <asp:BoundField DataField="BARRIOLOTEVENTAESTADOCODIGO" HeaderText="CODIGO DE TIPO VENTA"
                           SortExpression="BARRIOLOTEVENTAESTADOCODIGO" />
                        <asp:BoundField DataField="BARRIOLOTEVENTAESTADODESCRIPCION" HeaderText="DESCRIPCION TIPO VENTA"
                           SortExpression="BARRIOLOTEVENTAESTADODESCRIPCION" />
                        <asp:TemplateField HeaderText="ESTA DISPONIBLE"
                           SortExpression="BARRIOLOTEVENTAESTADODISPONIBLE">
                           <ItemTemplate>
                              <asp:CheckBox ID="BARRIOLOTEVENTAESTADODISPONIBLEBox" runat="server"
                                 Checked='<% # Bind("BARRIOLOTEVENTAESTADODISPONIBLE") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDBARRIOLOTEVENTAESTADO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEVENTAESTADOCODIGO" runat="server" Text="CODIGO DE TIPO VENTA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOLOTEVENTAESTADOCODIGO" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEVENTAESTADODESCRIPCION" runat="server" Text="DESCRIPCION TIPO VENTA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOLOTEVENTAESTADODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEVENTAESTADODISPONIBLE" runat="server" Text="ESTA DISPONIBLE:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtBARRIOLOTEVENTAESTADODISPONIBLE" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirma Alta" CssClass="btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandona Alta" CssClass="btn btn-danger" />
               </div>
            </form>




         </asp:Panel>


      </asp:Content>