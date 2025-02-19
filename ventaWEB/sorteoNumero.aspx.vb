
Partial Class ventaWEB_sorteoNumero
    Inherits System.Web.UI.Page
    Public Sub talonVendedorToma()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim sorteoTalonTomado As CheckBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""
        olblBilletesSeleccionadosCantidad.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorActualizaWEB"
            End With


            For Each Row In ogvSorteoTalonVendedorVenta.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    sorteoTalonTomado = CType(Row.FindControl("ochSorteoTalonTomado"), CheckBox)
                    If sorteoTalonTomado.Checked = True Then
                        olblBilletesSeleccionadosCantidad.Text = (Val(olblBilletesSeleccionadosCantidad.Text) + 1).ToString

                    End If


                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                    cmd.Parameters.Add("@sorteoTalonTomado", Data.SqlDbType.Int).SqlValue = sorteoTalonTomado.Checked
                    cmd.Parameters.Add("@sorteoTalonSession", Data.SqlDbType.Char).SqlValue = Session.SessionID





                    reader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read
                            olblGestionCodigo.text = reader.Item("gestionCodigo")
                            olblGestionDescripcion.Text = reader.Item("gestionDescripcion")

                            If RTrim(LTrim(olblGestionCodigo.Text)) = "0" Then

                                If sorteoTalonTomado.Checked = True Then
                                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " - " + reader.Item("gestionDescripcion").ToString

                                End If

                            End If



                        End While
                    End If

                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using
        If olblBilletesSeleccionadosCantidad.Text = "1" Then
            olblBilletesSeleccionados.Text = " billete seleccionado"
        Else
            olblBilletesSeleccionados.Text = " billetes seleccionados"
        End If


        If Val(olblBilletesSeleccionadosCantidad.Text) > 0 Then
           

        Else
           
        End If
        ogvSorteoTalonVendedorVenta.DataBind()






    End Sub

End Class
