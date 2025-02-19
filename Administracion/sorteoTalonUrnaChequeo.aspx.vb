
Partial Class Administracion_sorteoTalonUrnaChequeo
    Inherits System.Web.UI.Page


    Protected Sub obutAuditoriaGraba_Click(sender As Object, e As EventArgs) Handles obutAuditoriaGraba.Click

        refresca()

    End Sub

    Private Sub refresca()
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
                .CommandText = "sorteoTalonControlUrnaAltaCabecera"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblidSorteoTalonControlUrnaCabecera.Text = reader.Item("idSorteoTalonControlUrnaCabecera").ToString

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
                .CommandText = "sorteoTalonControlUrnaAltaNovedad"
            End With


            For Each Row In ogvSorteoTalonNoRendido.Rows


                'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                idSorteoTalon = CType(Row.FindControl("olblIDSorteoTalon"), Label)
                IdEstado = CType(Row.FindControl("olblIdEstado"), Label)

                oddlEstado = CType(Row.FindControl("oddlEstado"), DropDownList)


                If oddlEstado.SelectedValue <> 1 And IdEstado.Text <> oddlEstado.SelectedValue.ToString Then


                    Try
                        cmd.Parameters.Clear()
                        connection.Open()
                        cmd.Parameters.Add("@idSorteoTalonControlUrnaCabecera", Data.SqlDbType.Int).SqlValue = olblidSorteoTalonControlUrnaCabecera.Text
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

    Protected Sub obutAuditoriaNueva_Click(sender As Object, e As EventArgs) Handles obutAuditoriaNueva.Click
        altacabecera()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If olblidSorteoTalonControlUrnaCabecera.Text = "0" Then
            ogvSorteoTalonNoRendido.Enabled = False
        Else
            ogvSorteoTalonNoRendido.Enabled = True

        End If
    End Sub

    Protected Sub obutTraer_Click(sender As Object, e As EventArgs) Handles obutTraer.Click
        refresca()
    End Sub

    Protected Sub otxtBilleteDesde_TextChanged(sender As Object, e As EventArgs) Handles otxtBilleteDesde.TextChanged
        refresca()

    End Sub
End Class