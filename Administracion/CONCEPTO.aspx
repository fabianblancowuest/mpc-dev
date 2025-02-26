<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="CONCEPTO.aspx.vb"
   Inherits="STRSYSTEM_Administracion_CONCEPTO" title="Tratamiento Tabla CONCEPTOS CONTABLES" Culture="es-AR" %>
   <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
      <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      </asp:Content>
      <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" CssClass="conceptos">

         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true"></asp:ScriptManager>


         <asp:Panel ID="PanelTitulo" runat="server">
            <h1 class="titulo-rol">
               <asp:Label ID="olblCONCEPTOTitulo" runat="server" Text="CONCEPTOS CONTABLES"></asp:Label>
            </h1>
         </asp:Panel>

         <asp:Panel ID="Panel1" runat="server" CssClass="conceptos-contables">

            <div class="row">

               <div class="caja-busqueda">
                  <asp:Label ID="Label1" runat="server" Text="SELECCIONE EMPRESA:"></asp:Label>
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

               <asp:SqlDataSource ID="odsCONCEPTO" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                  SelectCommand="CONCEPTOTRAERID" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="oddlEMPRESAOperador" Name="idEMPRESA" PropertyName="SelectedValue"
                        Type="Int16" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <div class="table-responsive">
                  <asp:GridView ID="ogvCONCEPTO" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
                     AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" PagerStyle-CssClass="pgr"
                     DataKeyNames="IDCONCEPTO    ,IDEMPRESA    ,CONCEPTOCODIGO       ,CONCEPTODESCRIPCION        ,CONCEPTOEXPLICACION       ,IDCONCEPTORUBRO       ,IDCOMPROBANTETIPO       ,CONCEPTOPRIORIDAD       ,CONCEPTOESTADO       "
                     DataSourceID="odsCONCEPTO"
                     EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                     AllowSorting="True">
                     <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Seleccione">
                        </asp:CommandField>
                        <asp:BoundField DataField="IDCONCEPTO" HeaderText="JD" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDCONCEPTO" />
                        <asp:BoundField DataField="IDEMPRESA" HeaderText="EMPRESA" InsertVisible="False" ReadOnly="True"
                           visible="False" SortExpression="IDEMPRESA" />
                        <asp:BoundField DataField="CONCEPTOCODIGO" HeaderText="CODIGO CONCEPTO"
                           SortExpression="CONCEPTOCODIGO" />
                        <asp:BoundField DataField="CONCEPTODESCRIPCION" HeaderText="DESCRIPCION CONCEPTO"
                           SortExpression="CONCEPTODESCRIPCION" />
                        <asp:BoundField DataField="CONCEPTOEXPLICACION" HeaderText="EXPLICACION CONCEPTO"
                           SortExpression="CONCEPTOEXPLICACION" />
                        <asp:BoundField DataField="IDCONCEPTORUBRO" HeaderText="RUBRO CONCEPTO" InsertVisible="False"
                           ReadOnly="True" visible="False" SortExpression="IDCONCEPTORUBRO" />
                        <asp:BoundField DataField="IDCOMPROBANTETIPO" HeaderText="TIPO COMPROBANTE"
                           InsertVisible="False" ReadOnly="True" visible="False" SortExpression="IDCOMPROBANTETIPO" />
                        <asp:BoundField DataField="CONCEPTOPRIORIDAD" HeaderText="PRIORIDAD EN TESORERIA"
                           SortExpression="CONCEPTOPRIORIDAD">
                           <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ESTADO" SortExpression="CONCEPTOESTADO">
                           <ItemTemplate>
                              <asp:CheckBox ID="CONCEPTOESTADOBox" runat="server"
                                 Checked='<% # Bind("CONCEPTOESTADO") %>' Enabled="false" />
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
                  <asp:Label ID="olblIDCONCEPTO" runat="server" Text="" Visible="false"></asp:Label>
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
                  <asp:Label ID="olblCONCEPTOCODIGO" runat="server" Text="CODIGO CONCEPTO:" CssClass="control-label">
                  </asp:Label>
                  <asp:TextBox ID="otxtCONCEPTOCODIGO" runat="server" CssClass="form-control" MaxLength="25">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCONCEPTODESCRIPCION" runat="server" Text="DESCRIPCION CONCEPTO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCONCEPTODESCRIPCION" runat="server" CssClass="form-control" MaxLength="200">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCONCEPTOEXPLICACION" runat="server" Text="EXPLICACION CONCEPTO:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCONCEPTOEXPLICACION" runat="server" CssClass="form-control" TextMode="MultiLine"
                     height="500px"></asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDCONCEPTORUBRO" runat="server" Text="RUBRO CONCEPTO:" CssClass="control-label">
                  </asp:Label>
                  <asp:SqlDataSource ID="odsCONCEPTORUBRO" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="CONCEPTORUBROTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlCONCEPTORUBRO" runat="server" DataSourceID="odsCONCEPTORUBRO"
                     DataTextField="CONCEPTORUBRODescripcion" DataValueField="IDCONCEPTORUBRO" CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblIDCOMPROBANTETIPO" runat="server" Text="TIPO COMPROBANTE:"
                     CssClass="control-label"></asp:Label>
                  <asp:SqlDataSource ID="odsCOMPROBANTETIPO" runat="server"
                     ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COMPROBANTETIPOTraerOddl"
                     SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                  <asp:DropDownList ID="oddlCOMPROBANTETIPO" runat="server" DataSourceID="odsCOMPROBANTETIPO"
                     DataTextField="COMPROBANTETIPODescripcion" DataValueField="IDCOMPROBANTETIPO"
                     CssClass="form-control">
                  </asp:DropDownList>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCONCEPTOPRIORIDAD" runat="server" Text="PRIORIDAD EN TESORERIA:"
                     CssClass="control-label"></asp:Label>
                  <asp:TextBox ID="otxtCONCEPTOPRIORIDAD" runat="server" CssClass="form-control" MaxLength="4">
                  </asp:TextBox>
               </div>
               <div class="form-group">
                  <asp:Label ID="olblCONCEPTOESTADO" runat="server" Text="ESTADO:" CssClass="control-label"></asp:Label>
                  <asp:CheckBox ID="otxtCONCEPTOESTADO" runat="server" />
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