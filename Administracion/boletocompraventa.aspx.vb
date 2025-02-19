
Partial Class Administracion_boletoCompraVenta
    Inherits System.Web.UI.Page
    Public Function armaReporteVenta() As String

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As String
        Dim pagina As String

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("strsystem")
        Dim connectionString As String = Settings.ConnectionString
        retorno = ""
        pagina = ""


     
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "boletoCompraVentaLosBufalos"

                .Parameters.Clear()
            End With
            Try
                connection.Open()
                'ID, manzana, parcela, apellido, , , , , , , , , , , fecha, ,
                cmd.Parameters.Add("@BarrioManzana", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("manzanaAsignada")
                cmd.Parameters.Add("@ManzanaLote", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("parcelaAsignada")
                cmd.Parameters.Add("@CompradorAPYNOM", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("apellido")

                cmd.Parameters.Add("@CompradorDNI", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("dni")

                cmd.Parameters.Add("@CompradorDomicilio", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("domicilio")

                cmd.Parameters.Add("@ParcelaSuperficieMetros2", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("superficie")

                cmd.Parameters.Add("@precioTotalPesos", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("precioTotalPesos")

                cmd.Parameters.Add("@precioTotalPesosEnLetras", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("precioTotalPesosLetras")

                cmd.Parameters.Add("@precioTotalBC", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("precioTotalBC")

                cmd.Parameters.Add("@precioTotalBCEnLetras", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("precioTotalBCLetras")

                cmd.Parameters.Add("@cuotasCantidadTotal", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("cuotasCantidad")

                cmd.Parameters.Add("@cuotaMontoPesos", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("cuotaMontoPesos")

                cmd.Parameters.Add("@cuotaBC", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("cuotaBC")

                cmd.Parameters.Add("@ddContrato", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("ddContrato")


                cmd.Parameters.Add("@mmContrato", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("mmContrato")

                cmd.Parameters.Add("@aaaaContrato", Data.SqlDbType.Text).SqlValue = gv.SelectedDataKey.Item("aaaaContrato")








                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionDescripcion")
                        pagina = reader.Item("gestionPagina")
                    End While
                End If
            Catch ex As Exception
                obutReporte.Text = ex.Message

            End Try
            connection.Close()
        End Using

        'Dim mydocpath As String = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)

        ' Append text to an existing file named "WriteLines.txt".
        'Using outputFile As New StreamWriter(Convert.ToString("C:\desarollo\inetAnt\CEMMI_SI\dato\informeHC_new.aspx"), False)
        'outputFile.WriteLine(pagina)
        'End Using

        Return retorno

    End Function

   
    Protected Sub obutReporte_Click(sender As Object, e As EventArgs) Handles obutReporte.Click
        obutReporte.Visible = False

    End Sub

   
    Protected Sub gv_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv.SelectedIndexChanged
        gv.Visible = False
        obutReporte.Visible = False
        armaReporteVenta()

    End Sub
End Class
