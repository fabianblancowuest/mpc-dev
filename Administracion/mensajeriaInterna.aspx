<%@ Page Title="" MaintainScrollPositionOnPostback="True" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="mensajeriaInterna.aspx.vb" Inherits="SisFar_ordenCompra_mensajeriaInterna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="oblNotificacionTipo" runat="server" Text="3" Visible="False"></asp:Label>
  
    <asp:Panel ID="PanelBotonera" runat="server">

    <div class="row">
        <div class="col-xs-12">
            <asp:Button ID="obutNotificacionAlta" runat="server" Text="Nuevo Mensaje" CssClass="btn btn-success" />
            <asp:Button ID="obutVolver" runat="server" Text="Volver" CssClass="btn btn-primary" />
        </div>
        <div class="col-xs-12">
     
             <asp:Button ID="obutLeidos" runat="server" Text="Recibidos" CssClass="btn btn-primary" />
            <asp:Button ID="obutEnviadosNoLeidos" runat="server" Text="Enviados" CssClass="btn btn-primary" />
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="PanelRecibidos" runat="server">
    <div class="row">
        <div class="col-xs-12">
            <h3>
                <asp:Label ID="Label1" runat="server" Text="NOTIFICACIONES RECIBIDAS"></asp:Label>
            </h3>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12" align="right">
        </div>
        <br />
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:SqlDataSource ID="odsNotificacionRecibidos" runat="server" ConnectionString="<%$ ConnectionStrings:ordenCompra %>"
                SelectCommand="notificacionOperadorRecibidos" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idOperador" SessionField="idoPerador" Type="Int32" />
                    <asp:ControlParameter ControlID="oblNotificacionTipo" Name="idNotificacionTipo" PropertyName="Text"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvNotificacionRecibidos" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                DataKeyNames="idNotificacion,Asunto,texoMensaje" DataSourceID="odsNotificacionRecibidos"
                CssClass="table-cemmi" EmptyDataText="NO EXISTEN MENSAJES PENDIENTES DE LECTURA">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Abrir" />
                    <asp:BoundField DataField="idNotificacion" HeaderText="idNotificacion" SortExpression="idNotificacion"
                        InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="operadorOrigen" HeaderText="Operador Origen" SortExpression="operadorOrigen" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha Notificacion" SortExpression="fecha">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Asunto" HeaderText="Asunto" SortExpression="Asunto" />
                    <asp:BoundField DataField="Leido" HeaderText="Leido" SortExpression="Leido" />
                    <asp:BoundField DataField="texoMensaje" HeaderText="texoMensaje" SortExpression="texoMensaje"
                        Visible="False" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:Label ID="olblIdNotificacion" runat="server" Text="" Visible="false"></asp:Label>
        </div>
    </div>
    </asp:Panel>
    
    <asp:Panel ID="PanelMensaje" runat="server" Visible="false">
        <div class="row">
            <div class="col-xs-12">
                <h3>
                    <asp:Label ID="Label2" runat="server" Text="Mensaje"></asp:Label></h3>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:Label ID="Label3" runat="server" Text="Asunto:"></asp:Label>
                <asp:Label ID="olblAsunto" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div>
                    <asp:TextBox ID="otxtMensaje" runat="server" TextMode="MultiLine" Width="100%" Height="190px"
                        Enabled="false"></asp:TextBox>
                </div>
            </div>
        </div>
        <div align="right">
            
        </div><asp:Button ID="obutResponderMensaje" runat="server" Text="Responder Mensaje" CssClass="btn btn-success"
                Visible="true" />
    </asp:Panel>
    <asp:Panel ID="PanelResponderMensaje" runat="server" Visible="false">
        <div class="row">
            <div class="col-xs-12">
                <h3>
                    <asp:Label ID="Label5" runat="server" Text="Mensaje Respuesta"></asp:Label></h3>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:Label ID="Label6" runat="server" Text="Asunto:"></asp:Label>
                <asp:Label ID="olblAsuntoRespuesta" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div>
                    <asp:TextBox ID="txtMensajeRespuesta" runat="server" TextMode="MultiLine" Width="100%"
                        Height="190px"></asp:TextBox>
                </div>
            </div>
        </div>
        <asp:Label ID="olblMensajeRespustaError" runat="server" Text=""></asp:Label>
        <asp:Label ID="olblAltaExitosa" runat="server" Text="0" Visible="false"> </asp:Label>
        <div align="right">
            <asp:Button ID="obutEnviarMensaje" runat="server" Text="Enviar" CssClass="btn btn-danger"
                Visible="true" />
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelEnviados" runat="server" Visible ="false">
    
    <div class="row">
        <div class="col-xs-12">
            <h3>
                <asp:Label ID="Label4" runat="server" Text="NOTIFICACIONES ENVIADAS"></asp:Label></h3>
        </div>
        <div class="col-xs-12">
            <asp:Label ID="olblReporteTipo" runat="server" Text="0" Visible="False"></asp:Label>
         </div>
    </div>
    <asp:SqlDataSource ID="odsNotificacionEnviada" runat="server" ConnectionString="<%$ ConnectionStrings:ordenCompra %>"
        SelectCommand="notificacionOperadorEnviados" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idOperador" SessionField="idoPerador" Type="Int32" />
            <asp:ControlParameter ControlID="oblNotificacionTipo" Name="idNotificacionTipo" PropertyName="Text"
                Type="Int32" />
            <asp:ControlParameter ControlID="olblReporteTipo" Name="reporteTipo" PropertyName="Text"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ogvNotificacionEnviada" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="idNotificacion,Asunto,texoMensaje" DataSourceID="odsNotificacionEnviada"
        CssClass="table-cemmi">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Abrir" />
            <asp:BoundField DataField="idNotificacion" HeaderText="idNotificacion" InsertVisible="False"
                ReadOnly="True" SortExpression="idNotificacion" Visible="False" />
            <asp:BoundField DataField="operadorDestino" HeaderText="Operador Destino" SortExpression="operadorOrigen" />
            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Asunto" HeaderText="Asunto" SortExpression="Asunto" />
            <asp:BoundField DataField="texoMensaje" HeaderText="texoMensaje" SortExpression="texoMensaje"
                Visible="False" />
            <asp:BoundField DataField="fechaLectura" HeaderText="fechaLectura" SortExpression="fechaLectura">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Leida" HeaderText="Leida" SortExpression="Leida" />
            <asp:BoundField DataField="actuaciones" HeaderText="Actuaciones" SortExpression="actuaciones">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>

    </asp:Panel>
</asp:Content>
