<%@ Page Title="ASIGNACION DE DATOS DE CAMPAÑAS A VENDEDOR POR PARTE DE SUPERVISOR" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="DATOSORTEOSUPERVISORASIGNAVENDEDOR.aspx.vb" Inherits="Administracion_DATOSORTEOSUPERVISORASIGNAVENDEDOR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>

        <h4>       <asp:Label ID="Label1" runat="server" Text="ASIGNACION DE DATOS DE CAMPAÑAS A VENDEDOR POR PARTE DE SUPERVISOR" Font-Bold="true" ></asp:Label>
            </h4>
    </div>
    <asp:Panel ID="PanelPrincipal" runat="server">
    <div>
        <asp:SqlDataSource ID="odsDatoClienteCampana" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT [idSorteoDatoClienteCampana], [sorteoDatoClienteCampanaCodigo], [sorteoDatoClienteCampanaDescripcion] FROM [sorteoDatoClienteCampana]"></asp:SqlDataSource>


        <asp:DropDownList ID="oddlDatoClienteCampana" runat="server" AutoPostBack="True" DataSourceID="odsDatoClienteCampana" DataTextField="sorteoDatoClienteCampanaDescripcion" DataValueField="idSorteoDatoClienteCampana" Height="48px" Width="140%">
        </asp:DropDownList>


    </div>


    <asp:RadioButtonList ID="orbTipoVista" runat="server" AutoPostBack="True">
        <asp:ListItem  Value="1">Asignar datos</asp:ListItem>
        <asp:ListItem Value="2">Visualizar por vendedor</asp:ListItem>
    </asp:RadioButtonList>


    <div>
        <asp:Label ID="Label3" runat="server" Text="Seleccione el operador a quien va a asignar los datos. Luego coloque un tilde en cada dato a asignar. Finalmente , presione el boton ASIGNAR "></asp:Label>
    </div>
    
    
    
    <div>
        <asp:SqlDataSource ID="odsOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SUPERVISORASIGNADATOSVENDEDOR" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idSupervisor" SessionField="idOperador" Type="Int32" />
                <asp:ControlParameter ControlID="orbTipoVista" Name="tipoVista" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="oddlOperador" runat="server" AutoPostBack="True" DataSourceID="odsOperador" DataTextField="operadorDescripcion" DataValueField="idOperador"></asp:DropDownList>
        <asp:Button ID="obutSupervisorAsignaDatosVendedor" runat="server" Text="ASIGNAR" BackColor="Green" Font-Bold="true" Width="20%" ForeColor="White" />



        <asp:Button ID="Button1" runat="server" Text="COLOREAR" />



    </div>
    <div>
        <asp:Label ID="olblMensaje" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Small"></asp:Label>
    </div>
    <div>

        <asp:Label ID="Label2" runat="server" Text="Datos recuperados:"></asp:Label>
        <asp:Label ID="olblFilasRecuperadas" runat="server" Text=""></asp:Label>
    </div>
    <div>

        <asp:SqlDataSource ID="odsDatoClienteCampanaDato" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatoClienteCampanaDatoTraer" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlDatoClienteCampana" Name="idSorteoDatoClienteCampana" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="orbTipoVista" Name="tipoVista" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="oddlOperador" Name="idOperador" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="ogvDatoClienteCampanaDato" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsDatoClienteCampanaDato" Font-Size="X-Small" AllowSorting="True" EmptyDataText="El operador seleccionado no tiene asignados datos para procesar ventas." DataKeyNames="idSorteoDatoClienteCampanaDato,apellidoYNombres,celularNumero,correoElectronico" >
            <Columns>
                <asp:CommandField SelectText="Ver Actuaciones" ShowSelectButton="True" />
                <asp:BoundField DataField="idSorteoDatoClienteCampana" HeaderText="idSorteoDatoClienteCampana" SortExpression="idSorteoDatoClienteCampana" Visible="False" />
                <asp:BoundField DataField="apellidoYNombres" HeaderText="Apellido y Nombres" SortExpression="apellidoYNombres" />
                <asp:BoundField DataField="celularNumero" HeaderText="Celular Numero" SortExpression="celularNumero" />
                <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" SortExpression="correoElectronico" />
                <asp:BoundField DataField="billetes" HeaderText="Cantidad Billetes" SortExpression="billetes">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Premio 5 millones" HeaderText="Premio 5 millones" SortExpression="Premio 5 millones">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Premio Terreno" HeaderText="Premio Terreno" SortExpression="Premio Terreno">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Premio Terreno y 0 km" HeaderText="Premio Terreno y 0 km" SortExpression="Premio Terreno y 0 km">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="vendedor" HeaderText="vendedor" SortExpression="vendedor" Visible="False" />
                <asp:TemplateField HeaderText="Selecciona" SortExpression="selecciona">
                    <ItemTemplate>
                        <asp:CheckBox ID="ochSeleccion" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="VendedorAsignado" HeaderText="Vendedor Asignado" SortExpression="VendedorAsignado" />
                <asp:BoundField DataField="FechaAsignacion" HeaderText="Fecha Asignacion" SortExpression="FechaAsignacion">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Actuaciones" HeaderText="Actuaciones" SortExpression="Actuaciones">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Mensaje Enviado" SortExpression="MensajeEnviado">

                    <ItemTemplate>
                        <asp:Label ID="olblColorMensajeEnviado" runat="server" Text='<%# Bind("MensajeEnviado") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Respuesta Cliente" SortExpression="RespuestaCliente">

                    <ItemTemplate>
                        <asp:Label ID="olblColorRespuestaCliente" runat="server" Text='<%# Bind("RespuestaCliente") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Llamada" SortExpression="Llamada">

                    <ItemTemplate>
                        <asp:Label ID="olblColorLlamada" runat="server" Text='<%# Bind("Llamada") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entrevista" SortExpression="Entrevista">

                    <ItemTemplate>
                        <asp:Label ID="olblColorEntrevista" runat="server" Text='<%# Bind("Entrevista") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle ForeColor="White" />
                </asp:TemplateField>
                <asp:BoundField DataField="FechaAgendada" HeaderText="Fecha Agendada" SortExpression="FechaAgendada" />
                <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="idSorteoDatoClienteCampanaDato" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="olblidSorteoDatoClienteCampanaDato" runat="server" Text='<%# Bind("idSorteoDatoClienteCampanaDato") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    </asp:Panel>
    <asp:Panel ID="PanelActuacion" runat="server" Visible ="false">
          <asp:Label ID="olblidSorteoDatoClienteCampanaDato" runat="server" Text=""  Visible="false"></asp:Label>
        <asp:Label ID="olblidSorteoDatoClienteCampana" runat="server" Text="" Visible="false"></asp:Label>


        <div>
            <asp:Label ID="Label4" runat="server" Text="Cliente:"></asp:Label>
            <asp:Label ID="olblapellidoYNombres" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Numero Celular:"></asp:Label>
            <asp:Label ID="olblcelularNumero" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label6" runat="server" Text="Correo electronico:"></asp:Label>
            <asp:Label ID="olblcorreoElectronico" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsSorteoDatoClienteCampanaDatoActuacionVer" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatoClienteCampanaDatoActuacionVer" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblidSorteoDatoClienteCampanaDato" Name="idSorteoDatoClienteCampanaDato" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoDatoClienteCampanaDatoActuacionVer" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoDatoClienteCampanaDatoActuacionVer" DataKeyNames="idSorteoDatoClienteCampanaDatoActuacion" Font-Size="Small" EmptyDataText ="No se han realizado acciones sobre este dato de cliente.">
                <Columns>
                    <asp:BoundField DataField="idSorteoDatoClienteCampanaDatoActuacion" HeaderText="idSorteoDatoClienteCampanaDatoActuacion" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoDatoClienteCampanaDatoActuacion" Visible="False" />
                    <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                    <asp:BoundField DataField="sorteoDatoClienteCampanaItemDescripcion" HeaderText="Etapa" SortExpression="sorteoDatoClienteCampanaItemDescripcion" />
                    <asp:BoundField DataField="actuacionFecha" HeaderText="actuacionFecha" SortExpression="actuacionFecha" />
                    <asp:BoundField DataField="sorteoDatoClienteCampanaItemOpcionDescripcion" HeaderText="Actuacion" SortExpression="sorteoDatoClienteCampanaItemOpcionDescripcion" />
                    <asp:BoundField DataField="operadorDescripcion" HeaderText="Operador" SortExpression="operadorDescripcion" />
                </Columns>
            </asp:GridView>
