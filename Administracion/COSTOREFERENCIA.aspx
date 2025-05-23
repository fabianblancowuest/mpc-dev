<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="COSTOREFERENCIA.aspx.vb"
   Inherits="STRSYSTEM_Administracion_COSTOREFERENCIA"
   title="Tratamiento Tabla VALORES DE REFERENCIA POR PERÍODO CONTABLE" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <div class="row">
               <h2 class="titulo-rol">
                  <!-- <asp:Label ID="olblCOSTOREFERENCIATitulo" runat="server"
                     Text="VALORES DE REFERENCIA POR PERÍODO CONTABLE"></asp:Label> -->
                  VALORES DE REFERENCIA POR PERÍODO CONTABLE
               </h2>
            </div>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="valores-referencia-periodo-contable">

            <div class="contenedor-busqueda">
               <asp:Label ID="olblBuscar" runat="server" Text="Localizar"
                  ToolTip="Permite realizar la busqueda de los datos requeridos. Para traer todos los datos de la tabla ingresar TODO y apretar el boton BUSCAR ">
               </asp:Label>
               <asp:TextBox ID="otxtCadena" runat="server" CssClass="input">Todo</asp:TextBox>
               <asp:Button ID="obutBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" />
            </div>
            <div>

               <asp:SqlDataSource ID="odsCOSTOREFERENCIA" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COSTOREFERENCIATRAERCADENA"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="otxtCadena" Name="cadena" PropertyName="Text" Type="String" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvCOSTOREFERENCIA" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDCOSTOREFERENCIA      ,COSTOREFERENCIACODIGO         ,COSTOREFERENCIADESCRIPCION          ,COSTOREFERENCIAEXPLICACION         ,COSTOREFERENCIAESTADO         "
                     DataSourceID="odsCOSTOREFERENCIA"
                     EmptyDataText="No existen entradas en la tabla con el argumento de búsqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDCOSTOREFERENCIA" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDCOSTOREFERENCIA" />
                        <asp:BoundField DataField="COSTOREFERENCIACODIGO" HeaderText="CÓDIGO REFERENCIA"
                           SortExpression="COSTOREFERENCIACODIGO" />
                        <asp:BoundField DataField="COSTOREFERENCIADESCRIPCION" HeaderText="DESCRIPCIÓN REFERENCIA"
                           SortExpression="COSTOREFERENCIADESCRIPCION" />
                        <asp:BoundField DataField="COSTOREFERENCIAEXPLICACION" HeaderText="EXPLICACIÓN DE LA REFERENCIA"
                           SortExpression="COSTOREFERENCIAEXPLICACION" />
                        <asp:TemplateField HeaderText="ESTADO ACTIVO DE LA REFERENCIA"
                           SortExpression="COSTOREFERENCIAESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="COSTOREFERENCIAESTADOBox" runat="server"
                                 Checked='<% # Bind("COSTOREFERENCIAESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDCOSTOREFERENCIA" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOSTOREFERENCIACODIGO" runat="server" Text="C0DIGO REFERENCIA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOSTOREFERENCIACODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOSTOREFERENCIADESCRIPCION" runat="server" Text="DESCRIPCION REFERENCIA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOSTOREFERENCIADESCRIPCION" runat="server" CssClass="form-control"
                     MaxLength="50"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOSTOREFERENCIAEXPLICACION" runat="server" Text="EXPLICACION DE LA REFERENCIA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCOSTOREFERENCIAEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCOSTOREFERENCIAESTADO" runat="server" Text="ESTADO ACTIVO DE LA REFERENCIA:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtCOSTOREFERENCIAESTADO" runat="server" />
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