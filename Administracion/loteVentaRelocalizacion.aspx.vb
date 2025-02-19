
Partial Class Administracion_loteVentaRelocalizacion
    Inherits System.Web.UI.Page

    Protected Sub oddlBARRIOLOTEOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOLOTEOperador.SelectedIndexChanged

        If oddlBARRIOLOTEOperador.SelectedValue.ToString = "0" Then
            PanelDestino.Visible = False

        Else
            olblIDLoteVenta.Text = oddlBARRIOLOTEOperador.SelectedValue.ToString
            PanelDestino.Visible = True

        End If


    End Sub

    Protected Sub oddlBarrioHabilitadoSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoSelecciona.SelectedIndexChanged
        PanelRelocalizacion.Visible = False
        olblSeleccionBarrio.Text = oddlBarrioHabilitadoManzanaSelecciona.SelectedValue.ToString
        If oddlBarrioHabilitadoManzanaSelecciona.SelectedValue.ToString = "0" Then
            PanelOrigen.Visible = False
            PanelDestino.Visible = False

        Else
            PanelOrigen.Visible = True
            PanelDestino.Visible = False

        End If
    End Sub

    Protected Sub oddlBarrioHabilitadoManzanaSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoManzanaSelecciona.SelectedIndexChanged
        PanelRelocalizacion.Visible = False

    End Sub

    Protected Sub obutRetorna_Click(sender As Object, e As EventArgs) Handles obutRetorna.Click
        Response.Redirect("loteVentaRelocalizacion.aspx")
    End Sub



    Private Sub loteVentaRelocalizaConfirma()
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
                .CommandText = "loteVentaRelocalizaConfirma"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")

                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLoteVenta.Text

                cmd.Parameters.Add("@idBarrioLoteDestino", Data.SqlDbType.Int).SqlValue = olblIdBarrioLoteDestino.Text


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
            obutRelocalizaVenta.Visible = False
            connection.Close()
        End Using
    End Sub

    Protected Sub odsbarrioManzanaLoteReubica_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles odsbarrioManzanaLoteReubica.Selecting

    End Sub

    Protected Sub oddlBarrioManzanaLoteReubica_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaLoteReubica.SelectedIndexChanged
        olblIdBarrioLoteDestino.Text = oddlBarrioManzanaLoteReubica.SelectedValue.ToString

        PanelRelocalizacion.Visible = True

        MensajePreRelocaliza()

    End Sub


    Private Sub MensajePreRelocaliza()
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
                .CommandText = "loteVentaRelocaliza"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                
                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLoteVenta.Text

                cmd.Parameters.Add("@idBarrioLoteDestino", Data.SqlDbType.Int).SqlValue = olblIdBarrioLoteDestino.Text

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblMensajePreRelocaliza.Text = reader.Item("descripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutRelocalizaVenta_Click(sender As Object, e As EventArgs) Handles obutRelocalizaVenta.Click
        loteVentaRelocalizaConfirma()

    End Sub

    Protected Sub obutNuevaRelocalizacion_Click(sender As Object, e As EventArgs) Handles obutNuevaRelocalizacion.Click
        PanelUltimasRelocalizaciones.Visible = False
        PanelNuevaRelocalizacion.Visible = True

    End Sub
End Class
