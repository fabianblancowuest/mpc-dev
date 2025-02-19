<%@ Page Title="Billetes por vendedor - Mantenimiento " Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptVendedorSorteoEstadoGlobal.aspx.vb" Inherits="Administracion_rptVendedorSorteoEstadoGlobal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="titulo-rol">
        <asp:Label ID="Label1" runat="server" Text="Mantenimiento de billetes por vendedor"></asp:Label>
    </h2>

    <asp:Panel ID="PanelBonos" runat="server">

    <div class="cuadro-info espaciado-interno contenedor-flexible">
        <asp:Label ID="Label2" runat="server" Text="Este rol permite a los operadores realizar modificaciones sobre los datos de los clientes como apellido y nombres, correo electrónico y teléfono. Se habilitará momentáneamente a todos los billetes, pero luego será sólo para billetes no rendidos."></asp:Label>
    </div>

    <div class="text-center margenes-y">
        <asp:Label ID="Label5" runat="server" Text="Efectúe los arreglos y luego presione el boton GUARDAR CAMBIOS." Font-Bold="true"></asp:Label>

    </div>

    <div align="center">

        <asp:Button ID="obutGuardarCambios" runat="server" Text="GUARDAR CAMBIOS" CssClass="btn-basic btn btn-success" />
    </div>
   

    <div class="margenes-y">
        <asp:SqlDataSource ID="odsrptVendedorSorteoEstadoGlobal" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptVendedorSorteoEstadoGlobal" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idOperador" SessionField="idOperador" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ogvrptVendedorSorteoEstadoGlobal" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalon" DataSourceID="odsrptVendedorSorteoEstadoGlobal" Font-Size="Small" EmptyDataText="No existen billetes pendientes de rendicion.">
            <Columns>
                <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">

                    <ItemTemplate>
                        <asp:Label ID="olblidSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="sorteoTalonNumero" HeaderText="Numero" SortExpression="sorteoTalonNumero">
                    <ItemStyle Font-Size="XX-Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="sorteoTalonMonto" HeaderText="Monto" SortExpression="sorteoTalonMonto" DataFormatString="{0:c}" Visible="False">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Datos de Cliente Billete " SortExpression="apellidoYNombres">
                    <ItemTemplate>
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Apellido y nombres" Font-Bold="True"></asp:Label>
                            <asp:TextBox ID="otxtapellidoYNombres" runat="server" Text='<%# Bind("apellidoYNombres") %>' Width="95%"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="Label4" runat="server" Text="Numero de celular" Font-Bold="True"></asp:Label>


                            <asp:TextBox ID="otxtcelularNumero" runat="server" Text='<%# Bind("celularNumero") %>' Width="95%"></asp:TextBox>
                            <div>
                                <div>
                                    <asp:Label ID="Label6" runat="server" Text="Correo electrónico" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="otxtcorreoElectronico" runat="server" Text='<%# Bind("correoElectronico") %>' Width="95%"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label7" runat="server" Text="Estado rendicióm" Font-Bold="True"></asp:Label>


                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rendido") %>' Font-Bold="true" ForeColor="Red"></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:BoundField DataField="idSorteoTalonCobranza" HeaderText="idSorteoTalonCobranza" SortExpression="idSorteoTalonCobranza" Visible="False" />
                <asp:BoundField DataField="sorteoTalonTomadoFecha" HeaderText="sorteoTalonTomadoFecha" SortExpression="sorteoTalonTomadoFecha" Visible="False" />

            </Columns>
        </asp:GridView>
    </div>
    
    </asp:Panel>
    <asp:Panel ID="PanelFinal" runat="server" Visible ="false">
 <div>
     <asp:Label ID="Label8" runat="server" Text="BONOS MODIFICADOS"  ></asp:Label>
<br />
 </div>
      
          <div align="center">
             <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" Font-Bold="true" ForeColor ="Red" ></asp:Label>
         </div>


         <div align="center">
            <asp:Button ID="obutRetorna" runat="server" Text="Retorna al menú de roles asignados" ForeColor ="White" Font-Bold ="true"  Height ="50px"  BackColor ="Blue"  />

        </div>



        </asp:Panel>
</asp:Content>