</div> 
        <div>

            <asp:Label ID="Label7" runat="server" Text="Mensajeria"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsTelefonoMensajeria" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="telefonoMensajeria" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblcelularNumero" Name="telefono" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvTelefonoMensajeria" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsTelefonoMensajeria" Font-Size="X-Small" EmptyDataText ="No se registran mensajes hasta el momento.">
                <Columns>
                    <asp:BoundField DataField="tipo" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" ReadOnly="True" SortExpression="telefono" Visible="False" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
                    <asp:BoundField DataField="mensaje" HeaderText="mensaje" ReadOnly="True" SortExpression="mensaje" />
                </Columns>
            </asp:GridView>

        </div>


                <div>
            <asp:Label ID="Label17" runat="server" Text="Agenda"></asp:Label>
             </div>
        <div>
            <asp:SqlDataSource ID="odsAgenda" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoDatoClienteCampanaDatoAgendaVer" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblidSorteoDatoClienteCampanaDato" Name="idSorteoDatoClienteCampanaDato" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvAgenda" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsAgenda" EmptyDataText ="No se registra agenda de entrevista al momento.">
                <Columns>
                    <asp:BoundField DataField="idSorteoDatoClienteCampanaDatoAgenda" HeaderText="idSorteoDatoClienteCampanaDatoAgenda" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoDatoClienteCampanaDatoAgenda" Visible="False" />
                    <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" Visible="False" />
                    <asp:BoundField DataField="idSorteoDatoClienteCampanaDato" HeaderText="idSorteoDatoClienteCampanaDato" SortExpression="idSorteoDatoClienteCampanaDato" Visible="False" />
                    <asp:BoundField DataField="agendaFechaAlta" HeaderText="Fecha Operacion" SortExpression="agendaFechaAlta" />
                    <asp:BoundField DataField="fechaAgendada" HeaderText="Fecha Agendada" ReadOnly="True" SortExpression="fechaAgendada" />
                    <asp:BoundField DataField="observacion" HeaderText="Observacion" SortExpression="observacion" />
                </Columns>
            </asp:GridView>

        </div>


        <div align="center" >

            <asp:Button ID="obutActuacionVolver" runat="server" Text="Volver" />



        </div>
    </asp:Panel>


    
</asp:Content>


