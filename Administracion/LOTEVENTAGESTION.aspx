<%@ Page Title="Adhesion por venta de Lote " Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="loteVentagestion.aspx.vb" Inherits="Administracion_loteVentaGestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="olblBarrio" runat="server" Text="Barrio Bufalos I"></asp:Label>
        <asp:Label ID="olblIdBarrio" runat="server" Text="13" Visible ="false" ></asp:Label>

    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Seleccione Manzana"></asp:Label>
        <asp:SqlDataSource ID="odsBarrioManzana" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from barrioManzana where idBarrio = @idBarrio order by barrioManzanaCodigo ">
            <SelectParameters>
                <asp:ControlParameter ControlID="olblIdBarrio" Name="idBarrio" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="oddlBarrioManzana" runat="server" AutoPostBack="True" DataSourceID="odsBarrioManzana" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana"></asp:DropDownList>
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Seleccione Lote en manzana "></asp:Label>
        <asp:SqlDataSource ID="odsBarrioManzanaLote" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select a.*, v.Observaciones from barrioLote a left outer join loteVenta b on a.idBarrioLote=b.idBarrioLote left outer join operadores v on v.idOperador=b.idVendedor   
where a.idBarrioManzana = @idBarrioManzana
order by barrioLoteParcela ">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBarrioManzana" Name="idBarrioManzana" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="olblIDBarrioLoteSeleccionado" runat="server" Text=""></asp:Label>
    <asp:GridView ID="ogvBarrioManzanaLote" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idBarrioLote" DataSourceID="odsBarrioManzanaLote" EmptyDataText="La manzana seleccionada no posee lotes libres para la venta">
        <Columns>
            <asp:CommandField SelectText="Reservar / Vender" ShowSelectButton="True" />
            <asp:BoundField DataField="idBarrioLote" HeaderText="idBarrioLote" InsertVisible="False" ReadOnly="True" SortExpression="idBarrioLote" Visible="False" />
            <asp:BoundField DataField="idBarrio" HeaderText="idBarrio" SortExpression="idBarrio" Visible="False" />
            <asp:BoundField DataField="barrioLoteManzana" HeaderText="Manzana" SortExpression="barrioLoteManzana" Visible="true" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="barrioLoteParcela" HeaderText="Parcela" SortExpression="barrioLoteParcela" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="barrioLoteFrenteMetros" HeaderText="barrioLoteFrenteMetros" SortExpression="barrioLoteFrenteMetros" Visible="False" />
            <asp:BoundField DataField="barrioLoteFondoMetros" HeaderText="barrioLoteFondoMetros" SortExpression="barrioLoteFondoMetros" Visible="False" />
            <asp:BoundField DataField="idCostoReferencia" HeaderText="idCostoReferencia" SortExpression="idCostoReferencia" Visible="False" />
            <asp:BoundField DataField="barrioLotePrecioReferencia" HeaderText="barrioLotePrecioReferencia" SortExpression="barrioLotePrecioReferencia" Visible="False" />
            <asp:BoundField DataField="barrioLoteAdhesionReferencia" HeaderText="barrioLoteAdhesionReferencia" SortExpression="barrioLoteAdhesionReferencia" Visible="False" />
            <asp:BoundField DataField="barrioLoteImagen" HeaderText="barrioLoteImagen" SortExpression="barrioLoteImagen" Visible="False" />
            <asp:CheckBoxField DataField="barrioLoteEstado" HeaderText="barrioLoteEstado" SortExpression="barrioLoteEstado" Visible="False" />
            <asp:CheckBoxField DataField="barrioLoteEnVenta" HeaderText="barrioLoteEnVenta" SortExpression="barrioLoteEnVenta" Visible="False" />
            <asp:CheckBoxField DataField="barrioLoteBonificado" HeaderText="barrioLoteBonificado" SortExpression="barrioLoteBonificado" Visible="False" />
            <asp:BoundField DataField="idBarrioManzana" HeaderText="idBarrioManzana" SortExpression="idBarrioManzana" Visible="False" />
             <asp:BoundField DataField="observaciones" HeaderText="Actividad" SortExpression="observaciones" Visible="True" />
        </Columns>
        </asp:GridView>

    </div>
</asp:Content>


