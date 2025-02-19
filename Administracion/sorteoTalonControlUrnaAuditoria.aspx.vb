
Partial Class Administracion_sorteoTalonControlUrnauditoria
    Inherits System.Web.UI.Page

    Protected Sub ogvSorteoTalonControlUrnaAuditoria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvSorteoTalonControlUrnaAuditoria.SelectedIndexChanged
        Panel1.Visible = False
        olblidSorteoTalonControlUrnaCabecera.Text = ogvSorteoTalonControlUrnaAuditoria.SelectedDataKey.Item("idSorteoTalonControlUrnaCabecera")
        ogvSorteoTalonControlUrnaCabeceraTrae.DataBind()
        olblAuditor.Text = ogvSorteoTalonControlUrnaAuditoria.SelectedDataKey.Item("Auditor")
        olblfechaControl.Text = ogvSorteoTalonControlUrnaAuditoria.SelectedDataKey.Item("fechaControl")
        PanelAuditoria.Visible = True

    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        PanelAuditoria.Visible = False
        Panel1.Visible = True

    End Sub
End Class
