
Imports System.Web.UI.HtmlControls
Partial Class master_masterH


    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            'Response.Redirect("~/cajaChaco/acceso/accesoFueraDeSesion.aspx")
            'olblSession_operador.Text = "Operador: Período de Prueba - Sin Operador"
            'olblSession_delegacion.Text = "Delegacion: Sede Central"

        Else
            If IsPostBack = True Then
            Else

                'olblSession_operador.Focus()

                'olblSession_operador.Text = "Operador: " + Session("session_operador").ToString
                ''olblSession_operador.Text = Session("session_operadorHojaEstilo").ToString

                'olblSession_delegacion.Text = "Delegacion: " + Session("session_delegacion").ToString

                'olbltitulopagina.Text = Session("session_titulopagina").ToString


            End If

        End If

    End Sub


    'Protected Sub obutvolver_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutvolver.Click
    '    Response.Redirect(Session("session_PaginaVolver"), True)

    'End Sub

    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        cajaChaco.implementacionOperadorObservacionAgrega(Session("session_idOperador"), Session("session_idOperador"), cajaChaco.traerIdRol(Session("session_paginaActual"), "connCaja"), otxtIMPLEMENTACIONCOMENTARIO.Text)

    End Sub

    Protected Sub ogvAreaOperador_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvAreaOperador.SelectedIndexChanged

        'ogvAreaOperador.Visible = False
        'ogvAreaRol.Visible = True
        'ogvAreaRol.DataBind()

    End Sub

    Protected Sub ogvAreaRol_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvAreaRol.SelectedIndexChanged
        'ogvAreaOperador.Visible = False
        'ogvAreaRol.Visible = False
        'Session.Item("session_paginaVolver") = "~/" + Session("session_carpeta") + "/acceso/accesoOperadorAutorizado.aspx"
        'Session.Item("session_paginaActual") = "~/" + Session("session_carpeta") + ogvAreaRol.SelectedDataKey.Item("accesoRolPagina")
        'Response.Redirect(LTrim(RTrim("~/" + Session("session_carpeta") + ogvAreaRol.SelectedDataKey.Item("accesoRolPagina"))).ToString)



    End Sub

    Protected Sub olbMenu1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles olbMenu1.Click
        'If ogvAreaOperador.Visible = False And ogvAreaRol.Visible = False Then
        '    ogvAreaOperador.Visible = True
        'Else
        '    If ogvAreaOperador.Visible = True Then ogvAreaOperador.Visible = False
        '    If ogvAreaOperador.Visible = False And ogvAreaRol.Visible = True Then

        '        ogvAreaOperador.Visible = False
        '        ogvAreaRol.Visible = False

        '    End If


        'End If

    End Sub
End Class

