
Partial Class Administracion_rptRAD
    Inherits System.Web.UI.Page
    Private Sub actualizaDatos()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer


        ' olblMensajeActualizaDatos.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "rptMinutaFecha"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@fecha", Data.SqlDbType.DateTime).SqlValue = oddlFechaDesde.SelectedItem.ToString
                cmd.Parameters.Add("@fechaHasta", Data.SqlDbType.DateTime).SqlValue = oddlFechaHasta.SelectedItem.ToString
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        'olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        'olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                        'olblMensajeActualizaDatos.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                'olblMensajeActualizaDatos.Text = "Error al ejecutar rptloteVentaLlamadaGestion   " + ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub oddlFechaDesde_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaDesde.SelectedIndexChanged
        actualizaDatos()
        ogvrptMinutaFecha.DataBind()

    End Sub

    Protected Sub oddlFechaHasta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaHasta.SelectedIndexChanged
        actualizaDatos()
        ogvrptMinutaFecha.DataBind()


    End Sub

    Protected Sub obutRADActualizaPeriodo_Click(sender As Object, e As EventArgs) Handles obutRADActualizaPeriodo.Click
        actualizaDatos()
        ogvrptMinutaFecha.DataBind()

    End Sub
End Class
