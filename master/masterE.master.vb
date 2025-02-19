Imports System.Web.UI.HtmlControls
Partial Class INCLUIR_master_masterE


    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/acceso/accesoFueraDeSesionE.aspx")
            olblSession_operador.Text = "Operador: Período de Prueba - Sin Operador"
            olblSession_operadorCorreo.Text = "Delegacion: Sede Central"
            olblSession_menuencurso.Text = " MENU ACCESO OPERADOR UGP ( id " + Session("session_idInstitucion").ToString + ")"

        Else
            If IsPostBack = True Then
            Else
                'olblSession_menuencurso.Text = " MENU ACCESO OPERADOR UGP ( id " + Session("session_idInstitucion").ToString + ")"

                'olblSession_operador.Focus()

                'olblSession_operador.Text = "Operador: " + Session("session_operador").ToString
                'olblSession_operador.Font.Size = 8


                'olblSession_operadorCorreo.Text = "Correo: " + Session("session_institucionUsuarioCorreo").ToString
                'olblSession_operadorCorreo.Font.Size = 8


                'olblSession_institucionCodigo.Text = "Codigo UGP:" + Session("session_institucionCodigo").ToString
                'olblSession_institucionCodigo.Font.Size = 8
                'olblSession_institucionDescripcion.Text = "UGP:" + Session("session_institucionDescripcion")
                'olblSession_institucionDescripcion.Font.Size = 8
                'olblSession_institucionCorreo.Text = "Correo:" + Session("session_institucionCorreo")
                'olblSession_institucionCorreo.Font.Size = 8



            End If

        End If

    End Sub

    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        ' STRSYSTEM.implementacionOperadorObservacionAgrega(Session("session_idOperador"), Session("session_idOperador"), INCLUIR.traerIdRol(Session("session_paginaActual"), "INCLUIR"), otxtIMPLEMENTACIONCOMENTARIO.Text)

    End Sub




    Protected Sub obutLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutLogout.Click
        Session.Clear()

        Response.Redirect("~/loginugp.aspx")

    End Sub

    Protected Sub obutCambiarPass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutCambiarPass.Click
        Response.Redirect("~/passChange.aspx")

    End Sub

    Protected Sub obutMenu_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutMenu.Click
        Response.Redirect("~/ACCESO/ACCESOOPERADORUGPAUTORIZADO.aspx")

    End Sub


End Class

