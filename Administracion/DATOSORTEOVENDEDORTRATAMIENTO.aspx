<%@ Page Title="TRATAMIENTO DE DATOS DE CLIENTES ASIGNADOS A VENDEDOR" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="DATOSORTEOVENDEDORTRATAMIENTO.aspx.vb" Inherits="Administracion_DATOSORTEOVENDEDORTRATAMIENTO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>        <asp:Label ID="Label1" runat="server" Text="TRATAMIENTO DE DATOS ASIGNADOS"></asp:Label> 
            </h1>

    </div>

 <asp:Panel ID="PanelClientes" runat="server">
    <div align ="center">
        <asp:Button ID="obutColorear" runat="server" Text="COLOREAR" BackColor="Green"  Font-Bold ="true" ForeColor ="White" />
     </div>
   
   
        <div>
            <asp:SqlDataSource ID="odsSorteoDatoClienteCampanaDatoOperador" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatoClienteCampanaDatoOperador" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoDatoClienteCampanaDatoOperador" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoDatoClienteCampanaDatoOperador" Font-Size="Medium" DataKeyNames="idSorteoDatoClienteCampanaDato,idSorteoDatoClienteCampana,apellidoYNombres,celularNumero,correoElectronico,idMensajeEnviado,idRespuestaCliente,idLlamada,idEntrevista,Premio 5 millones,Premio Terreno y 0 km,Premio Terreno" EmptyDataText=" ">
                <Columns>
                    <asp:CommandField SelectText="TRATAR&gt;&gt;" ShowSelectButton="True" />
                    <asp:BoundField DataField="idSorteoDatoClienteCampanaDato" HeaderText="idSorteoDatoClienteCampanaDato" InsertVisible="False" ReadOnly="True" SortExpression="idSorteoDatoClienteCampanaDato" Visible="False" />
                    <asp:BoundField DataField="idSorteoDatoClienteCampana" HeaderText="idSorteoDatoClienteCampana" SortExpression="idSorteoDatoClienteCampana" Visible="False" />
                    <asp:BoundField DataField="apellidoYNombres" HeaderText="Apellido Y Nombres" SortExpression="apellidoYNombres" />
                    <asp:BoundField DataField="celularNumero" HeaderText="celularNumero" SortExpression="celularNumero" Visible="False" />
                    <asp:BoundField DataField="correoElectronico" HeaderText="correoElectronico" SortExpression="correoElectronico" Visible="False" />
                    <asp:BoundField DataField="billetes" HeaderText="billetes" SortExpression="billetes" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Premio 5 millones" HeaderText="Premio 5 millones" SortExpression="Premio 5 millones" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Premio Terreno" HeaderText="Premio Terreno" SortExpression="Premio Terreno" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Premio Terreno y 0 km" HeaderText="Premio Terreno y 0 km" SortExpression="Premio Terreno y 0 km" Visible="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idOperador" HeaderText="idOperador" ReadOnly="True" SortExpression="idOperador" Visible="False" />
                    <asp:BoundField DataField="vendedorAsignado" HeaderText="vendedorAsignado" ReadOnly="True" SortExpression="vendedorAsignado" Visible="False" />
                    <asp:BoundField DataField="Actuaciones" HeaderText="Actuaciones" ReadOnly="True" SortExpression="Actuaciones">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaAsignacion" HeaderText="FechaAsignacion" ReadOnly="True" SortExpression="FechaAsignacion" />
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
                    <asp:BoundField DataField="selecciona" HeaderText="selecciona" SortExpression="selecciona" Visible="False" />
                    <asp:BoundField DataField="idMensajeEnviado" HeaderText="idMensajeEnviado" SortExpression="idMensajeEnviado" Visible="False" />
                    <asp:BoundField DataField="idRespuestaCliente" HeaderText="idRespuestaCliente" SortExpression="idRespuestaCliente" Visible="False" />
                    <asp:BoundField DataField="idLlamada" HeaderText="idLlamada" SortExpression="idLlamada" Visible="False" />
                    <asp:BoundField DataField="idEntrevista" HeaderText="idEntrevista" SortExpression="idEntrevista" Visible="False" />
                    <asp:BoundField DataField="FechaAgendada" HeaderText="Fecha Agendada" SortExpression="FechaAgendada" />
                    <asp:TemplateField HeaderText="Referidos" SortExpression="Referidos">
                        
                        <ItemTemplate>
                            <asp:Label ID="olblReferidos" runat="server" Text='<%# Bind("Referidos") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </asp:Panel>

    <asp:Panel ID="PanelTratamientoCliente" runat="server" Visible="false">
        <asp:Label ID="Label19" runat="server" Text="ID:" Visible="true"></asp:Label>
        <asp:Label ID="olblidSorteoDatoClienteCampanaDato" runat="server" Text="" Font-Bold ="true" Visible="true"></asp:Label>
        <asp:Label ID="olblidSorteoDatoClienteCampana" runat="server" Text="" Visible ="false"></asp:Label>


        <div>
            <asp:Label ID="Label2" runat="server" Text="Cliente:"></asp:Label>
            <asp:Label ID="olblapellidoYNombres" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label3" runat="server" Text="Numero Celular:"></asp:Label>
            <asp:Label ID="olblcelularNumero" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label4" runat="server" Text="Correo electronico:"></asp:Label>
            <asp:Label ID="olblcorreoElectronico" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
          <div>
            <asp:Label ID="Label18" runat="server" Text="Motivo:"></asp:Label>
            <asp:Label ID="olblMotivo" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>

            <asp:Label ID="Label5" runat="server" Text="Mensaje enviado" Width="90%"></asp:Label>
            <asp:SqlDataSource ID="odsItem1" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [sorteoDatoClienteCampanaItemOpcion] WHERE ([idSorteoDatoClienteCampanaItem] = @idSorteoDatoClienteCampanaItem) ORDER BY [sorteoDatoClienteCampanaItemOpcionOrden]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="idSorteoDatoClienteCampanaItem" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlItem1" Enabled="true" runat="server" DataSourceID="odsItem1" DataTextField="sorteoDatoClienteCampanaItemOpcionDescripcion" DataValueField="idSorteoDatoClienteCampanaItemOpcion" Width="90%" AutoPostBack="True"></asp:DropDownList>
        </div>

        <div>

            <asp:Label ID="Label6" runat="server" Text="Respuesta del Cliente al mensaje" Width="90%"></asp:Label>
            <asp:SqlDataSource ID="odsItem2" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [sorteoDatoClienteCampanaItemOpcion] WHERE ([idSorteoDatoClienteCampanaItem] = @idSorteoDatoClienteCampanaItem) ORDER BY [sorteoDatoClienteCampanaItemOpcionOrden]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="idSorteoDatoClienteCampanaItem" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlItem2" Enabled="false" runat="server" DataSourceID="odsItem2" DataTextField="sorteoDatoClienteCampanaItemOpcionDescripcion" DataValueField="idSorteoDatoClienteCampanaItemOpcion" Width="90%" AutoPostBack="True"></asp:DropDownList>
        </div>

        <div>

            <asp:Label ID="Label7" runat="server" Text="Llamada al Cliente" Width="90%"></asp:Label>
            <asp:SqlDataSource ID="odsItem3" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [sorteoDatoClienteCampanaItemOpcion] WHERE ([idSorteoDatoClienteCampanaItem] = @idSorteoDatoClienteCampanaItem) ORDER BY [sorteoDatoClienteCampanaItemOpcionOrden]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="3" Name="idSorteoDatoClienteCampanaItem" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlItem3" Enabled="false" runat="server" DataSourceID="odsItem3" DataTextField="sorteoDatoClienteCampanaItemOpcionDescripcion" DataValueField="idSorteoDatoClienteCampanaItemOpcion" Width="90%" AutoPostBack="True"></asp:DropDownList>
        </div>

        <div>

            <asp:Label ID="Label8" runat="server" Text="Entrevista Cliente" Width="90%"></asp:Label>
            <asp:SqlDataSource ID="odsItem4" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT * FROM [sorteoDatoClienteCampanaItemOpcion] WHERE ([idSorteoDatoClienteCampanaItem] = @idSorteoDatoClienteCampanaItem) ORDER BY [sorteoDatoClienteCampanaItemOpcionOrden]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="4" Name="idSorteoDatoClienteCampanaItem" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="oddlItem4" Enabled="false" runat="server" DataSourceID="odsItem4" DataTextField="sorteoDatoClienteCampanaItemOpcionDescripcion" DataValueField="idSorteoDatoClienteCampanaItemOpcion" Width="90%" AutoPostBack="True"></asp:DropDownList>
        </div>
        <asp:Label ID="olblmensaje" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
               <asp:Label ID="olblMensajeERRORBD" runat="server" Text="" ForeColor="Red"></asp:Label>
        <div align="center">
            <asp:Button ID="obutVolver" runat="server" Text="VOLVER" />
        </div>


            <div>
            <asp:SqlDataSource ID="odsSorteoDatoClienteCampanaDatoActuacionVer" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatoClienteCampanaDatoActuacionVer" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblidSorteoDatoClienteCampanaDato" Name="idSorteoDatoClienteCampanaDato" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoDatoClienteCampanaDatoActuacionVer" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoDatoClienteCampanaDatoActuacionVer" DataKeyNames="idSorteoDatoClienteCampanaDatoActuacion" Font-Size="Small">
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

            <asp:Label ID="Label16" runat="server" Text="Mensajeria"></asp:Label>
            <asp:Button ID="obutMensajeriaActualiza" runat="server" Text="(@)" />
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
                    <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" SortExpression="fechaAlta" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha Impacto" ReadOnly="True" SortExpression="fecha" />
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
            </asp:Panel>
        <asp:Panel ID="PanelAgenda" runat="server" Visible ="false">

        <div>
            <asp:Label ID="Label9" runat="server" Text="Registro en Agenda"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label10" runat="server" Text="Registre fecha , hora y minuto de la reunión pactada con el Cliente para la realización de la entrevista."></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label11" runat="server" Text="Persona a entrevistar:"></asp:Label>
            <asp:Label ID="olblEntrevistaPersona" runat="server" Text="" Font-Bold="true"></asp:Label>

        </div>

        <div>
            <asp:SqlDataSource ID="odsCalendario" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="CalendarioAgendaOddl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:Label ID="Label12" runat="server" Text="Fecha Entrevista:"></asp:Label>
            <asp:DropDownList ID="oddlEntrevistaFecha" runat="server" DataSourceID="odsCalendario" DataTextField="fecha" DataValueField="fecha"></asp:DropDownList>
            <asp:Label ID="Label13" runat="server" Text=" - Hora:"></asp:Label>
            <asp:DropDownList ID="oddlEntrevistaHora" runat="server">
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>


            </asp:DropDownList>

            <asp:Label ID="Label14" runat="server" Text=" - Minutos:"></asp:Label>
            <asp:DropDownList ID="oddlEntrevistaMinutos" runat="server">
                <asp:ListItem>00</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>35</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
                <asp:ListItem>45</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
            </asp:DropDownList>

        </div>

        <div>
            <asp:Label ID="Label15" runat="server" Text="Observaciones"></asp:Label>

        </div>
        <div align="center" >
            <asp:TextBox ID="otxtEntrevistaObservaciones" runat="server" TextMode ="MultiLine" Width ="80%" Height ="200px"></asp:TextBox>
        </div>

         <div align="center">
            <asp:Label ID="olblEntrevistaMensaje" runat="server" Text="" Font-Bold="true" ForeColor ="Blue" ></asp:Label>

        </div>
        <div align="center" >
            <asp:Button ID="obutEntrevistaGraba" runat="server" Text="Registra Entrevista" BackColor ="Green" ForeColor ="White"  />
            <asp:Button ID="obutEntrevistaCierra" runat="server" Text="Cierra" BackColor ="Blue" ForeColor ="White"  Visible ="false" />

        </div>
    </asp:Panel>
</asp:Content>

