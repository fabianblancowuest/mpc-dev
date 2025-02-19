
Partial Class acceso
    Inherits System.Web.UI.Page

    Protected Sub obutAccesocorrectoLogout_Click(sender As Object, e As EventArgs) Handles obutAccesocorrectoLogout.Click
        PanelAcceso.Visible = False
        Session.Clear()
        'otxtUsuario.Text = ""
        'otxtPass.Text = ""
        PanelCredenciales.Visible = True

    End Sub

    Protected Sub obutAcceder_Click(sender As Object, e As EventArgs) Handles obutAcceder.Click
        Session.Item("operadorUsuario") = otxtUsuario.Text
        Session.Item("operadorPass") = otxtPass.Text

        ogvOperadorAcceso.DataBind()
        ogvOperadorAcceso.SelectedIndex = 0
        Session.Item("idOperador") = ogvOperadorAcceso.SelectedDataKey.Item("idOperador")
        Session.Item("session_operadorCodigo") = ogvOperadorAcceso.SelectedDataKey.Item("operadorCodigo")
        Session.Item("session_operadorDescripcion") = ogvOperadorAcceso.SelectedDataKey.Item("operadorDescripcion")

        If Session("idOperador") = 0 Then
            olblAccesoMensaje.Text = "Las credenciales ingresadas no corresponde a ningún usuario. Vuelva a intentarlo."
        Else
            olblAccesoMensaje.Text = ""
            PanelCredenciales.Visible = False

            PanelAcceso.Visible = True
            ogvOperadorAcceso.DataBind()

            ogvAccesoOperadorAccesoCorrecto.DataBind()
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else

        End If
    End Sub

    Protected Sub ogvAccesoOperadorAccesoCorrecto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvAccesoOperadorAccesoCorrecto.SelectedIndexChanged
        Session.Item("session_conexion") = "STRSYSTEM"
        Session.Item("session_idOperador") = Session("idOperador")
        Session.Item("idEmpresaOperador") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("idEmpresaOperador")
        Session.Item("empresaCodigo") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaCodigo")
        Session.Item("empresaDescripcion") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaDescripcion")
        Session.Item("empresaSucursalCodigo") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaSucursalCodigo")
        Session.Item("empresaSucursalDescripcion") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaSucursalDescripcion")
        Session.Item("empresaSectorCodigo") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaSectorCodigo")
        Session.Item("empresaSectorDescripcion") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("empresaSectorDescripcion")
        Session.Item("Roles") = ogvAccesoOperadorAccesoCorrecto.SelectedDataKey.Item("Roles")
        Response.Redirect("~/administracion/inicioCorrecto.aspx")
    End Sub
End Class
