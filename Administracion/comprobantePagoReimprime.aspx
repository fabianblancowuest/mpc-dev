<%@ Page Title="Reimpresion de Pagos" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="comprobantePagoReimprime.aspx.vb" Inherits="Administracion_comprobantePagoReimprime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Reimpresion de comprobantes de pago"></asp:Label>
    </div>

    <div>


        <asp:SqlDataSource ID="odsComprobantePagoReimprime" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SELECT [idAsientoCabecera], dbo.fn_asientoExplicacionPago(idAsientoCabecera ) as asientoCabeceraExplicacion FROM [asientoCabecera]  where idAsientoCabecera in (select idAsientoCabecera from asientoMovimiento where idConcepto =7)
order by idAsientoCabecera desc
"></asp:SqlDataSource>
        <asp:GridView ID="ogvodsComprobantePagoReimprime" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idAsientoCabecera" DataSourceID="odsComprobantePagoReimprime">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idAsientoCabecera" HeaderText="Asiento" InsertVisible="False" ReadOnly="True" SortExpression="idAsientoCabecera" />
                <asp:BoundField DataField="asientoCabeceraExplicacion" HeaderText="Explicacion" SortExpression="asientoCabeceraExplicacion" />
            </Columns>
        </asp:GridView>  


    </div>

</asp:Content>

