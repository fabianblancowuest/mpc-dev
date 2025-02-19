
Partial Class Administracion_RECIBOTALONARIOHABILITA
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        reciboTalonarioProximoHabilita()
    End Sub

    Private Sub reciboTalonarioProximoHabilita()
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
                .CommandText = "reciboTalonarioProximoHabilita"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


               
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblidReciboTalonario.Text = reader.Item("id")
                        olblReciboTalonarioCodigo.Text = reader.Item("Codigo")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub

    Private Sub reciboTalonarioHabilita(ByVal idOperador As Integer, ByVal idReciboTalonario As Integer)
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
                .CommandText = "reciboTalonarioHabilita"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = idOperador
                cmd.Parameters.Add("@idReciboTalonario", Data.SqlDbType.Int).SqlValue = idReciboTalonario

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

    Protected Sub obutReciboTalonarioHabilita_Click(sender As Object, e As EventArgs) Handles obutReciboTalonarioHabilita.Click
        reciboTalonarioHabilita(Session("idOperador").ToString, olblidReciboTalonario.Text)
        ogvReciboTalonarioUltimosHabilitadoTrae.DataBind()
        ogvTALONARIOESTADO.DataBind()
        reciboTalonarioProximoHabilita()

    End Sub
End Class
