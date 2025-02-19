<%@ Page Title="" Language="VB" MasterPageFile="~/master/p.master" AutoEventWireup="false" CodeFile="reportePrueba.aspx.vb" Inherits="Administracion_reportePrueba" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <a href="ReportePrueba.rdlc">ReportePrueba.rdlc</a>

    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" Width ="100%"  Height ="100%" WaitMessageFont-Size  ="14pt">
        <LocalReport ReportPath="Administracion\REPORTEPRUEBA.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="MPC" Name="REPORTEPRUEBA" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>

    <asp:SqlDataSource ID="MPC" runat="server" ConnectionString="<%$ ConnectionStrings:STRSYSTEM %>" SelectCommand="sorteoDatosClienteVendedor01" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>

