<%@ Page Title="Gestion Global de Adhesiones por Barrio" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="rptGestionGlobalAdhesionesPorBarrio.aspx.vb" Inherits="Administracion_rptGestionGlobalAdhesionesPorBarrio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Gestion global de Adhesiones por barrio"></asp:Label>

    </div>
    

    <div>
<asp:SqlDataSource ID="odsrptGestionGlobalAdhesionesPorBarrio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="rptGestionGlobalAdhesionesPorBarrio" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="ogvrptGestionGlobalAdhesionesPorBarrio" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsrptGestionGlobalAdhesionesPorBarrio">
            <Columns>
                <asp:BoundField DataField="idBarrio" HeaderText="idBarrio" SortExpression="idBarrio">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="barrio" HeaderText="barrio" SortExpression="barrio" />
                <asp:BoundField DataField="lotesGestionados" HeaderText="Lotes Gestionados" ReadOnly="True" SortExpression="lotesGestionados">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

