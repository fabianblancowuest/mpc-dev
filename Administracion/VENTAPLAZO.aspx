<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="VENTAPLAZO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_VENTAPLAZO" title="Tratamiento Tabla PLAZOS DE VENTA" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblVENTAPLAZOTitulo" runat="server" Text="PLAZOS DE VENTA"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="venta-plazo">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="input">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsVENTAPLAZO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="VENTAPLAZOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvVENTAPLAZO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDVENTAPLAZO    ,VENTAPLAZOCODIGO       ,VENTAPLAZODESCRIPCION        ,VENTAPLAZOMESES       ,VENTAPLAZOESTADO       "
                     DataSourceID="odsVENTAPLAZO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDVENTAPLAZO" HeaderText="id" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDVENTAPLAZO" />
                        <asp:BoundField DataField="VENTAPLAZOCODIGO" HeaderText="CODIGO PLAZO VENTA"
                           SortExpression="VENTAPLAZOCODIGO" />
                        <asp:BoundField DataField="VENTAPLAZODESCRIPCION" HeaderText="DESCRIPCION PLAZO VENTA"
                           SortExpression="VENTAPLAZODESCRIPCION" />
                        <asp:BoundField DataField="VENTAPLAZOMESES" HeaderText="CANTIDAD DE MESES"
                           SortExpression="VENTAPLAZOMESES">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="VENTAPLAZOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="VENTAPLAZOESTADOBox" runat="server"
                                 Checked='<% # Bind("VENTAPLAZOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDVENTAPLAZO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblVENTAPLAZOCODIGO" runat="server" Text="CODIGO PLAZO VENTA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtVENTAPLAZOCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblVENTAPLAZODESCRIPCION" runat="server" Text="DESCRIPCION PLAZO VENTA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtVENTAPLAZODESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblVENTAPLAZOMESES" runat="server" Text="CANTIDAD DE MESES:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtVENTAPLAZOMESES" runat="server" CssClass="form-control" MaxLength="4">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblVENTAPLAZOESTADO" runat="server" Text="ESTADO:" CssClass="control-label">
                  </asp:Label>
                  <asp:CheckBox ID="otxtVENTAPLAZOESTADO" runat="server" />
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