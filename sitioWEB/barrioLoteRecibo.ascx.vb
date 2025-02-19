
Partial Class sitioWEB_barrioLoteRecibo

    Inherits System.Web.UI.UserControl
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Public Sub imponeBarrioLote(ByVal idBarrioLote As Integer)
        olblIdBarrioLote.Text = idBarrioLote.ToString
        ogvbarrioLoteReciboTrae.DataBind()

    End Sub

    Public Function barrioLotePagosCuentaAdhesion(ByVal idBarrioLote As Integer) As String
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "barrioLoteReciboSuma"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idBarrioLote", Data.SqlDbType.Int).SqlValue = idBarrioLote


                reader = cmd.ExecuteReader
                While reader.Read
                    olblBarrioLoteReciboSuma.Text = reader.Item("barrioLoteReciboSuma").ToString

                End While

            Catch ex As Exception
                olblBarrioLoteReciboSuma.Text = ex.Message



            End Try
            connection.Close()
        End Using

        Return olblBarrioLoteReciboSuma.Text

    End Function



End Class
