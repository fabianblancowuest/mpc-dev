<%@ Page Title="Duplica Manzanas en Barrio" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="manzanaDuplica.aspx.vb" Inherits="Administracion_manzanaDuplica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="Seleccione Barrio"></asp:Label>
    </div>
    <div>
            <asp:SqlDataSource ID="odsBarrio" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from barrio order by barrioCodigo"></asp:SqlDataSource>
 
        <asp:DropDownList ID="oddlBarrio" runat="server" DataSourceID="odsBarrio" DataTextField="barrioDescripcion" DataValueField="idBarrio" AutoPostBack="True"></asp:DropDownList>
       </div>
        <div>
        <asp:SqlDataSource ID="odsBarrioManzanaConLotes" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barriomanzanaLotes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBarrio" Name="idBarrio" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="odsBarrioManzanaSinLotes" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barriomanzanSinLotes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="oddlBarrio" Name="idBarrio" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>





    </div>
    <div>
        <br />

        <asp:Label ID="Label3" runat="server" Text="Copiar lotes desde manzana origen:"></asp:Label>
        <br />
        <asp:DropDownList ID="oddlManzanaOrigen" runat="server" DataSourceID="odsBarrioManzanaConLotes" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana"></asp:DropDownList>

    </div>
    <div>
        <br />
        <asp:Label ID="Label4" runat="server" Text="En manzana destino:" ></asp:Label>
        <br />
        <asp:DropDownList ID="oddlManzanaDestino" runat="server" DataSourceID="odsBarrioManzanaSinLotes" DataTextField="barrioManzanaDescripcion" DataValueField="idBarrioManzana"></asp:DropDownList>

    </div>

    <div>
        <asp:Label ID="olblGestionCodigo" runat="server" Text="" Visible ="false" ></asp:Label>
        <asp:Label ID="olblGestionDescripcion" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="obutDuplica" runat="server" Text="Duplicar lotes en manzana destino" BackColor ="Green"  ForeColor ="White" />
    </div>
    <div>
        <asp:Label ID="Label2" runat="server" Text="Ultimas duplicaciones de manzanas"></asp:Label>

    </div>
    <div>
        <asp:SqlDataSource ID="odsbarrioManzanaDuplicaTestigoUltimos" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="barrioManzanaDuplicaTestigoUltimos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:GridView ID="ogvbarrioManzanaDuplicaTestigoUltimos" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataSourceID="odsbarrioManzanaDuplicaTestigoUltimos" EmptyDataText="Todavia no se han realizado duplicaciones">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="idOperador" HeaderText="idOperador" SortExpression="idOperador" />
                <asp:BoundField DataField="idBarrioManzanaOrigen" HeaderText="idBarrioManzanaOrigen" SortExpression="idBarrioManzanaOrigen" />
                <asp:BoundField DataField="idBarrioManzanaDestino" HeaderText="idBarrioManzanaDestino" SortExpression="idBarrioManzanaDestino" />
                <asp:BoundField DataField="Operador" HeaderText="Operador" SortExpression="Operador" />
                <asp:BoundField DataField="Desde Manzana" HeaderText="Desde Manzana" SortExpression="Desde Manzana" />
                <asp:BoundField DataField="en Manzana" HeaderText="en Manzana" SortExpression="en Manzana" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

