<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="notificacionEnvio.aspx.vb" Inherits="SisFar_ordenCompra_notificacionEnvio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
     <div class="row">
        <div class="col-xs-12">
                <asp:Button ID="obutVolver" runat="server" Text="Volver" CssClass="btn btn-primary" />
        </div>
        

    </div>
   
    <div>
        <asp:Label ID="olblMensajeEjecucion" runat="server" Text=""></asp:Label>
    </div>


    <div>
        <asp:Label ID="olblMensajeCantidadSeleccionados" runat="server" Text=""></asp:Label>
    </div>
   <div>
       <asp:Button ID="obutMarcaTodo" runat="server" Text="Marcar Todo" /> 
       <asp:Button ID="obutDesmarcaTodo" runat="server" Text="Desmarcar Todo" />  
       <asp:Button ID="obutOcultaGrillaSeleccion" runat="server" Text="Ocultar Grilla de Seleccion" />  
   
   </div>
   <div>
    <asp:RadioButtonList ID="orbNotificacionTipo" runat="server" 
        RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="1">Privado</asp:ListItem>
        <asp:ListItem Value="2">Público</asp:ListItem>
    </asp:RadioButtonList>
   </div> 
    <div>
        <asp:SqlDataSource ID="odsNotificacionEnvio" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ordenCompra %>" 
            SelectCommand="notificacionOperadorOddl" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="idOperador" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="ogvNOtificacionEnvio" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="odsNotificacionEnvio"  CssClass="table-cemmi">
            <Columns>
                <asp:TemplateField HeaderText="idOperador" InsertVisible="False" 
                    SortExpression="idOperador" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="olblIdOperadorDestino" runat="server" Text='<%# Eval("idOperador") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="olblIdOperadorDestino" runat="server" Text='<%# Bind("idOperador") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="chequeado" SortExpression="chequeado">
                    <EditItemTemplate>
                        <asp:CheckBox ID="ochChequeado" runat="server"   AutoPostBack ="true" OnCheckedChanged ="grabaOperadoEstado"
                            Checked='<%# Bind("chequeado") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="ochChequeado" runat="server"  AutoPostBack ="true" OnCheckedChanged ="grabaOperadoEstado" 
                            Checked='<%# Bind("chequeado") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Operador" SortExpression="Observaciones">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Observaciones") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="olblOperadorSeleccionado" runat="server" Text='<%# Bind("Observaciones") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="descripcion" HeaderText="Sector" 
                    SortExpression="descripcion" />
                
            </Columns>
        </asp:GridView>
    </div>
    
                   
    <div>
        <asp:Label ID="Label1" runat="server" Text="Mensaje:"></asp:Label>

    </div>


     <div>
         <asp:Label ID="Label2" runat="server" Text="Asunto:"></asp:Label>
        <br />
        <asp:TextBox ID="otxtAsunto" runat="server" TextMode ="SingleLine"  Width ="100%" Height ="30px" ></asp:TextBox>
    </div>
    <div>
        <asp:TextBox ID="otxtMensaje" runat="server" TextMode ="MultiLine" Width ="100%" Height ="300px" ></asp:TextBox>
    </div>
    <div>
        <asp:Label ID="olblMensajeValidacion" runat="server" Text="" ></asp:Label>
    </div>
    <div>

        <asp:Button ID="obutEnviaNotificacion" runat="server" Text="Envía Notificacion" />  
        <asp:Label ID="olblIdNotificacionReferenciaPublica" runat="server" Text="0" Visible="false"></asp:Label>
    </div>

</asp:Content>

