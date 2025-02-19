
Partial Class Administracion_rptSorteoVendedorPeriodo
    Inherits System.Web.UI.Page
    Public Function armaReporteVenta(ByVal informe As Integer) As String

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


        obutReporte.Text = oddlFechaDesde.SelectedItem.ToString


        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "rptSorteoVendedorPeriodo"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")

                cmd.Parameters.Add("@fechaDesde", Data.SqlDbType.DateTime).SqlValue = oddlFechaDesde.SelectedItem.ToString





                cmd.Parameters.Add("@fechaHasta", Data.SqlDbType.DateTime).SqlValue = otxtFechaHasta.Text






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

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack Then
        Else


            oddlFechaDesde.DataBind()
            oddlFechaHasta.DataBind()


            otxtFechaDesde.Text = Left(oddlFechaDesde.SelectedItem.ToString, 10)
            otxtFechaHasta.Text = Left(oddlFechaHasta.SelectedItem.ToString, 10)

        End If


    End Sub

    Protected Sub oddlFechaDesde_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaDesde.SelectedIndexChanged
        otxtFechaDesde.Text = Left(oddlFechaDesde.SelectedItem.ToString, 10)

    End Sub

    Protected Sub oddlFechaHasta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlFechaHasta.SelectedIndexChanged
        otxtFechaHasta.Text = Left(oddlFechaHasta.SelectedItem.ToString, 10)

    End Sub
End Class
