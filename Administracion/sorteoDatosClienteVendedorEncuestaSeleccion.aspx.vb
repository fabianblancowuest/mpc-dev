
Partial Class Administracion_sorteoDatosClienteVendedorEncuestaSeleccion
    Inherits System.Web.UI.Page

    Protected Sub obutCampaniaGenera_Click(sender As Object, e As EventArgs) Handles obutCampaniaGenera.Click
        obutCampaniaGenera.Visible = False
        obutVolver.Visible = True

        altacampania()

    End Sub


    Private Sub altacampania()

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
                .CommandText = "sorteoDatosClienteVendedorEncuestaSeleccionGeneraCampania"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idSorteoEncuestaOpciones1", Data.SqlDbType.Int).SqlValue = oddlEncuesta1.SelectedValue
                cmd.Parameters.Add("@idSorteoEncuestaOpciones2", Data.SqlDbType.Int).SqlValue = oddlEncuesta2.SelectedValue
                cmd.Parameters.Add("@idSorteoEncuestaOpciones3", Data.SqlDbType.Int).SqlValue = oddlEncuesta3.SelectedValue
                cmd.Parameters.Add("@sorteoDatoClienteCampanaCodigo", Data.SqlDbType.Char).SqlValue = otxtCampaniaCodigo.Text
                cmd.Parameters.Add("@sorteoDatoClienteCampanaDescripcion", Data.SqlDbType.Char).SqlValue = otxtCampaniaDescripcion.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblMensajeValidacion.Text = "Campaña generada exitosamente."
                    End While
                End If
            Catch ex As Exception
                olblMensajeValidacion.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        Response.Redirect("inicioCorrecto.aspx")
    End Sub
End Class
