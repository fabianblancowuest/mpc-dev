<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="ACCESOROL.aspx.vb"
   Inherits="STRSYSTEM_Administracion_ACCESOROL" title="Tratamiento Tabla ROLES DEL SISTEMA" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblACCESOROLTitulo" runat="server" Text="ROLES DEL SISTEMA"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="roles-del-sistema">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsACCESOROL" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="ACCESOROLTRAERCADENA" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div id="tabla-acceso-rol" class="table-responsive">
                  <asp:GridView ID="ogvACCESOROL" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi tabla-adaptada" AlternatingRowStyle-CssClass="alt" AllowPaging="True"
                     PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDACCESOROL     ,ACCESOROLCODIGO       ,ACCESOROLDESCRIPCION        ,ACCESOROLEXPLICACION        ,ACCESOROLPAGINA       ,ACCESOROLDOCUMENTOOPERATIVO             ,ACCESOROLESTADO       "
                     DataSourceID="odsACCESOROL"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDACCESOROL" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDACCESOROL" />
                        <asp:BoundField DataField="ACCESOROLCODIGO" HeaderText="CÓDIGO DE ROL"
                           SortExpression="ACCESOROLCODIGO" />
                        <asp:BoundField DataField="ACCESOROLDESCRIPCION" HeaderText="DESCRIPCIÓN DEL ROL"
                           SortExpression="ACCESOROLDESCRIPCION" />
                        <asp:BoundField DataField="ACCESOROLEXPLICACION" HeaderText="EXPLICACIÓN EXTENDIDA DEL ROL"
                           SortExpression="ACCESOROLEXPLICACION" />
                        <asp:BoundField DataField="ACCESOROLPAGINA" HeaderText="PÁGINA WEB"
                           SortExpression="ACCESOROLPAGINA" />
                        <asp:BoundField DataField="ACCESOROLDOCUMENTOOPERATIVO" HeaderText="DOCUMENTO"
                           SortExpression="ACCESOROLDOCUMENTOOPERATIVO" />
                        <asp:TemplateField HeaderText="ESTADO (HABILITADO / INHABILITADO)"
                           SortExpression="ACCESOROLESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="ACCESOROLESTADOBox" runat="server"
                                 Checked='<% # Bind("ACCESOROLESTADO") %>' Enabled="false" />
                           </ItemTemplate>
                           <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                     </Columns>
                  </asp:GridView>

               </div>
            </div>


            <div class="mt-4 text-center">
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn-basic btn btn-success" />
            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDACCESOROL" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLCODIGO" runat="server" Text="CÓDIGO DE ROL:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtACCESOROLCODIGO" runat="server" CssClass="form-control" MaxLength="65">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLDESCRIPCION" runat="server" Text="DESCRIPCIÓN DEL ROL:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACCESOROLDESCRIPCION" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLEXPLICACION" runat="server" Text="EXPLICACIÓN EXTENDIDA DEL ROL:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACCESOROLEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLPAGINA" runat="server" Text="PÁGINA WEB:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtACCESOROLPAGINA" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLDOCUMENTOOPERATIVO" runat="server" Text="DOCUMENTO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtACCESOROLDOCUMENTOOPERATIVO" runat="server" CssClass="form-control"
                     MaxLength="100"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblACCESOROLESTADO" runat="server" Text="ESTADO (HABILITADO / INHABILITADO):"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtACCESOROLESTADO" runat="server" />
               </div>

               <div class="col-sm-offset-2 col-sm-10">

                  <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
                  <br />
                  <asp:Button ID="obutAltaConfirmada" runat="server" Text="Confirmar Alta" CssClass="btn btn-success" />
                  <asp:Button ID="obutAltaAbandonada" runat="server" Text="Abandonar Alta" CssClass="btn btn-danger" />
               </div>
            </form>
         </asp:Panel>

         <script>
            // document.addEventListener("DOMContentLoaded", () => {
            // const tablaAccesoRol = document.querySelector("#tabla-acceso-rol table");

            // if (!tablaAccesoRol) return; // Evitar errores si no se encuentra la tabla

            // console.log(tablaAccesoRol);

            // const filas = tablaAccesoRol.querySelectorAll("tr");

            // filas.forEach(fila => {
            // const celdas = fila.querySelectorAll("td");
            // if (celdas.length > 3) { // Asegurarse de que la fila tiene al menos 4 celdas
            // celdas[3].style.width = "300px !important";
            // }
            // });
            // });

         </script>


      </asp:Content>