<%@ Page Title="Mi Primer Casa - Control de existencia de billetes en urna." Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="sorteoTalonUrnaChequeo.aspx.vb" Inherits="Administracion_sorteoTalonUrnaChequeo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        Control de existencia de billetes en urna.
    </h1>

    <div>
        <asp:Label ID="Label2" runat="server" Text="Desde Numero de Billete:"></asp:Label>
        <asp:TextBox ID="otxtBilleteDesde" runat="server" Text="0" Width ="50px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Rango de control :"></asp:Label>
        <asp:TextBox ID="otxtRango" runat="server" Text="10" Width ="50px"></asp:TextBox>
        <asp:Button ID="obutTraer" runat="server" Text="Consultar" />
        <asp:Label ID="Label4" runat="server" Text="Cobrados:"></asp:Label>
        <asp:CheckBox ID="ochkCobrados" runat="server" AutoPostBack="True" />
        <asp:Label ID="Label5" runat="server" Text="Rendidos:"></asp:Label>
        <asp:CheckBox ID="ochkRendidos" runat="server" AutoPostBack="True" />
        <br />


    </div>
    <div>
        <asp:Label ID="Label3" runat="server" Text="Numero de auditoria"></asp:Label>
         <asp:Label ID="olblidSorteoTalonControlUrnaCabecera" runat="server" Visible="True" Font-Bold="true" Font-Size="Larger" text="0"></asp:Label>
        <asp:Button ID="obutAuditoriaNueva" runat="server" Text="Nueva Auditoria" />
        <asp:Label ID="olblValidacionMensajeError" runat="server" Text="" Font-Bold="true" ForeColor ="Red"></asp:Label>
    </div>

    <div align="center" >
        <asp:Button ID="obutAuditoriaGraba" runat="server" Text="Grabacion de novedades" ForeColor ="White" BackColor ="Green"  Font-Bold="true" Font-Size="Large"  />
             <asp:SqlDataSource ID="odssorteoTalonControlOperadorNovedad" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="select * from sorteoTalonControlOperadorNovedad where sorteoTalonControlOperadorNovedadRol in (0,2) order by sorteoTalonControlOperadorNovedadCodigo"></asp:SqlDataSource>
 
         <asp:SqlDataSource ID="odsSorteoTalonUrnaChequeo" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="SorteoTalonUrnaChequeo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="otxtBilleteDesde" Name="sorteoTalonNumerodesde" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="otxtRango" Name="rango" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="ochkCobrados" Name="cobrado" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="ochkRendidos" Name="rendido" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
              <asp:GridView ID="ogvSorteoTalonNoRendido" runat="server" AutoGenerateColumns="False" CssClass="table-cemmi" DataKeyNames="idSorteoTalon" DataSourceID="odsSorteoTalonUrnaChequeo" Font-Size="Small" AllowPaging="True" PageSize="100">
            <Columns>
                <asp:TemplateField HeaderText="idSorteoTalon" InsertVisible="False" SortExpression="idSorteoTalon" Visible="False">
                   
                    <ItemTemplate>
                        <asp:Label ID="olblIDSorteoTalon" runat="server" Text='<%# Bind("idSorteoTalon") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" >
                <ItemStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="AsignadoFecha" HeaderText="Fecha de asigacion" SortExpression="AsignadoFecha" />
                <asp:BoundField DataField="sorteoPremioDescripcion" HeaderText="Premio" ReadOnly="True" SortExpression="sorteoPremioDescripcion" />
              
                  <asp:BoundField DataField="sorteoTalonMonto" DataFormatString="{0:c}" HeaderText="Monto" SortExpression="sorteoTalonMonto">

                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                 <asp:TemplateField HeaderText="Control" SortExpression="idSorteoTalonControlOperadorNovedad">
                       <ItemTemplate>
                        <asp:DropDownList ID="oddlEstado" runat="server" DataSourceID="odssorteoTalonControlOperadorNovedad" DataTextField="SorteoTalonControlOperadorNovedadDescripcion" DataValueField="idSorteoTalonControlOperadorNovedad" SelectedValue='<%# Bind("idSorteoTalonControlOperadorNovedad") %>'>
                        </asp:DropDownList>
                           <asp:Label ID="olblIdEstado" runat="server" Text='<%# Bind("idSorteoTalonControlOperadorNovedad") %>' Visible ="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="apellidoYNombres" HeaderText="Comprador" SortExpression="apellidoYNombres" />
                <asp:BoundField DataField="celularNumero" HeaderText="Numero Celular" SortExpression="celularNumero" />
                <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" SortExpression="correoElectronico" />
                <asp:BoundField DataField="cobranza" HeaderText="Cobranza" SortExpression="cobranza">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="rendicion" HeaderText="Rendicion" SortExpression="rendicion">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>




    </div>
</asp:Content>

