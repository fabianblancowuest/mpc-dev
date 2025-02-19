
Partial Class Administracion_whatsappValidador
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
                olblMensajeValidacion.Text = ex.Message
            End Try
            connection.Close()
        End Using

        If retorno = 1 Then
            olblWhatsAppValidado.Text = "Telefono validado"
        Else
            olblWhatsAppValidado.Text = "Telefono no verificado"
        End If
        Return retorno

    End Function



    Public Function WhatsAppReenviaPin(ByVal WhatsApp As String) As Integer
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
                .CommandText = "WhatsAppReenviaPin"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@contactoValor", Data.SqlDbType.Text).SqlValue = WhatsApp





                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionCodigo")

                    End While
                End If
            Catch ex As Exception
                olblMensajeValidacion.Text = ex.Message
            End Try
            connection.Close()
        End Using


        Return retorno

    End Function



    Protected Sub obutWhtsAppReenvioPin_Click(sender As Object, e As EventArgs) Handles obutWhatsAppReenvioPin.Click
        WhatsAppReenviaPin(otxtWhatsApp.Text)
    End Sub

    Protected Sub otxtWhatsApp_TextChanged(sender As Object, e As EventArgs) Handles otxtWhatsApp.TextChanged, otxtWhatsApp.DataBinding, otxtWhatsApp.Disposed
        WhatsAppValidar()



    End Sub

    Protected Sub obutWhatsAppValidar_Click(sender As Object, e As EventArgs) Handles obutWhatsAppValidar.Click
        WhatsAppValidar()
    End Sub

    Protected Sub WhatsAppValidar()
        Dim WhatsAppValidado As Integer
        WhatsAppValidado = contactoValidacionCheck(1, otxtWhatsApp.Text)

        If WhatsAppValidado = 0 Then
            PanelValidaWhatsApp.Visible = True
        Else
            PanelValidaWhatsApp.Visible = False
            obutWhatsAppValidar.Visible = False
        End If
    End Sub

    Private Sub chequeaWhatsApp()
        If WhatsAppPinValidar(otxtWhatsApp, otxtWhatsAppPin) = 1 Then
            PanelValidaWhatsApp.Visible = False

            olblWhatsAppValidado.Text = "1"
        Else
            PanelValidaWhatsApp.Visible = True
            olblWhatsAppValidado.Text = "0"

        End If
    End Sub

    Private Function WhatsAppPinValidar(ByVal WhatsApp As TextBox, ByVal pinAValidar As TextBox) As Integer
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
                .CommandText = "WhatsAppValidarPin"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@contactoValor", Data.SqlDbType.Text).SqlValue = WhatsApp.Text
                cmd.Parameters.Add("@contactoPin", Data.SqlDbType.Text).SqlValue = "0" + LTrim(RTrim(pinAValidar.Text))



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionCodigo")
                        olblWhatsAppVerificado.Text = reader("gestionDescripcion").ToString
                    End While
                End If
            Catch ex As Exception
                olblMensajeValidacion.Text = ex.Message
            End Try
            connection.Close()
        End Using


        Return retorno





    End Function


    Public Function WhatsAppValidado() As String
        Return otxtWhatsApp.Text


    End Function


    Public Function whatsappValidadoCodigo() As String
        chequeaWhatsApp()
        Return olblWhatsAppValidado.Text


    End Function

    Protected Sub obutWhatsAppVerifica_Click(sender As Object, e As EventArgs) Handles obutWhatsAppVerifica.Click

        WhatsAppValidar()


    End Sub



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
