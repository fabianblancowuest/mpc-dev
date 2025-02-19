<%@ Page Title="Extraccion de datos de encuestas por item" Language="VB" MasterPageFile="~/master/p.master"
    AutoEventWireup="false" CodeFile="sorteoDatosClienteVendedorEncuestaSeleccion.aspx.vb"
    Inherits="Administracion_sorteoDatosClienteVendedorEncuestaSeleccion" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" CssClass="contenedor-flexible">
        <div class="titulo-rol">
            <asp:Label ID="Label1" runat="server" Text="Extracción de datos encuesta billetes"></asp:Label>
        </div>
        <div>
            <asp:SqlDataSource ID="odsEncuesta" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="
select 0 as idSorteoEncuestaOpciones , ' Debe seleccionar opcion ' as descripcion, 0 as idSorteoEncuestaOrden
union 
select * from
(


select idSorteoEncuestaOpciones , 'Pregunta :' +sorteoEncuestaPregunta + ' Opcion:' + sorteoEncuestaOpcion  as descripcion,idSorteoEncuestaOrden  from sorteoEncuesta inner join sorteoEncuestaOpcion on sorteoEncuesta.idSorteoEncuesta = sorteoEncuestaOpcion .idSorteoEncuesta 

) as a  "></asp:SqlDataSource>
        </div>
        <div>

            <asp:DropDownList ID="oddlEncuesta1" runat="server" Width="100%" AutoPostBack="True"
                DataSourceID="odsEncuesta" DataTextField="descripcion" DataValueField="idSorteoEncuestaOpciones">
            </asp:DropDownList>


        </div>
        <div>
            <asp:DropDownList ID="oddlEncuesta2" runat="server" Width="100%" AutoPostBack="True"
                DataSourceID="odsEncuesta" DataTextField="descripcion" DataValueField="idSorteoEncuestaOpciones">
            </asp:DropDownList>

        </div>
        <div>
            <asp:DropDownList ID="oddlEncuesta3" runat="server" Width="100%" AutoPostBack="True"
                DataSourceID="odsEncuesta" DataTextField="descripcion" DataValueField="idSorteoEncuestaOpciones">
            </asp:DropDownList>
        </div>

        <div class="contenedor-responsive">

            <asp:SqlDataSource ID="odsSorteoDatosClienteVendedorEncuestaSeleccion" runat="server"
                ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>"
                SelectCommand="sorteoDatosClienteVendedorEncuestaSeleccion" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="oddlEncuesta1" Name="idSorteoEncuestaOpciones1"
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlEncuesta2" Name="idSorteoEncuestaOpciones2"
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="oddlEncuesta3" Name="idSorteoEncuestaOpciones3"
                        PropertyName="SelectedValue" Type="Int32" />

                </SelectParameters>
            </asp:SqlDataSource>




            <asp:GridView ID="GridView1" runat="server" CssClass="table-cemmi"
                DataSourceID="odsSorteoDatosClienteVendedorEncuestaSeleccion" Font-Size="X-Small"></asp:GridView>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Generar campaña con los datos generados."></asp:Label>


        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Codigo de campaña:"></asp:Label>

            <asp:TextBox ID="otxtCampaniaCodigo" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="Label4" runat="server" Text="Descripcion de campaña:"></asp:Label>

            <asp:TextBox ID="otxtCampaniaDescripcion" runat="server" Width="100%"></asp:TextBox>
        </div>


        <div align="center">
            <asp:Button ID="obutCampaniaGenera" runat="server" Text="Genera campania para seguimiento de datos cliente."
                BackColor="Yellow" Font-Bold="true" Height="50px" />


        </div>

        <div align="center">
            <asp:Label ID="olblMensajeValidacion" runat="server" Text=""></asp:Label>

        </div>
        <div align="center">
            <asp:Button ID="obutVolver" runat="server" Text="Retorna." BackColor="black" ForeColor="White"
                Font-Bold="true" Height="30px" Visible="false" />


        </div>

    </asp:Content>