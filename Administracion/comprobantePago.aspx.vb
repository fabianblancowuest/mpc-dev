
Partial Class Administracion_comprobantePago
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        olblComprobanteNumero.Text = Session("idAsientoCabecera").ToString
        cargarDatos()

    End Sub



    Private Sub cargarDatos()
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
                .CommandText = "pagoComprobanteDatos"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idAsientoCabecera", Data.SqlDbType.Int).SqlValue = olblComprobanteNumero.Text

                  reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblComprobanteConfeccionFecha.Text = reader.Item("asientoCabeceraFechaConfeccion")
                        olblComprobanteconfeccionOperador.Text = reader.Item("operadorDescripcion")
                        olblEmpresa.Text = reader.Item("empresaCodigo") + " - " + reader.Item("empresaDescripcion")
                        olblSucursal.Text = reader.Item("empresaSucursalDescripcion")
                        olblPagoMontoImporteNumero.Text = reader.Item("montoPago")
                        olblPagoMontoImporteLetras.Text = reader.Item("montoLetras")
                        olblPagoDestinatario.Text = reader.Item("persona")



                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class
