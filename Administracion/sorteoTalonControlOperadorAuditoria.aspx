<%@ Page Title="Consulta sobre auditorias de billetes" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoTalonControlOperadorAuditoria.aspx.vb" Inherits="Administracion_sorteoTalonControlOperadorAuditoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Auditoria sobre billetes en vendedor"></asp:Label>

</div>
    <asp:Panel ID="Panel1" runat="server">

    <div>

        <asp:Label ID="Label2" runat="server" Text="Ultimas Auditorias "></asp:Label>
        <asp:TextBox ID="otxtUltimas" runat="server" Text="100"></asp:TextBox>
    </div>
    <div>
        <asp:SqlDataSource ID="odsSorteoTalonControlOperadorAuditoria" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonControlOperadorAuditoria" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="otxtUltimas" Name="ultimas" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="ogvSorteoTalonControlOperadorAuditoria" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoTalonControlOperadorAuditoria" DataKeyNames="idSorteoTalonControlOperadorCabecera,idOperadorAuditor,Auditor,fechaControl,idOperadorVenta,Vendedor,billetesAuditados" EmptyDataText="No existen auditorias realizadas sobre vendedores de billetes hasta el momento.">
            <Columns>
                <asp:CommandField SelectText="Ver Auditoria" ShowSelectButton="True" />
                <asp:BoundField DataField="idSorteoTalonControlOperadorCabecera" HeaderText="idSorteoTalonControlOperadorCabecera" InsertVisible="False" SortExpression="idSorteoTalonControlOperadorCabecera" Visible="False" />
                <asp:BoundField DataField="idOperadorAuditor" HeaderText="idOperadorAuditor" SortExpression="idOperadorAuditor" Visible="False" />
                <asp:BoundField DataField="Auditor" HeaderText="Auditor" SortExpression="Auditor" />
                <asp:BoundField DataField="fechaControl" HeaderText="Fecha Control" SortExpression="fechaControl" />
                <asp:BoundField DataField="idOperadorVenta" HeaderText="idOperadorVenta" SortExpression="idOperadorVenta" Visible="False" />
                <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                <asp:BoundField DataField="billetesAuditados" HeaderText="Billetes Auditados" SortExpression="billetesAuditados">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>

    </asp:Panel>


    <asp:Panel ID="PanelAuditoria" runat="server" Visible ="false" >
        <div>
            <asp:Label ID="Label3" runat="server" Text="Auditoria :"></asp:Label>
            <asp:Label ID="olblidSorteoTalonControlOperadorCabecera" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label5" runat="server" Text=" - Fecha de Auditoria :"></asp:Label>
            <asp:Label ID="olblfechaControl" runat="server" Text=""></asp:Label>

        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Operador Auditor:"></asp:Label>
            <asp:Label ID="olblAuditor" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
         <div>
            <asp:Label ID="Label6" runat="server" Text="Vendedor Auditado:" CssClass ="alert-danger "></asp:Label>
            <asp:Label ID="olblVendedor" runat="server" Text="" Font-Bold="true"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label7" runat="server" Text="Auditoria sobre billetes asignados no rendidos"></asp:Label>
        </div>
        <div>

            <asp:SqlDataSource ID="odsSorteoTalonControlOperadorCabeceraTrae" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonControlOperadorCabeceraTrae" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblidSorteoTalonControlOperadorCabecera" Name="idSorteoTalonControlOperadorCabeccera" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoTalonControlOperadorCabeceraTrae" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoTalonControlOperadorCabeceraTrae">
                <Columns>
                    <asp:BoundField DataField="Numero Billete" HeaderText="Numero Billete" SortExpression="Numero Billete">
                    <ItemStyle Font-Bold="True" Font-Italic="False" Font-Size="Larger" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Novedad" HeaderText="Novedad" SortExpression="Novedad" />
                </Columns>
            </asp:GridView>
        </div>
        <div>
              <asp:SqlDataSource ID="odsSorteoTalonControlOperadorCabeceraTraeResumen" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoTalonControlOperadorCabeceraTraeResumen" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="olblidSorteoTalonControlOperadorCabecera" Name="idSorteoTalonControlOperadorCabeccera" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="ogvSorteoTalonControlOperadorCabeceraTraeResumen" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsSorteoTalonControlOperadorCabeceraTraeResumen">
                <Columns>
                    
                    <asp:BoundField DataField="idSorteoTalonControlOperadorNovedad" HeaderText="idSorteoTalonControlOperadorNovedad" ReadOnly="True" SortExpression="idSorteoTalonControlOperadorNovedad" Visible="False" />
                    <asp:BoundField DataField="Novedad" HeaderText="Novedad" ReadOnly="True" SortExpression="Novedad" />
                    <asp:BoundField DataField="Cantida Billetes" HeaderText="Cantidad Billetes" ReadOnly="True" SortExpression="Cantida Billetes">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    
                </Columns>
            </asp:GridView>
        </div>

<div>
    <asp:Button ID="obutVolver" runat="server" Text="Volver" />
</div>
    </asp:Panel>


</asp:Content>

