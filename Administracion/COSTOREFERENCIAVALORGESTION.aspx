<%@ Page Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
  CodeFile="COSTOREFERENCIAVALORGESTION.aspx.vb" Inherits="STRSYSTEM_Administracion_COSTOREFERENCIAVALORGESTION"
  title="Tratamiento Tabla " Culture="es-AR" %>
  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true"></asp:ScriptManager>


      <asp:Panel ID="PanelTitulo" runat="server">
        <div class="row">
          <h1>
            <!-- <asp:Label ID="olblCOSTOREFERENCIAVALORTitulo" runat="server" Text=""></asp:Label> -->
            COSTO-REFERENCIA VALOR GESTIÓN
          </h1>
        </div>
      </asp:Panel>

      <asp:Panel ID="Panel1" runat="server" CssClass="costo-referencia-valor-gestion">

        <div class="row">

          <div class="contenedor-busqueda">
            <asp:Label ID="Label1" runat="server" Text="SELECCIONE COSTOREFERENCIA:" CssClass="span mx-2">
            </asp:Label>
            <asp:SqlDataSource ID="odsCOSTOREFERENCIAOperador" runat="server"
              ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COSTOREFERENCIAOPERADORSELECCIONA"
              SelectCommandType="StoredProcedure">
              <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlCOSTOREFERENCIAOperador" runat="server" DataSourceID="odsCOSTOREFERENCIAOPERADOR"
              DataTextField="COSTOREFERENCIADescripcion" DataValueField="idCOSTOREFERENCIA" CssClass="input"
              AutoPostBack="True">
            </asp:DropDownList>

            <asp:Label ID="Label2" runat="server" Text="SELECCIONE EJERCICIO:" CssClass="span mx-2"></asp:Label>
            <asp:SqlDataSource ID="odsEJERCICIOOperador" runat="server"
              ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EJERCICIOOPERADORSELECCIONA"
              SelectCommandType="StoredProcedure">
              <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
              </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlEJERCICIOOperador" runat="server" DataSourceID="odsEJERCICIOOPERADOR"
              DataTextField="EJERCICIODescripcion" DataValueField="idEJERCICIO" CssClass="input" AutoPostBack="True">
            </asp:DropDownList>
          </div>
          <div>

            <asp:SqlDataSource ID="odsCOSTOREFERENCIAVALOR" runat="server"
              ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COSTOREFERENCIAVALORTRAERID"
              SelectCommandType="StoredProcedure">
              <SelectParameters>
                <asp:ControlParameter ControlID="oddlCOSTOREFERENCIAOperador" Name="idCOSTOREFERENCIA"
                  PropertyName="SelectedValue" Type="Int16" />
                <asp:ControlParameter ControlID="oddlEJERCICIOOperador" Name="idEjercicio" PropertyName="SelectedValue"
                  Type="Int32" />
              </SelectParameters>
            </asp:SqlDataSource>
            <div class="table-responsive">
              <asp:GridView ID="ogvCOSTOREFERENCIAVALOR" runat="server" AutoGenerateColumns="False"
                CssClass="table-cemmi fuente-chica" AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="50"
                PagerStyle-CssClass="pgr"
                DataKeyNames="IDCOSTOREFERENCIAVALOR,IDCOSTOREFERENCIA,COSTOREFERENCIAVALORCODIGO,COSTOREFERENCIAVALORDESCRIPCION,IDEJERCICIODETALLE,COSTOREFERENCIAVALORIMPORTE"
                DataSourceID="odsCOSTOREFERENCIAVALOR"
                EmptyDataText="No existen entradas en la tabla con el argumento de busqueda ingresado"
                AllowSorting="True">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                  <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                  <asp:BoundField DataField="IDCOSTOREFERENCIAVALOR" HeaderText="ID" InsertVisible="False"
                    ReadOnly="True" SortExpression="IDCOSTOREFERENCIAVALOR" visible="False" />
                  <asp:BoundField DataField="IDCOSTOREFERENCIA" HeaderText="REFERENCIA" InsertVisible="False"
                    ReadOnly="True" SortExpression="IDCOSTOREFERENCIA" visible="False" />
                  <asp:BoundField DataField="COSTOREFERENCIAVALORCODIGO" HeaderText="CODIGO REFERENCIA"
                    SortExpression="COSTOREFERENCIAVALORCODIGO" />
                  <asp:BoundField DataField="ejercicioDetalleFechaDesde" DataFormatString="{0:d}"
                    HeaderText="DESDE FECHA" SortExpression="ejercicioDetalleFechaDesde" />
                  <asp:BoundField DataField="ejercicioDetalleFechaHasta" DataFormatString="{0:d}"
                    HeaderText="HASTA FECHA" SortExpression="ejercicioDetalleFechaHasta" />
                  <asp:BoundField DataField="COSTOREFERENCIAVALORDESCRIPCION" HeaderText="DESCRIPCION"
                    SortExpression="COSTOREFERENCIAVALORDESCRIPCION" />
                  <asp:BoundField DataField="IDEJERCICIODETALLE" HeaderText="PERIODO / EJERCICIO" InsertVisible="False"
                    ReadOnly="True" SortExpression="IDEJERCICIODETALLE" visible="False" />
                  <asp:BoundField DataField="COSTOREFERENCIAVALORIMPORTE" HeaderText="IMPORTE EN PERIODO"
                    SortExpression="COSTOREFERENCIAVALORIMPORTE">
                    <ItemStyle HorizontalAlign="Right" />
                  </asp:BoundField>
                </Columns>
                <PagerStyle CssClass="pgr" />
              </asp:GridView>

            </div>
          </div>


          <div class="row my-2">
            <asp:Button ID="obutAlta" runat="server" Text="Nuevo Registro" CssClass="btn-basic btn btn-success" />
          </div>

      </asp:Panel>


      <asp:Panel ID="PanelAlta" runat="server" Visible="false">
        <form class="form" role="form">

          <div class="form-group">
            <asp:Label ID="olblIDCOSTOREFERENCIAVALOR" runat="server" Text="" Visible="false"></asp:Label>
          </div>
          <div class="form-group">
            <asp:Label ID="olblIDCOSTOREFERENCIA" runat="server" Text="REFERENCIA:" CssClass="control-label">
            </asp:Label>
            <asp:SqlDataSource ID="odsCOSTOREFERENCIA" runat="server"
              ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="COSTOREFERENCIATraerOddl"
              SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlCOSTOREFERENCIA" runat="server" DataSourceID="odsCOSTOREFERENCIA"
              DataTextField="COSTOREFERENCIADescripcion" DataValueField="IDCOSTOREFERENCIA" CssClass="form-control">
            </asp:DropDownList>
          </div>
          <div class="form-group">
            <asp:Label ID="olblCOSTOREFERENCIAVALORCODIGO" runat="server" Text="CODIGO REFERENCIA:"
              CssClass="control-label"></asp:Label>
            <asp:TextBox ID="otxtCOSTOREFERENCIAVALORCODIGO" runat="server" CssClass="form-control" MaxLength="100">
            </asp:TextBox>
          </div>
          <div class="form-group">
            <asp:Label ID="olblCOSTOREFERENCIAVALORDESCRIPCION" runat="server" Text="DESCRIPCION:"
              CssClass="control-label"></asp:Label>
            <asp:TextBox ID="otxtCOSTOREFERENCIAVALORDESCRIPCION" runat="server" CssClass="form-control"
              MaxLength="100"></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:Label ID="olblIDEJERCICIODETALLE" runat="server" Text="PERIODO / EJERCICIO:" CssClass="control-label">
            </asp:Label>
            <asp:SqlDataSource ID="odsEJERCICIODETALLE" runat="server"
              ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EJERCICIODETALLETraerOddl"
              SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:DropDownList ID="oddlEJERCICIODETALLE" runat="server" DataSourceID="odsEJERCICIODETALLE"
              DataTextField="EJERCICIODETALLEDescripcion" DataValueField="IDEJERCICIODETALLE" CssClass="form-control">
            </asp:DropDownList>
          </div>
          <div class="form-group">
            <asp:Label ID="olblCOSTOREFERENCIAVALORIMPORTE" runat="server" Text="IMPORTE EN PERIODO:"
              CssClass="control-label"></asp:Label>
            <asp:TextBox ID="otxtCOSTOREFERENCIAVALORIMPORTE" runat="server" CssClass="form-control" MaxLength="20">
            </asp:TextBox>
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