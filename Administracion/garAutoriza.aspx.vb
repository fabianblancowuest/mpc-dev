
Partial Class Administracion_garAutoriza
    Inherits System.Web.UI.Page

    Protected Sub ogvGARAutoriza_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvGARAutoriza.SelectedIndexChanged
        PanelSelecciona.Visible = False
        PanelAutoriza.Visible = True

        olblIdGar.Text = ogvGARAutoriza.SelectedDataKey.Item("idGar")
        olblGarSolicitudDescripcion.Text = ogvGARAutoriza.SelectedDataKey.Item("garSolicitudDescripcion")
        olblOperadorSolicitante.Text = ogvGARAutoriza.SelectedDataKey.Item("operadorDescripcion")
        olblGarSolicitudMonto.Text = ogvGARAutoriza.SelectedDataKey.Item("garSolicitudMonto")
        otxtGarAutorizaMonto.Text = ogvGARAutoriza.SelectedDataKey.Item("garSolicitudMonto")
    End Sub

    Protected Sub orbOpciones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbOpciones.SelectedIndexChanged
        If orbOpciones.SelectedValue = "0" Then
            PanelRechazo.Visible = False
            obutGarAutorizacionAbandona.Visible = False
            obutGarAutorizacionConfirma.Visible = False
            otxtGarRechazo.Enabled = False
            otxtGarAutorizaMonto.Enabled = True
            olblMensajePrevio.Visible = False


        End If

        If orbOpciones.SelectedValue = "1" Then
            PanelRechazo.Visible = False
            obutGarAutorizacionAbandona.Visible = True
            obutGarAutorizacionConfirma.Visible = True
            otxtGarRechazo.Text = "Aprobado"
            otxtGarRechazo.Enabled = False
            otxtGarAutorizaMonto.Enabled = False
            olblMensajePrevio.Text = "Operacion solicitada por " + otxtGarAutorizaMonto.Text + " será autorizada."
            olblMensajePrevio.Visible = True

        End If


        If orbOpciones.SelectedValue = "2" Then
            PanelRechazo.Visible = True
            obutGarAutorizacionAbandona.Visible = True
            obutGarAutorizacionConfirma.Visible = True
            otxtGarRechazo.Text = ""
            otxtGarRechazo.Enabled = True

            otxtGarAutorizaMonto.Enabled = False
            olblMensajePrevio.Text = "Operacion solicitada por " + olblGarSolicitudMonto.Text + " será rechazada."
            olblMensajePrevio.Visible = True
        End If
    End Sub

    Protected Sub obutGarAutorizacionAbandona_Click(sender As Object, e As EventArgs) Handles obutGarAutorizacionAbandona.Click
        PanelSelecciona.Visible = True
        ogvGARAutoriza.DataBind()
        PanelAutoriza.Visible = False



    End Sub

    Protected Sub obutGarAutorizacionConfirma_Click(sender As Object, e As EventArgs) Handles obutGarAutorizacionConfirma.Click
        garAutoriza()

    End Sub

    Private Sub garAutoriza()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "garAutorizaAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = 2
                cmd.Parameters.Add("@idGar", Data.SqlDbType.Int).SqlValue = olblIdGar.Text
                cmd.Parameters.Add("@garAutorizacionMonto", Data.SqlDbType.Float).SqlValue = otxtGarAutorizaMonto.Text.Replace(".", ",")
                cmd.Parameters.Add("@garRechazo", Data.SqlDbType.Text).SqlValue = otxtGarRechazo.Text
                cmd.Parameters.Add("@garEstado", Data.SqlDbType.Int).SqlValue = orbOpciones.SelectedValue

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")

                    End While
                End If
            Catch ex As Exception

                olblGestionDescripcion.Text = ex.Message


            End Try
            connection.Close()
        End Using
        ogvGARAutoriza.DataBind()

        PanelAutoriza.Visible = False
        PanelSelecciona.Visible = True
 
    End Sub
End Class
