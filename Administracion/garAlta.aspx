<%@ Page Title="Solicitud de Gastos a Rendir" MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false"
    CodeFile="garAlta.aspx.vb" Inherits="Administracion_garAlta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="titulo-rol">
        <asp:Label ID="Label1" runat="server" Text="Solicitud de Gastos a Rendir"></asp:Label>
    </h2>

    <asp:Panel ID="PanelOperador" runat="server">

        <div>
            <asp:Label ID="Label12" runat="server" Text="Operador Seleccionado"></asp:Label>
            <asp:DropDownList ID="oddlgarOperadorSelecciona" runat="server" AutoPostBack="True"
                DataSourceID="odsgarOperadorSelecciona" DataTextField="operadorDescripcion"
                DataValueField="idOperador" Width="489px" Height="30px">
            </asp:DropDownList>

            <asp:SqlDataSource ID="odsgarOperadorSelecciona" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="garOperadorSelecciona"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="session_idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelAlta" runat="server" Visible="false">


        <div>
            <asp:Label ID="Label2" runat="server" Text="Indique el gasto a realizar y el monto requerido.">
            </asp:Label>
        </div>


        <div>
            <asp:Label ID="Label4" runat="server" Text="Motivo"></asp:Label>


        </div>
        <div>
            <asp:TextBox ID="otxtSolicitudDescripcion" runat="server" TextMode="MultiLine" Height="300px"
                Width="80%"></asp:TextBox>
        </div>
        <div>

            <asp:Label ID="Label5" runat="server" Text="Ingrese monto solicitado:"></asp:Label>
            <asp:TextBox ID="otxtSolicitudMonto" runat="server" Text="0"></asp:TextBox>
        </div>


        <div>
            <asp:Label ID="Label3" runat="server"
                Text="La solicitud será elevada a gerencia para su evaluación y autorizacion o rechazo.">
            </asp:Label>

        </div>
        <div>
            <br />
            <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="olblGestionDescripcion" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
        </div>

        <div>
            <asp:Button ID="obutSolicitudAlta" runat="server" Text="Enviar Solicitud" CssClass="btn btn-success" />
            <asp:Button ID="obutSolicitudAbandona" runat="server" Text="Abandonar Solicitud"
                CssClass="btn btn-danger" />

        </div>
    </asp:Panel>
    <asp:Panel ID="PanelSolicitud" runat="server">
        <div class="gar-alta">
            <asp:Label ID="Label6" runat="server" Text="Mis Solicitudes"></asp:Label>
            <div class="gar-alta-opciones">
                <asp:RadioButtonList ID="orbOpcion" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="1">Activos</asp:ListItem>
                    <asp:ListItem Value="2">Pendientes de aprobación y / o pago en caja</asp:ListItem>
                    <asp:ListItem Value="3">GAR Rendidos 100%</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:Button ID="obutGARAlta" runat="server" Text="Nueva solicitud de GAR"
                CssClass="btn-basic my-3 btn btn-success" />
            <div class="gar-alta-info">
                <asp:SqlDataSource ID="odsOperadorGar" runat="server"
                    ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="garOperador"
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="oddlgarOperadorSelecciona" Name="idOperador"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="orbOpcion" Name="idOpcion" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <asp:GridView ID="ogvOperadorGar" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataSourceID="odsOperadorGar" CssClass="table-cemmi"
                DataKeyNames="idgar,garSolicitudFecha,garSolicitudDescripcion,garSolicitudMonto,autoriza,garAutorizacionFecha,garAutorizacionMonto,MontoRendido,SaldoGar,idAsientoCabecera,garAsientoFecha,garEstado,garEstadoDescripcion"
                EmptyDataText="El usuario todavia no ha generado Gastos a Rendir" Font-Size="Small">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Detalle"></asp:CommandField>
                    <asp:BoundField DataField="idgar" HeaderText="id" InsertVisible="False"
                        SortExpression="idgar" />
                    <asp:BoundField DataField="garSolicitudFecha" HeaderText="Fecha Solicitud"
                        SortExpression="garSolicitudFecha" />
                    <asp:BoundField DataField="garSolicitudDescripcion" HeaderText="Descripcion"
                        SortExpression="garSolicitudDescripcion" />
                    <asp:BoundField DataField="garSolicitudMonto" HeaderText="Monto"
                        SortExpression="garSolicitudMonto" DataFormatString="{0:c}">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="autoriza" HeaderText="autoriza" SortExpression="autoriza" />
                    <asp:BoundField DataField="garAutorizacionFecha" HeaderText="Fecha Autorizacion"
                        SortExpression="garAutorizacionFecha" />
                    <asp:BoundField DataField="garAutorizacionMonto" HeaderText="Monto Autorizado"
                        SortExpression="garAutorizacionMonto" />
                    <asp:BoundField DataField="MontoRendido" HeaderText="Monto Rendido"
                        SortExpression="MontoRendido" />
                    <asp:BoundField DataField="Transferencias" HeaderText="Transferencias" SortExpression="Transferencias" />
                    <asp:BoundField DataField="DevolucionOperador" HeaderText="Devolucion a Operador" SortExpression="DevolucionOperador" />
                    <asp:BoundField DataField="DevolucionEfectivo" HeaderText="Devolucion Efectivo" SortExpression="DevolucionEfectivo" />
                    <asp:BoundField DataField="SaldoGar" HeaderText="Saldo GAR" SortExpression="SaldoGar" />
                    <asp:BoundField DataField="idAsientoCabecera" HeaderText="Asiento "
                        SortExpression="idAsientoCabecera" />
                    <asp:BoundField DataField="garAsientoFecha" HeaderText="Fecha Asiento"
                        SortExpression="garAsientoFecha" />
                    <asp:BoundField DataField="garEstado" HeaderText="Estado" SortExpression="garEstado"
                        Visible="False" />
                    <asp:BoundField DataField="garEstadoDescripcion" HeaderText="Descripcion Estado"
                        SortExpression="garEstadoDescripcion" />
                    <asp:BoundField DataField="operadorCaja" HeaderText="Operador Caja"
                        SortExpression="operadorCaja" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelGARNoAutorizado" runat="server" Visible="false">

        <div>
            <asp:Label ID="Label7" runat="server"
                Text="El GAR Seleccionado todavia no ha sido autorizado / emitido por caja"></asp:Label>
        </div>


    </asp:Panel>
    <asp:Panel ID="PanelGARAutorizado" runat="server" Visible="false">

        <div>
            <asp:Label ID="label8" runat="server" Text="Operador Solicitante:"></asp:Label>
            <asp:Label ID="olblGAROperadorSolicita" runat="server" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="label10" runat="server" Text="Identificacion GAR:"></asp:Label>
            <asp:Label ID="olblGARSeleccionadoIDGAR" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label9" runat="server" Text="Descripcion:"></asp:Label>
            <asp:Label ID="olblGARSeleccionadoDescripcion" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label11" runat="server" Text="Monto Autorizado:"></asp:Label>
            <asp:Label ID="olblGARSeleccionadoMontoAutorizado" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label13" runat="server" Text="Gastos acumulados:"></asp:Label>
            <asp:Label ID="olblGARSeleccionadoMontoGastado" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label14" runat="server" Text="Saldo actual:"></asp:Label>
            <asp:Label ID="olblGARSeleccionadoSaldo" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

    </asp:Panel>

    <asp:Panel ID="PanelGastosRegistrados" runat="server" Visible="false">

        <asp:SqlDataSource ID="odsGARGastosRegistrados" runat="server"
            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="GARGastosRegistrados"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="olblGARSeleccionadoIDGAR" Name="idGar" PropertyName="Text"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvGARGastosRegistrados" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi"
            DataKeyNames="idGarRendicion,fechaRegistro,tipoComprobante,garRendicionComprobante,garRendicionMontoGAI,garRendicionMontoTransferenciaEmpresa,garRendicionMontoOperadorACuenta,garRendicionMontoDevolucionEfectivo,garRendicionComprobante1,garRendicionDescripcion,rendido,asentado"
            DataSourceID="odsGARGastosRegistrados"
            EmptyDataText="Todavia no se han registrado gastos en el GAR seleccionado." Font-Size="X-Small">
            <Columns>
                <asp:BoundField DataField="idGarRendicion" HeaderText="idGarRendicion" InsertVisible="False"
                    SortExpression="idGarRendicion" Visible="False" />
                <asp:BoundField DataField="fechaRegistro" HeaderText="Fecha Registro"
                    SortExpression="fechaRegistro" />
                <asp:BoundField DataField="tipoComprobante" HeaderText="Cbte. Tipo"
                    SortExpression="tipoComprobante" />
                <asp:BoundField DataField="garRendicionComprobante" HeaderText="Cbte. Numero "
                    SortExpression="garRendicionComprobante" />
                <asp:BoundField DataField="garRendicionDescripcion" HeaderText="Descripcion Gasto"
                    SortExpression="garRendicionDescripcion" />
                <asp:BoundField DataField="garRendicionMontoGAI" HeaderText="Efectivo a rendir"
                    SortExpression="garRendicionMontoGAI" />
                <asp:BoundField DataField="garRendicionMontoTransferenciaEmpresa" HeaderText="Transferencia Empresa"
                    SortExpression="garRendicionMontoTransferenciaEmpresa" />
                <asp:BoundField DataField="garRendicionMontoOperadorACuenta" HeaderText="Aporte Operador"
                    SortExpression="garRendicionMontoOperadorACuenta" />
                <asp:BoundField DataField="garRendicionMontoDevolucionEfectivo" HeaderText="Devolucion Efectivo"
                    SortExpression="garRendicionMontoDevolucionEfectivo" />
                <asp:BoundField DataField="TotalGasto" HeaderText="Total Rendido" SortExpression="TotalGasto"
                    DataFormatString="{0:c}">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="rendido" HeaderText="Rendido" ReadOnly="True" SortExpression="rendido" />
                <asp:BoundField DataField="asentado" HeaderText="Asentado" ReadOnly="True"
                    SortExpression="asentado" />
            </Columns>
        </asp:GridView>
        <div>
            <asp:Button ID="obutGarGastoAlta" runat="server" Text="Alta de Gasto" />
        </div>

        <div>
            <asp:Button ID="obutGarGastoVolver" runat="server" Text="Volver" CssClass="btn-danger" />
        </div>

    </asp:Panel>
    <asp:Panel ID="PanelGastoRegistro" runat="server" Visible="false">


        <div>
            <asp:Label ID="Label15" runat="server" Text="Registración del Gasto"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label24" runat="server" Text="Tipo de Comprobante"></asp:Label>
            <asp:SqlDataSource ID="odsgarComprobanteTipo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from garComprobanteTipo order by garComprobanteTipoCodigo "></asp:SqlDataSource>
            <asp:DropDownList ID="oddlgarComprobanteTipo" runat="server" DataSourceID="odsgarComprobanteTipo" DataTextField="garComprobanteTipoDescripcion" DataValueField="idGarComprobanteTipo"></asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="Label16" runat="server" Text="Comprobante:"></asp:Label>
            <asp:TextBox ID="otxtGARRegistroComprobante" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label17" runat="server" Text="Concepto :"></asp:Label>
            <br />
            <asp:TextBox ID="otxtGARRegistroConcepto" runat="server" TextMode ="MultiLine"  Width ="80%"  ></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label22" runat="server" Text="TOTAL DEL GASTO:"></asp:Label>
            <asp:TextBox ID="otxtGARMontoTotal" runat="server" Text="0"></asp:TextBox>
        </div>
        <div>
            <br />
            <asp:Label ID="Label23" runat="server" Text="Ingrese la forma de pago del Gasto." Font-Bold ="true"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label18" runat="server" Text="Monto pagado con Efectivo Empresa: (A Rendir )"></asp:Label>
            <asp:TextBox ID="otxtGARMontoGAI" runat="server" Text="0" cssclass="imput"></asp:TextBox>
        </div>



        <div>
            <asp:Label ID="Label19" runat="server" Text="Monto pagado con Transferencia Empresa:"></asp:Label>
            <asp:TextBox ID="otxtGARMontoTransferencia" runat="server" Text="0"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label20" runat="server" Text="Monto pagado con dinero del operador:"></asp:Label>
            <asp:TextBox ID="otxtGARMontoOperador" runat="server" Text="0"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label21" runat="server" Text="TOTAL DEL GASTO:"></asp:Label>
            <asp:Label ID="olblGARTotal" runat="server" Text="0" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblValidacionMensaje" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <br />
            <br />
            <asp:Button ID="obutRegistroValidar" runat="server" Text="Validar Gasto" />
            <asp:Button ID="obutRegistroAlta" runat="server" Text="Confirmar Comprobante" Visible="false" />
            <asp:Button ID="obutRegistroReingresar" runat="server" Text="Reingresar datos" Visible="false" />

            <asp:Button ID="obutRegistroVolver" runat="server" Text="Volver" />
        </div>

    </asp:Panel>

    <script>
        document.addEventListener("DOMContentLoaded", () => {

            const filas = document.querySelectorAll("table tr");
        const columnas = filas[0].querySelectorAll("td")

        for (let i = 0; i < filas.length; i++) {
            if (columnas.length > 1) {
                filas[0].classList.add("resaltar");
            }
        }

        filas.forEach((row) => {
            const columns = row.querySelectorAll("td");
        if (columns.length < 2) {
            row.classList.add("resaltar"); // Agregar clase si tiene más de una columna
        }
        });

        const rows = document.querySelectorAll("table tr");
        })

    </script>
</asp:Content>
