
Partial Class Administracion_sorteoTalonNoRendido
    Inherits System.Web.UI.Page

    Protected Sub obutAuditoriaGraba_Click(sender As Object, e As EventArgs) Handles obutAuditoriaGraba.Click
        altaCabecera()
        grabar()
        ogvSorteoTalonNoRendido.DataBind()

    End Sub


    Private Sub altacabecera()
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
                .CommandText = "sorteoTalonControlOperadorAltaCabecera"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                    reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblidSorteoTalonControlOperadorCabecera.Text = reader.Item("idSorteoTalonControlOperadorCabecera").ToString

                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
    Private Sub grabar()


        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim oddlEstado As DropDownList
        Dim IdEstado As Label

        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonControlOperadorAltaNovedad"
            End With


            For Each Row In ogvSorteoTalonNoRendido.Rows


                'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                idSorteoTalon = CType(Row.FindControl("olblIDSorteoTalon"), Label)
                IdEstado = CType(Row.FindControl("olblIdEstado"), Label)

                oddlEstado = CType(Row.FindControl("oddlEstado"), DropDownList)


                If (oddlEstado.SelectedValue <> 1 And IdEstado.Text <> oddlEstado.SelectedValue.ToString) Or 1 = 1 Then


                    Try
                        cmd.Parameters.Clear()
                        connection.Open()
                        cmd.Parameters.Add("@idSorteoTalonControlOperadorCabecera", Data.SqlDbType.Int).SqlValue = olblidSorteoTalonControlOperadorCabecera.Text
                        cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = oddlOperador.SelectedValue

                        cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                        cmd.Parameters.Add("@idSorteoTalonControlOperadorNovedad", Data.SqlDbType.Int).SqlValue = oddlEstado.SelectedValue




                        reader = cmd.ExecuteReader()


                    Catch ex As Exception
                        olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                    End Try
                    connection.Close()
                End If



                fila = fila + 1

            Next
        End Using



    End Sub
End Class
