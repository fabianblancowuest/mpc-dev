<%@ Page Title="Control de Cobranzas / Todos los barrios / Sistema CAJA" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="controlCobranzas.aspx.vb" Inherits="Administracion_controlCobranzas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Control de cobranzas en sistema de Caja " Font-Bold="true" Font-Size="Large"></asp:Label>
    </div>

                <div class="row contenedor-flexible margenes-y">

                    <div class="caja-busqueda">
                        <asp:Label ID="Label2" runat="server" Text="SELECCIONE BARRIO:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsBARRIOOperador" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="BARRIOOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="barrio-mz">BARRIO</div>
                        <asp:DropDownList ID="oddlBARRIOOperador" runat="server" DataSourceID="odsBARRIOOPERADOR"
                            DataTextField="barrioPlano" DataValueField="idBarrio" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="SELECCIONE MANZANA:" CssClass="control-label">
                        </asp:Label>
                        <asp:SqlDataSource ID="odsBARRIOMANZANAOPERADOR" runat="server"
                            ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                            SelectCommand="BARRIOMANZANAOPERADORSELECCIONA" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="String" />
                                <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio"
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="barrio-mz">MANZANA</div>
                        <asp:DropDownList ID="oddlBarrioManzanaOperador" runat="server"
                            DataSourceID="odsBARRIOMANZANAOPERADOR" DataTextField="barrioManzanaCodigo"
                            DataValueField="idBarrioManzana" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </div>

    
    <asp:Label ID="olblBarrio" runat="server" Text="" Visible ="false"></asp:Label>
    <asp:Label ID="olblManzana" runat="server" Text="" Visible ="false"></asp:Label>
    <asp:SqlDataSource ID="odsReporte" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="reporteGeneralCobranzaMinuta" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="olblBarrio" DefaultValue="" Name="barrio" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="olblManzana" DefaultValue="" Name="manzana" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="OGVodsReporte" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsReporte" Font-Size="XX-Small" AllowSorting="True">
        <Columns>
            <asp:CommandField SelectText="ACCION" ShowSelectButton="True" />
            <asp:BoundField DataField="id_control" HeaderText="id_control" SortExpression="id_control" />
            <asp:BoundField DataField="barrio" HeaderText="barrio" SortExpression="barrio" />
            <asp:BoundField DataField="manzana" HeaderText="manzana" SortExpression="manzana" />
            <asp:BoundField DataField="parcela" HeaderText="parcela" SortExpression="parcela" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
            <asp:BoundField DataField="idBarrioLote" HeaderText="idBarrioLote" SortExpression="idBarrioLote" />
            <asp:BoundField DataField="100% adhesion" HeaderText="100% adhesion" SortExpression="100% adhesion" />
            <asp:BoundField DataField="50% adhesion" HeaderText="50% adhesion" SortExpression="50% adhesion" />
            <asp:BoundField DataField="fecha_inicio_pagos" HeaderText="fecha inicio pagos" SortExpression="fecha_inicio_pagos" DataFormatString="{0:d}" />
            <asp:BoundField DataField="fecha_final_pagos" HeaderText="fecha final pagos" SortExpression="fecha_final_pagos" DataFormatString="{0:d}" />
            <asp:BoundField DataField="dias_transcurridos_ultimo_pago" HeaderText="Dias transcurridos ultimo pago" SortExpression="dias_transcurridos_ultimo_pago" />
            <asp:BoundField DataField="Total cobrado por cuotas"   HeaderText="Total cobrado por cuotas" SortExpression="Total cobrado por cuotas" />
            <asp:BoundField DataField="Total Dev. 40%"   HeaderText="Total Dev. 40%" SortExpression="Total Dev. 40%" />
            <asp:BoundField DataField="Total Dev. Proveedor 70%"   HeaderText="Total Dev. Proveedor 70%" SortExpression="Total Dev. Proveedor 70%" />
            <asp:BoundField DataField="Total Dev. Agente 30%"   HeaderText="Total Dev. Agente 30%" SortExpression="Total Dev. Agente 30%" />
            <asp:BoundField DataField="Monto_ultima_cuota_pagada"   HeaderText="Monto ultima cuota pagada" SortExpression="Monto_ultima_cuota_pagada" />
            <asp:BoundField DataField="meses_transcurridos" HeaderText="meses transcurridos" SortExpression="meses_transcurridos" />
            <asp:BoundField DataField="recibos" HeaderText="recibos" SortExpression="recibos" />
            <asp:BoundField DataField="Diferencia Meses transcurridos vs Cuotas Pagadas" HeaderText="Diferencia Meses transcurridos vs Cuotas Pagadas" SortExpression="Diferencia Meses transcurridos vs Cuotas Pagadas" />
            <asp:BoundField DataField="Domicilio" HeaderText="Domicilio" SortExpression="Domicilio" />
            <asp:BoundField DataField="Telefono1" HeaderText="Telefono1" SortExpression="Telefono1" />
            <asp:BoundField DataField="Telefono2" HeaderText="Telefono2" SortExpression="Telefono2" />
            <asp:BoundField DataField="Trabajo" HeaderText="Trabajo" SortExpression="Trabajo" />
            <asp:BoundField DataField="Liberado" HeaderText="Liberado" SortExpression="Liberado" />
        </Columns>
    </asp:GridView>
</asp:Content>

