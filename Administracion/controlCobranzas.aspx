<%@ Page Title="Control de Cobranzas / Todos los barrios / Sistema CAJA" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="controlCobranzas.aspx.vb" Inherits="Administracion_controlCobranzas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Control de cobranzas en sistema de Caja " Font-Bold="true" Font-Size="Large"></asp:Label>
    </div>
<asp:Panel ID="PanelBusqueda" runat="server">

    <div class="row contenedor-flexible margenes-y">
        <asp:Label ID="olblMensaje" runat="server" Text="" ForeColor ="Red" ></asp:Label>
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

    
        <asp:Label ID="olblBarrio" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="olblManzana" runat="server" Text="" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="odsReporte" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="reporteGeneralCobranzaMinuta" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBARRIOOperador" Name="idBarrio" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="oddlBarrioManzanaOperador" Name="idBarrioManzana" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="OGVodsReporte" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsReporte" Font-Size="XX-Small" AllowSorting="True" DataKeyNames="idLoteVenta,manzana,parcela,barrio,recibosAdhesion,dniAnverso,dniReverso,consentimiento,comentario">
            <Columns>
                <asp:CommandField SelectText="ACCION" ShowSelectButton="True" />
                <asp:BoundField DataField="idLoteVenta" HeaderText="idLoteVenta" SortExpression="idLoteVenta" />
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
                <asp:BoundField DataField="Total cobrado por cuotas" HeaderText="Total cobrado por cuotas" SortExpression="Total cobrado por cuotas" />
                <asp:BoundField DataField="Total Dev. 40%" HeaderText="Total Dev. 40%" SortExpression="Total Dev. 40%" />
                <asp:BoundField DataField="Total Dev. Proveedor 70%" HeaderText="Total Dev. Proveedor 70%" SortExpression="Total Dev. Proveedor 70%" />
                <asp:BoundField DataField="Total Dev. Agente 30%" HeaderText="Total Dev. Agente 30%" SortExpression="Total Dev. Agente 30%" />
                <asp:BoundField DataField="Monto_ultima_cuota_pagada" HeaderText="Monto ultima cuota pagada" SortExpression="Monto_ultima_cuota_pagada" />
                <asp:BoundField DataField="meses_transcurridos" HeaderText="meses transcurridos" SortExpression="meses_transcurridos" />
                <asp:BoundField DataField="recibos" HeaderText="recibos" SortExpression="recibos" />
                <asp:BoundField DataField="Diferencia Meses transcurridos vs Cuotas Pagadas" HeaderText="Diferencia Meses transcurridos vs Cuotas Pagadas" SortExpression="Diferencia Meses transcurridos vs Cuotas Pagadas" />
                <asp:BoundField DataField="Domicilio" HeaderText="Domicilio" SortExpression="Domicilio" />
                <asp:BoundField DataField="Telefono1" HeaderText="Telefono1" SortExpression="Telefono1" />
                <asp:BoundField DataField="Telefono2" HeaderText="Telefono2" SortExpression="Telefono2" />
                <asp:BoundField DataField="Trabajo" HeaderText="Trabajo" SortExpression="Trabajo" />
                <asp:TemplateField HeaderText="Recibos Adhesion" SortExpression="recibosAdhesion">

                    <ItemTemplate>
                        <asp:CheckBox ID="ochRecibosAdhesion" runat="server" Checked='<%# Bind("recibosAdhesion")%>' Enabled ="false"  />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Anverso DNI" SortExpression="dniAnverso">

                    <ItemTemplate>
                        <asp:CheckBox ID="ochAnverso" runat="server" Checked='<%# Bind("dniAnverso") %>' Enabled ="false"  />

                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Reverso DNI" SortExpression="dniReverso">

                    <ItemTemplate>
                        <asp:CheckBox ID="ochReverso" runat="server" Checked='<%# Bind("dniReverso") %>' Enabled ="false" ></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="consentimiento" SortExpression="consentimiento">
                    
                    <ItemTemplate>
                        <asp:CheckBox ID="ochConsentimiento" runat="server" Checked='<%# Bind("consentimiento") %>' Enabled ="false" />
                       
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:BoundField DataField="comentario" HeaderText="Comentario" SortExpression="comentario" />
                <asp:BoundField DataField="Liberado" HeaderText="Liberado" SortExpression="Liberado" />
            </Columns>
        </asp:GridView>


    </asp:Panel>
    <asp:Panel ID="PanelNovedad" runat="server" Visible="true">
        <div>
            <asp:Label ID="Label4" runat="server" Text="Completar documentacion segun corresponda"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label10" runat="server" Text="Barrio :"></asp:Label>
            <asp:Label ID="olblDocumentacionBarrio" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label11" runat="server" Text="Manzana :"></asp:Label>

            <asp:Label ID="olblDocumentacionManzana" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>


        <div>
            <asp:Label ID="Label12" runat="server" Text="Parcela :"></asp:Label>

            <asp:Label ID="olblDocumentacionParcela" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Recibos de Adhesion (Que sumen el 100%)"></asp:Label>
            <asp:CheckBox ID="ochDocumentacionReciboAdhesion" runat="server" />
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Foto anverso del DNI"></asp:Label>
            <asp:CheckBox ID="ochDocumentacionDNIAnverso" runat="server" />
        </div>
        <div>
            <asp:Label ID="Label7" runat="server" Text="Foto reverso del DNI"></asp:Label>
            <asp:CheckBox ID="ochDocumentacionDNIReverso" runat="server" />
        </div>

        <div>
            <asp:Label ID="Label8" runat="server" Text="Consentimiento conformado"></asp:Label>
            <asp:CheckBox ID="ochDocumentacionConsentimiento" runat="server" />
        </div>

        <div>
            <asp:Label ID="Label9" runat="server" Text="Comentario"></asp:Label>
            <asp:TextBox ID="otxtDocumentacionComentario" runat="server" Width="80%" Height="200px"></asp:TextBox>
            <asp:Label ID="Label13" runat="server" Text="( idLoteVenta:"></asp:Label>
            <asp:Label ID="olblIdLoteVenta" runat="server" Text="" Font-Bold ="true"></asp:Label>
            <asp:Label ID="Label14" runat="server" Text=")"></asp:Label>

        </div>
        <br />
        <br />
        <asp:Button ID="obutActualiza" runat="server" Text="Actualiza la documentacion" BackColor="Green" />

        <asp:Button ID="obutAbandona" runat="server" Text="Vuelve sin grabar" BackColor="#cccccc" />

    </asp:Panel>
</asp:Content>

