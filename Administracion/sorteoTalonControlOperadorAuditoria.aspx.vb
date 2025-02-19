
Partial Class Administracion_sorteoTalonControlOperadorAuditoria
    Inherits System.Web.UI.Page

    Protected Sub ogvSorteoTalonControlOperadorAuditoria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSorteoTalonControlOperadorAuditoria.SelectedIndexChanged
        Panel1.Visible = False
        olblidSorteoTalonControlOperadorCabecera.Text = ogvSorteoTalonControlOperadorAuditoria.SelectedDataKey.Item("idSorteoTalonControlOperadorCabecera")
        ogvSorteoTalonControlOperadorCabeceraTrae.DataBind()
        olblAuditor.Text = ogvSorteoTalonControlOperadorAuditoria.SelectedDataKey.Item("Auditor")
        olblVendedor.Text = ogvSorteoTalonControlOperadorAuditoria.SelectedDataKey.Item("Vendedor")
        olblfechaControl.Text = ogvSorteoTalonControlOperadorAuditoria.SelectedDataKey.Item("fechaControl")
        PanelAuditoria.Visible = True

    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        PanelAuditoria.Visible = False
        Panel1.Visible = True

    End Sub
End Class
