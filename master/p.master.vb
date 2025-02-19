
Partial Class master_p
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idOperador") Is Nothing Then


            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")

        Else
          
            olblSession_operadorDescripcion.Text = Session("session_operadorDescripcion")
            ' + " (" + LTrim(RTrim(Session("session_operadorCodigo"))) + ")"
            olblSession_operadorCodigo.Text = Session("session_operadorCodigo")
            olblSession_empresa.Text = Session("empresaDescripcion")
            olblSession_empresaSucursalSector.Text = Session("empresaSucursalDescripcion") + " - " + Session("empresaSectorDescripcion")
        End If

    End Sub



End Class




