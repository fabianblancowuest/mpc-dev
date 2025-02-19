
Imports System.IO
Partial Class administracion_generaInforme
    Inherits System.Web.UI.Page


    Public Function armarquilombo(ByVal informe As String, ByVal idHistoriaClinica As String) As String

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
                .CommandText = "rptSorteoVendedorPeriodo"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = 37

                cmd.Parameters.Add("@fechaDesde", Data.SqlDbType.DateTime).SqlValue = "01/02/2024"


                cmd.Parameters.Add("@fechaHasta", Data.SqlDbType.DateTime).SqlValue = "28/02/2024"




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        retorno = reader.Item("gestionDescripcion")
                        pagina = reader.Item("gestionPagina")
                    End While
                End If
            Catch ex As Exception
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

            otxtINFORMEFECHA.Attributes.Add("readonly", "readonly")
            otxtINFORMEFECHA.Text = Left(Date.Today.ToString, 10)


        End If

    End Sub

    Protected Sub orbInforme_SelectedIndexChanged(sender As Object, e As EventArgs) Handles orbInforme.SelectedIndexChanged
        armarquilombo(orbInforme.SelectedValue, Session("session_idHistoriaClinica"))
    End Sub

    
    Protected Sub obutFormatoImpresion_Click(sender As Object, e As EventArgs) Handles obutFormatoImpresion.Click
        PanelSeleccion.Visible = False

    End Sub

    Protected Sub otxtINFORMEFECHA_TextChanged(sender As Object, e As EventArgs) Handles otxtINFORMEFECHA.TextChanged
        armarquilombo(orbInforme.SelectedValue, Session("session_idHistoriaClinica"))
    End Sub

    Protected Sub obutINFORMEFECHAPopup_Click(sender As Object, e As EventArgs) Handles obutINFORMEFECHAPopup.Click
        armarquilombo(orbInforme.SelectedValue, Session("session_idHistoriaClinica"))
    End Sub
End Class
