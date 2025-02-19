
Partial Class Administracion_correoElectronicoValidador
    Inherits System.Web.UI.UserControl
    Private Function contactoValidacionCheck(ByVal idContactoValidacionTipo As Integer, ByVal contactoValor As String) As Integer

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeValidacion.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "contactoValidacionCheck"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idContactoValidacionTipo", Data.SqlDbType.Int).SqlValue = idContactoValidacionTipo
                cmd.Parameters.Add("@contactoValor", Data.SqlDbType.Text).SqlValue = contactoValor




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionCodigo")

                        olblMensajeValidacion.Text = reader.Item("gestionDescripcion")

                    End While
                End If
            Catch ex As Exception
                olblClienteCorreoElectronico.Text = ex.Message
            End Try
            connection.Close()
        End Using

        If retorno = 1 Then

            If idContactoValidacionTipo = 1 Then
                olblClienteCorreoElectronico.Text = "Telefono"
            End If


            If idContactoValidacionTipo = 2 Then
                olblClienteCorreoElectronico.Text = "Correo electronico (VERIFICADO)"
            End If

        Else
            If idContactoValidacionTipo = 1 Then
                olblClienteCorreoElectronico.Text = "Telefono (NO VERIFICADO)"
            End If


            If idContactoValidacionTipo = 2 Then
                olblClienteCorreoElectronico.Text = "Correo electronico "
            End If



        End If
        Return retorno

    End Function



    Public Function contactoCorreoReenviaPin(ByVal correoElectronico As String) As Integer
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeValidacion.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "contactoCorreoReenviaPin"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@contactoValor", Data.SqlDbType.Text).SqlValue = correoElectronico




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionCodigo")

                    End While
                End If
            Catch ex As Exception
                olblClienteCorreoElectronico.Text = ex.Message
            End Try
            connection.Close()
        End Using


        Return retorno

    End Function



    Protected Sub obutClienteCorreoValidarReenvioPin_Click(sender As Object, e As EventArgs) Handles obutClienteCorreoValidarReenvioPin.Click
        contactoCorreoReenviaPin(otxtClienteCorreoElectronico.Text)
    End Sub

    Protected Sub otxtClienteCorreoElectronico_TextChanged(sender As Object, e As EventArgs) Handles otxtClienteCorreoElectronico.TextChanged, otxtClienteCorreoElectronico.DataBinding, otxtClienteCorreoElectronico.Disposed
        correoValidar()



    End Sub

    Protected Sub obutClienteCorreoValidar_Click(sender As Object, e As EventArgs) Handles obutClienteCorreoValidar.Click
        chequeaCorreo()


    End Sub

    Protected Sub correoValidar()
        Dim correoValidado As Integer
        correoValidado = contactoValidacionCheck(2, otxtClienteCorreoElectronico.Text)

        If correoValidado = 0 Then
            PanelValidaCorreo.Visible = True
        Else
            PanelValidaCorreo.Visible = False
        End If
    End Sub

    Private Sub chequeaCorreo()
        If correoElectronicoPinValidar(otxtClienteCorreoElectronico, otxtClienteCorreoElectronicoPin) = 1 Then
            PanelValidaCorreo.Visible = False
            olblCorreoElectronicoValidado.Text = "0"
        Else
            PanelValidaCorreo.Visible = True
            olblCorreoElectronicoValidado.Text = "0"

        End If
    End Sub

    Private Function correoElectronicoPinValidar(ByVal correoElectronico As TextBox, ByVal pinAValidar As TextBox) As Integer
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeValidacion.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "contactoCorreoValidarPin"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@contactoValor", Data.SqlDbType.Text).SqlValue = correoElectronico.Text
                cmd.Parameters.Add("@contactoPin", Data.SqlDbType.Text).SqlValue = "0" + LTrim(RTrim(pinAValidar.Text))



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionCodigo")
                        olblclienteCorreoElectronicoVerificado.Text = reader("gestionDescripcion").ToString
                    End While
                End If
            Catch ex As Exception
                olblclienteCorreoElectronicoVerificado.Text = ex.Message
            End Try
            connection.Close()
        End Using


        Return retorno





    End Function


    Public Function correoValidado() As String
        Return otxtClienteCorreoElectronico.Text


    End Function


    Public Function correoValidadoCodigo() As String
        Return olblCorreoElectronicoValidado.Text


    End Function

    Protected Sub obutCorreoVerifica_Click(sender As Object, e As EventArgs) Handles obutCorreoVerifica.Click

        correoValidar()


    End Sub



End Class
