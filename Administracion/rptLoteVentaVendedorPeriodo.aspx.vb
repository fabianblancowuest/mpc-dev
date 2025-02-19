
Partial Class Administracion_rptLoteVentaVendedorPeriodo
    Inherits System.Web.UI.Page

    Protected Sub oddlUltimosPeriodos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlUltimosPeriodos.SelectedIndexChanged
        GridView1.DataBind()
        ogvrptLoteVentaVendedorPeriodoResumen.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        olblVendedorNombre.Text = Session("session_operadorDescripcion").ToString
        olblVendedorCorreo.Text = "  (" + Session("session_operadorCodigo").ToString + ")"
    End Sub
End Class
