
Partial Class Administracion_loteVentaLiberacion
    Inherits System.Web.UI.Page

    Protected Sub oddlBARRIOLOTEOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOLOTEOperador.SelectedIndexChanged
        PanelLiberacion.Visible = True

        olblIDLoteVenta.Text = oddlBARRIOLOTEOperador.SelectedValue.ToString

    End Sub

    Protected Sub oddlBarrioHabilitadoSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoSelecciona.SelectedIndexChanged
        PanelLiberacion.Visible = False
        olblGestionDescripcion.Text = ""
    End Sub

    Protected Sub oddlBarrioHabilitadoManzanaSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoManzanaSelecciona.SelectedIndexChanged
        PanelLiberacion.Visible = False

    End Sub

    Protected Sub obutRetorna_Click(sender As Object, e As EventArgs) Handles obutRetorna.Click
        Response.Redirect("loteVentaLiberacion.aspx")
    End Sub

    Protected Sub obutLiberaLote_Click(sender As Object, e As EventArgs) Handles obutLiberaLote.Click
        loteVentaLibera()


    End Sub

    Private Sub loteVentaLibera()
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
                .CommandText = "loteLiberaAdhesion"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")

                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLoteVenta.Text
                         reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutNuevaLiberacion_Click(sender As Object, e As EventArgs) Handles obutNuevaLiberacion.Click
        If obutNuevaLiberacion.Text = "Nueva Liberacion" Then
            obutNuevaLiberacion.Text = "Ultimas Liberaciones"
            PanelNuevaLiberacion.Visible = True
            ogvloteVentaUltimasLiberaciones.Visible = False
            olblVistaTipo.Text = "Usted seleccionó Liberar Lote"

        Else
            obutNuevaLiberacion.Text = "Nueva Liberacion"
            PanelNuevaLiberacion.Visible = False
            ogvloteVentaUltimasLiberaciones.Visible = True
            olblVistaTipo.Text = "Usted esta en la vista de Lotes Liberados"
        End If

        
    End Sub
End Class
