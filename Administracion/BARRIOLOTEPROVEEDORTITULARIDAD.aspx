<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
   CodeFile="BARRIOLOTEPROVEEDORTITULARIDAD.aspx.vb" Inherits="STRSYSTEM_Administracion_BARRIOLOTEPROVEEDORTITULARIDAD"
   title="Tratamiento Tabla
TITULARIDAD DE LOTES" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADTitulo" runat="server" Text="TITULARIDAD DE LOTES">
               </asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="titularidad-lotes">

            <div class="row">

               <div class="contenedor-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE BARRIOLOTE:" CssClass="mx-2">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsBARRIOLOTEOperador" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOLOTEOPERADORSELECCIONA"
                     SelectCommandType="StoredProcedure">
                     <SelectParameters>
                        <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                     </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="oddlBARRIOLOTEOperador" runat="server" DataSourceID="odsBARRIOLOTEOPERADOR"
                     DataTextField="BARRIOLOTEDescripcion" DataValueField="idBARRIOLOTE" CssClass="input"
                     AutoPostBack="True">
                  </asp:DropDownList>
               </div>
            </div>
            <div>

               <asp:SqlDataSource ID="odsBARRIOLOTEPROVEEDORTITULARIDAD" runat="server"
                  ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="BARRIOLOTEPROVEEDORTITULARIDADTRAERID" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlBARRIOLOTEOperador" Name="idBARRIOLOTE"
                        PropertyName="SelectedValue" Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvBARRIOLOTEPROVEEDORTITULARIDAD" runat="server" AutoGenerateColumns="False"
                     CssClass="table-cemmi" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15"
                     PagerStyle-CssClass="pgr"
                     DataKeyNames="IDBARRIOLOTEPROVEEDORTITULARIDAD           ,IDBARRIOLOTE    ,IDPERSONA    ,BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE               ,BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION              ,BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO                    ,BARRIOLOTEPROVEEDORTITULARIDADESTADO              "
                     DataSourceID="odsBARRIOLOTEPROVEEDORTITULARIDAD"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDBARRIOLOTEPROVEEDORTITULARIDAD" HeaderText="ID"
                           InsertVisible="False" ReadOnly="True" visible="False"
                           SortExpression="IDBARRIOLOTEPROVEEDORTITULARIDAD" />
                        <asp:BoundField DataField="IDBARRIOLOTE" HeaderText="LOTE" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDBARRIOLOTE" />
                        <asp:BoundField DataField="IDPERSONA" HeaderText="PERSONA" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDPERSONA" />
                        <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" HeaderText="PORCENTAJE"
                           SortExpression="BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" HeaderText="EXPLICACION"
                           SortExpression="BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" />
                        <asp:BoundField DataField="BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO"
                           HeaderText="MAGEN DOCUMENTONTO"
                           SortExpression="BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" />
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="BARRIOLOTEPROVEEDORTITULARIDADESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="BARRIOLOTEPROVEEDORTITULARIDADESTADOBox" runat="server"
                                 Checked='<% # Bind("BARRIOLOTEPROVEEDORTITULARIDADESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDBARRIOLOTEPROVEEDORTITULARIDAD" runat="server" Text="" Visible="false">
                  </asp:Label>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDBARRIOLOTE" runat="server" Text="LOTE:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsBARRIOLOTE" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="BARRIOLOTETraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlBARRIOLOTE" runat="server" DataSourceID="odsBARRIOLOTE"
                     DataTextField="BARRIOLOTEDescripcion" DataValueField="IDBARRIOLOTE" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDPERSONA" runat="server" Text="PERSONA:" CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsPERSONA" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="PERSONATraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlPERSONA" runat="server" DataSourceID="odsPERSONA"
                     DataTextField="PERSONADescripcion" DataValueField="IDPERSONA" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" runat="server" Text="PORCENTAJE:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE" runat="server" CssClass="form-control"
                     MaxLength="20"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" runat="server" Text="EXPLICACION:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION" runat="server" CssClass="form-control"
                     TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" runat="server"
                     Text="MAGEN DOCUMENTONTO:" CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO" runat="server"
                     CssClass="form-control" TextMode="MultiLine" height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblBARRIOLOTEPROVEEDORTITULARIDADESTADO" runat="server" Text="ESTADO:"
                     CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO" runat="server" />
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