<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EMPRESASECTOR.aspx.vb"
   Inherits="STRSYSTEM_Administracion_EMPRESASECTOR" title="Tratamiento Tabla SECTOR DE EMPRESA" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblEMPRESASECTORTitulo" runat="server" Text="SECTOR DE EMPRESA"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" class="sector-de-empresa">

            <div class="row">

               <div class="caja-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE EMPRESA:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESAOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESAOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESAOperador" runat="server" DataSourceID="odsEMPRESAOPERADOR"
                     DataTextField="EMPRESADescripcion" DataValueField="idEMPRESA" AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsEMPRESASECTOR" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESASECTORTRAERID"
                  SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlEMPRESAOperador" Name="idEmpresa" PropertyName="SelectedValue"
                        Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvEMPRESASECTOR" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDEMPRESASECTOR       ,IDEMPRESA    ,EMPRESASECTORCODIGO         ,EMPRESASECTORDESCRIPCION          ,EMPRESASECTOREXPLICACION          ,EMPRESASECTORESTADO          "
                     DataSourceID="odsEMPRESASECTOR"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDEMPRESASECTOR" HeaderText="ID" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDEMPRESASECTOR" />
                        <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEMPRESA" />
                        <asp:BoundField DataField="EMPRESASECTORCODIGO" HeaderText="CODIGO DE SECTOR"
                           SortExpression="EMPRESASECTORCODIGO" />
                        <asp:BoundField DataField="EMPRESASECTORDESCRIPCION" HeaderText="DESCRIPCION DEL SECTOR"
                           SortExpression="EMPRESASECTORDESCRIPCION" />
                        <asp:BoundField DataField="EMPRESASECTOREXPLICACION"
                           HeaderText="EXPLICACION EXTENDIDA DEL SECTOR" SortExpression="EMPRESASECTOREXPLICACION" />
                        <asp:TemplateField HeaderText="ESTADO (VERDADERO=ACTIVO / FALSO=INACTIVO)"
                           SortExpression="EMPRESASECTORESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="EMPRESASECTORESTADOBox" runat="server"
                                 Checked='<% # Bind("EMPRESASECTORESTADO") %>' Enabled="false" />
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
               <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn btn-basic btn-success" />

            </div>

         </asp:Panel>


         <asp:Panel ID="PanelAlta" runat="server" Visible="false">
            <form class="form" role="form">

               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESASECTOR" runat="server" Text="" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDEMPRESA" runat="server" Text="EMPRESA:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsEMPRESA" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EMPRESATraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlEMPRESA" runat="server" DataSourceID="odsEMPRESA"
                     DataTextField="EMPRESADescripcion" DataValueField="IDEMPRESA" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASECTORCODIGO" runat="server" Text="CODIGO DE SECTOR:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASECTORCODIGO" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASECTORDESCRIPCION" runat="server" Text="DESCRIPCION DEL SECTOR:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASECTORDESCRIPCION" runat="server" CssClass="form-control" MaxLength="50">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASECTOREXPLICACION" runat="server" Text="EXPLICACION EXTENDIDA DEL SECTOR:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtEMPRESASECTOREXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblEMPRESASECTORESTADO" runat="server"
                     Text="ESTADO (VERDADERO=ACTIVO / FALSO=INACTIVO):" CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtEMPRESASECTORESTADO" runat="server" />
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