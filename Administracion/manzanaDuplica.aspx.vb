
Partial Class Administracion_manzanaDuplica
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            oddlManzanaOrigen.DataBind()
            oddlManzanaDestino.DataBind()

        End If
    End Sub

    Protected Sub obutDuplica_Click(sender As Object, e As EventArgs) Handles obutDuplica.Click
        duplicar()

    End Sub
    Private Sub duplicar()
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
                .CommandText = "barrioManzanaDuplicaLotesAccion"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idBarrioManzanaOrigen", Data.SqlDbType.Int).SqlValue = oddlManzanaOrigen.SelectedValue
                cmd.Parameters.Add("@idBarrioManzanaDestino", Data.SqlDbType.Int).SqlValue = oddlManzanaDestino.SelectedValue


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
            connection.Close()
        End Using
        oddlManzanaDestino.DataBind()
        oddlManzanaOrigen.DataBind()
        ogvbarrioManzanaDuplicaTestigoUltimos.DataBind()

    End Sub
End Class
