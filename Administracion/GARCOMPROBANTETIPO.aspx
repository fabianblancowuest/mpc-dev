<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="GARCOMPROBANTETIPO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_GARCOMPROBANTETIPO" title="Tratamiento Tabla TIPO DE COMPROBANTE EN
GASTOS A RENDIR" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblGARCOMPROBANTETIPOTitulo" runat="server" Text="TIPO DE COMPROBANTE EN GASTOS A RENDIR"
                  CssClass="titulo-rol"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="tipo-comprobante-gar">

            <div class="contenedor-busqueda">
               <!-- <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label> -->
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="form-control">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-basic btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsGARCOMPROBANTETIPO" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="GARCOMPROBANTETIPOTRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvGARCOMPROBANTETIPO" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDGARCOMPROBANTETIPO        ,GARCOMPROBANTETIPOCODIGO           ,GARCOMPROBANTETIPODESCRIPCION            "
                     DataSourceID="odsGARCOMPROBANTETIPO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDGARCOMPROBANTETIPO" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDGARCOMPROBANTETIPO" />
                        <asp:BoundField DataField="GARCOMPROBANTETIPOCODIGO" HeaderText="CODIGO"
                           SortExpression="GARCOMPROBANTETIPOCODIGO" />
                        <asp:BoundField DataField="GARCOMPROBANTETIPODESCRIPCION" HeaderText="DESCRIPCION"
                           SortExpression="GARCOMPROBANTETIPODESCRIPCION" />
                     </Columns>
                  </asp:GridView>

               </div>
            </div>
            <br />
            <br />


            <div class="row">
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-basic btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDGARCOMPROBANTETIPO" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblGARCOMPROBANTETIPOCODIGO" runat="server" Text="CODIGO:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtGARCOMPROBANTETIPOCODIGO" runat="server" CssClass="form-control" MaxLength="10">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblGARCOMPROBANTETIPODESCRIPCION" runat="server" Text="DESCRIPCION:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtGARCOMPROBANTETIPODESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
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