
Partial Class Administracion_rptLoteVentaVendedorPeriodoAdministracion
    Inherits System.Web.UI.Page

    Protected Sub oddlUltimosPeriodos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlUltimosPeriodos.SelectedIndexChanged
        GridView1.DataBind()
        ogvrptLoteVentaVendedorPeriodoResumen.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
       
    End Sub

    Protected Sub ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedIndexChanged
        PanelDocumentacion.Visible = True
        PanelPrincipal.Visible = False

           olblIDLOTEVENTA.Text = ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedDataKey.Item("idLoteVenta")
        olblCLIENTE01NOMBRE.Text = ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedDataKey.Item("cliente01Nombre") + "  Barrio:" + ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedDataKey.Item("Barrio").ToString + " Manzana:" + ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedDataKey.Item("Manzana").ToString + "  Parcela:" + ogvrptLoteVentaVendedorIdPeriodoAdhesionPendiente.SelectedDataKey.Item("Parcela").ToString
        persona1DocumentoAnverso.inicializa(olblIDLOTEVENTA, "1", olblCLIENTE01NOMBRE, "1")
        persona1DocumentoReverso.inicializa(olblIDLOTEVENTA, "2", olblCLIENTE01NOMBRE, "2")
        persona2DocumentoAnverso.inicializa(olblIDLOTEVENTA, "3", olblCLIENTE01NOMBRE, "1")
        persona2DocumentoReverso.inicializa(olblIDLOTEVENTA, "4", olblCLIENTE01NOMBRE, "2")
        consentimientoInformado.inicializa(olblIDLOTEVENTA, "5", olblCLIENTE01NOMBRE, "1")
        recibo1.inicializa(olblIDLOTEVENTA, "6", olblCLIENTE01NOMBRE, "2")
        transferencia1.inicializa(olblIDLOTEVENTA, "7", olblCLIENTE01NOMBRE, "1")
        recibo2.inicializa(olblIDLOTEVENTA, "8", olblCLIENTE01NOMBRE, "2")
        transferencia2.inicializa(olblIDLOTEVENTA, "9", olblCLIENTE01NOMBRE, "2")
        recibo3.inicializa(olblIDLOTEVENTA, "10", olblCLIENTE01NOMBRE, "1")
        transferencia3.inicializa(olblIDLOTEVENTA, "11", olblCLIENTE01NOMBRE, "2")



    End Sub




    Protected Sub obutDocumentacionVolver_Click(sender As Object, e As EventArgs) Handles obutDocumentacionVolver.Click
        PanelDocumentacion.Visible = False
        PanelPrincipal.Visible = True

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        PanelDocumentacion.Visible = True
        PanelPrincipal.Visible = False
        olblIDLOTEVENTA.Text = GridView1.SelectedDataKey.Item("idLoteVenta")
        olblCLIENTE01NOMBRE.Text = GridView1.SelectedDataKey.Item("cliente01Nombre") + "  (Barrio:" + GridView1.SelectedDataKey.Item("Barrio").ToString + " Manzana:" + GridView1.SelectedDataKey.Item("Manzana").ToString + "  Parcela:" + GridView1.SelectedDataKey.Item("Parcela").ToString + ")"
        persona1DocumentoAnverso.inicializa(olblIDLOTEVENTA, "1", olblCLIENTE01NOMBRE, "1")
        persona1DocumentoReverso.inicializa(olblIDLOTEVENTA, "2", olblCLIENTE01NOMBRE, "2")
        persona2DocumentoAnverso.inicializa(olblIDLOTEVENTA, "3", olblCLIENTE01NOMBRE, "1")
        persona2DocumentoReverso.inicializa(olblIDLOTEVENTA, "4", olblCLIENTE01NOMBRE, "2")
        consentimientoInformado.inicializa(olblIDLOTEVENTA, "5", olblCLIENTE01NOMBRE, "1")
        recibo1.inicializa(olblIDLOTEVENTA, "6", olblCLIENTE01NOMBRE, "2")
        transferencia1.inicializa(olblIDLOTEVENTA, "7", olblCLIENTE01NOMBRE, "1")
        recibo2.inicializa(olblIDLOTEVENTA, "8", olblCLIENTE01NOMBRE, "2")
        transferencia2.inicializa(olblIDLOTEVENTA, "9", olblCLIENTE01NOMBRE, "2")
        recibo3.inicializa(olblIDLOTEVENTA, "10", olblCLIENTE01NOMBRE, "1")
        transferencia3.inicializa(olblIDLOTEVENTA, "11", olblCLIENTE01NOMBRE, "2")

    End Sub
End Class
