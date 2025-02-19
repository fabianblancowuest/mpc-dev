<%@ Page Title="Operacion de tesoreria" MaintainScrollPositionOnPostback="true"  Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="EECCGlobalTesoreriaFecha.aspx.vb" Inherits="Administracion_EECCGlobalTesoreriaFecha" %>

<%@ Register Src="~/sitioWEB/tesoreriaPago.ascx" TagPrefix="uc1" TagName="tesoreriaPago" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Operacion de tesoreria"></asp:Label>
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Estado global de Cuentas por persona"></asp:Label>
        <asp:Label ID="olblFechaToday" runat="server" Text=""></asp:Label>
    </div>
    <asp:Panel ID="PanelGlobal" runat="server">
        <div>
            <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="CalendarioTesoreriaOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:Label ID="Label12" runat="server" Text="Fecha de corte:"></asp:Label>
            <asp:DropDownList ID="oddlEntrevistaFecha" runat="server" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="fecha"></asp:DropDownList>
        </div>
        <div>
            <asp:RadioButtonList ID="orbTipoOperacion" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="1">Cobrar</asp:ListItem>
               <%-- <asp:ListItem Value="2">Pagar</asp:ListItem>
                <asp:ListItem Value="3">Consolidado</asp:ListItem>--%>
            </asp:RadioButtonList>
        </div>



        <div>
            <asp:SqlDataSource ID="odsEECCGlobalTesoreriaFecha" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EECCGlobalTesoreriaFechaPagar" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlEntrevistaFecha" DefaultValue="" Name="fechaReferencia" PropertyName="SelectedValue" Type="DateTime" />
                    <asp:ControlParameter ControlID="orbTipoOperacion" DefaultValue="1" Name="tipoOperacion" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="ogvEECCGlobalTesoreriaFecha" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsEECCGlobalTesoreriaFecha" EmptyDataText="No existen cuentas por  pagar ni cobrar" AllowSorting="True" DataKeyNames="idPersona,personaDescripcion,registros,SaldoGlobal,tipo,Debitos,Creditos,PorCobrar,PorPagar,cuotasEnTermino,cuotasVencidas,cuotasAdelantables,montoCuotasEnTermino,montoCuotasVencidas,montoCuotasAdelantables">
                <Columns>
                    <asp:CommandField SelectText="Seleccione" ShowSelectButton="True" />
                    <asp:BoundField DataField="idPersona" HeaderText="idPersona" SortExpression="idPersona" Visible="true" />
                    <asp:BoundField DataField="personaDescripcion" HeaderText="Persona" SortExpression="personaDescripcion" />
                    <asp:BoundField DataField="registros" HeaderText="Registros" ReadOnly="True" SortExpression="registros" Visible="true" />
                    <asp:BoundField DataField="tipo" HeaderText="Tipo" ReadOnly="True" SortExpression="tipo" />
                    <asp:BoundField DataField="Debitos" DataFormatString="{0:c}" HeaderText="Por Cobrar" ReadOnly="True" SortExpression="Debitos">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Creditos" DataFormatString="{0:c}" HeaderText="Por Pagar" ReadOnly="True" SortExpression="Creditos">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SaldoGlobal" DataFormatString="{0:c}" HeaderText="Saldo Global" ReadOnly="True" SortExpression="SaldoGlobal">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
    </asp:Panel>


    <asp:Panel ID="PanelPersona" runat="server" Visible="false">
        Session de Operador Empresa        
  
        <div>
            <asp:Label ID="Label3" runat="server" Text="id:"></asp:Label>
            <asp:Label ID="olblIdPersona" runat="server" Text="" Font-Bold="true"> </asp:Label>
        </div>
         <div align="center">
            <asp:Button ID="obutPersonaVolver" runat="server" Text="Volver" />
        </div>

        <div>
            <asp:Label ID="Label4" runat="server" Text="Persona:"></asp:Label>
            <asp:Label ID="olblpersonaDescripcion" runat="server" Text="" Font-Bold="true"> </asp:Label>
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Saldo Global:"></asp:Label>
            <asp:Label ID="olblSaldoGlobal" runat="server" Text="" Font-Bold="true"> </asp:Label>

        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="Vencido:"></asp:Label>
            <asp:Label ID="olblcuotasVencidas" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label7" runat="server" Text=" cuotas por "></asp:Label>
            <asp:Label ID="olblmontoCuotasVencidas" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label9" runat="server" Text=" pesos"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label8" runat="server" Text="En Termino:"></asp:Label>
            <asp:Label ID="olblcuotasEnTermino" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label11" runat="server" Text=" cuotas por "></asp:Label>
            <asp:Label ID="olblmontoCuotasEnTermino" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label14" runat="server" Text=" pesos"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label10" runat="server" Text="Adelantables:"></asp:Label>
            <asp:Label ID="olblcuotasAdelantables" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label13" runat="server" Text=" cuotas por "></asp:Label>
            <asp:Label ID="olblmontoCuotasAdelantables" runat="server" Text="" Font-Bold="true"> </asp:Label>
            <asp:Label ID="Label15" runat="server" Text=" pesos"></asp:Label>
        </div>
        <div>
            <asp:Label ID="olblMarcarleyenda" runat="server" Text="Marcar todo "></asp:Label><asp:CheckBox ID="ochMarcar" runat="server" AutoPostBack="true"  />
        </div>
        <div>
            <asp:SqlDataSource ID="odsEECCPersonaFecha" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="EECCPersonaFechaPagar" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idEmpresaOperador" Type="Int32" />
                    <asp:ControlParameter ControlID="olblIdPersona" Name="idPersona" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlEntrevistaFecha" Name="fechaReferencia" PropertyName="SelectedValue" Type="DateTime" />
                    <asp:Parameter DefaultValue="1" Name="tipoOperacion" Type="Int32" />
                    <asp:ControlParameter ControlID="ochMarcar" Name="selecciona" PropertyName="Checked" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvEECCPersonaFecha" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsEECCPersonaFecha" Font-Size="Small">
                <Columns>
                    <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="olblId" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="idPersona" HeaderText="idPersona" SortExpression="idPersona" Visible="False" />
                    <asp:BoundField DataField="personaCodigo" HeaderText="personaCodigo" SortExpression="personaCodigo" Visible="False" />
                    <asp:BoundField DataField="personaDescripcion" HeaderText="personaDescripcion" SortExpression="personaDescripcion" Visible="False" />
                    <asp:BoundField DataField="idConcepto" HeaderText="idConcepto" SortExpression="idConcepto" Visible="False" />
                    <asp:BoundField DataField="conceptoDescripcion" HeaderText="Concepto " SortExpression="conceptoDescripcion" Visible="False" />
                    <asp:BoundField DataField="idContablePlancuenta" HeaderText="idContablePlancuenta" SortExpression="idContablePlancuenta" Visible="False" />
                    <asp:BoundField DataField="planCuentaCodigo" HeaderText="planCuentaCodigo" SortExpression="planCuentaCodigo" Visible="False" />
                    <asp:BoundField DataField="planCuentaDescripcion" HeaderText="planCuentaDescripcion" SortExpression="planCuentaDescripcion" Visible="True" />
                    <asp:TemplateField HeaderText="Comprobante" SortExpression="asientoMovimientoReferenciaIdComprobanteGenerado">
                         
                        <ItemTemplate>
                            <asp:Label ID="olblAsientoMovimientoReferenciaIdComprobanteGenerado" runat="server" Text='<%# Bind("asientoMovimientoReferenciaIdComprobanteGenerado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="registros" HeaderText="registros" SortExpression="registros">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Debitos" HeaderText="Debitos" ReadOnly="True" SortExpression="Debitos">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Creditos" HeaderText="Creditos" ReadOnly="True" SortExpression="Creditos">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Saldo Comprobante" SortExpression="SaldoComprobante">
                         
                        <ItemTemplate>
                            <asp:Label ID="olblSaldoComprobante" runat="server" Text='<%# Bind("SaldoComprobante") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="fechaComprobanteDesde" DataFormatString="{0:d}" HeaderText="Fecha Comprobante" SortExpression="fechaComprobanteDesde">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cuotaVencidas" HeaderText="cuotaVencidas" SortExpression="cuotaVencidas" Visible="False" />
                    <asp:BoundField DataField="cuotaEnTermino" HeaderText="cuotaEnTermino" SortExpression="cuotaEnTermino" Visible="False" />
                    <asp:BoundField DataField="cuotaAdelantables" HeaderText="cuotaAdelantables" SortExpression="cuotaAdelantables" Visible="False" />
                    <asp:TemplateField HeaderText="seleccionado" SortExpression="seleccionado">
                        <ItemTemplate>
                            <asp:CheckBox ID="ochSeleccionado" runat="server" Checked='<%# Bind("seleccionado") %>' AutoPostBack ="true"  OnCheckedChanged ="sumaComprobantes" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Label ID="olblComprobanteSeleccionadoCantidad" runat="server" Text="0"></asp:Label>
            <asp:Label ID="Label16" runat="server" Text="  Comprobantes Seleccionados por "></asp:Label>


            <asp:Label ID="olblComprobanteSeleccionadoMonto" runat="server" Text="0"></asp:Label>
            <asp:Label ID="Label17" runat="server" Text=" pesos  "></asp:Label>

        </div>
<div>
    <asp:Label ID="olblMensajeSeleccion" runat="server" Text=""></asp:Label>
</div>


        <div>
    <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" ForeColor ="Red" Font-Bold ="true"></asp:Label>
</div>
      

        <div>
            <uc1:tesoreriaPago runat="server" ID="tesoreriaPago" />
        </div>
       
          <div align="center" >
            <asp:Button ID="obutPagoAlta" runat="server" Text="Realizar el pago." Visible ="false" Font-Bold="true" Width="40%"  Height="100px" BackColor="Green" ForeColor="White" />
             
        </div>
    </asp:Panel>

</asp:Content>

