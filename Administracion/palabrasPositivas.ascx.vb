
Partial Class Administracion_palabrasPositivas
    Inherits System.Web.UI.UserControl

    Protected Sub otxtPalabrasPositivas_TextChanged(sender As Object, e As EventArgs) Handles otxtPalabrasPositivas.TextChanged

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            cargarPalabrasPositivas()

        End If
    End Sub


    Private Sub cargarPalabrasPositivas()
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
                .CommandText = "palabrasPositivasTraer"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                      reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        otxtPalabrasPositivas.Text = reader.Item("palabrasPositivas")
                    End While
                End If
            Catch ex As Exception
                otxtPalabrasPositivas.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutMostrar_Click(sender As Object, e As EventArgs) Handles obutMostrar.Click
        If otxtPalabrasPositivas.Visible = False Then
            otxtPalabrasPositivas.Visible = True
            obutMostrar.Text = "Ocultar palabras positivas."
        Else
            otxtPalabrasPositivas.Visible = False
            obutMostrar.Text = "Mostrar palabras positivas."
        End If
    End Sub
End Class
