
Partial Class Administracion_grabacionAuditorSube
    Inherits System.Web.UI.Page
    
    Private Sub verificaAuditor()
        If Session("idAccesoRol") = 3097 Then

            'Accedio vendedor'


            oddlVendedor.SelectedValue = Session("idOperador")
            oddlVendedor.Enabled = False
            obutGrabacionNueva.Visible = False
            otxtTranscripcion.Enabled = False
            obutTranscripcionGrabar.Visible = False


            oddlSeleccionaVendedor.SelectedValue = Session("idOperador")
            oddlSeleccionaVendedor.Enabled = False

        Else

        End If
    End Sub
    Protected Sub obutGrabacionNueva_Click(sender As Object, e As EventArgs) Handles obutGrabacionNueva.Click
        olblGestionDescripcion.Text = ""
        Label11.Text = ""
        PanelReporte.Visible = False
        PanelAltaGrabacion.Visible = True

    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        ogvGrabacionesRegistroTraer.DataBind()
        PanelReporte.Visible = True
        PanelAltaGrabacion.Visible = False

    End Sub

    Protected Sub oddlSeleccionaVendedor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlSeleccionaVendedor.SelectedIndexChanged
        If oddlSeleccionaVendedor.SelectedValue <> 0 Then
            PanelSubir.Visible = True
        Else
            PanelSubir.Visible = False

        End If
    End Sub

    Protected Sub obutSubirArchivoVendedor_Click(sender As Object, e As EventArgs) Handles obutSubirArchivoVendedor.Click
        armar()
        subirAudio()
        subirArchivo()
        oddlVendedor.SelectedValue = oddlSeleccionaVendedor.SelectedValue
        PanelAltaGrabacion.Visible = False
        PanelReporte.Visible = True
        ogvGrabacionesRegistroTraer.DataBind()

    End Sub



    Public Sub subirArchivo()
        olblMensajeUpload.Text = "Subiendo archivo"
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
                .CommandText = "grabacionAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")

                cmd.Parameters.Add("@idVendedor", Data.SqlDbType.Int).SqlValue = oddlSeleccionaVendedor.SelectedValue

                cmd.Parameters.Add("@grabacionFechaVendedor", Data.SqlDbType.DateTime).SqlValue = otxtgrabacionFechaVendedor.Text

                cmd.Parameters.Add("@grabacionArchivo", Data.SqlDbType.Text).SqlValue = otxtNombreArchivo.Text








                        reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read

                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using







    End Sub




    Protected Sub obutARMAR_Click(sender As Object, e As EventArgs) Handles obutARMAR.Click
       
        armar()

    End Sub

    Private Sub armar()

        otxtNombreArchivo.Text = Replace(LTrim(RTrim(oddlSeleccionaVendedor.SelectedItem.ToString)), " ", "_") + "-" + oddlAAAA.SelectedValue.ToString + oddlMM.SelectedValue.ToString + oddlDD.SelectedValue.ToString + "-" + oddlHora.SelectedValue.ToString + oddlMinutos.SelectedValue.ToString + oddlSegundos.SelectedValue.ToString + Right(FileUpload2.PostedFile.FileName, 5)
        otxtgrabacionFechaVendedor.Text = oddlAAAA.SelectedValue.ToString + "/" + oddlMM.SelectedValue.ToString + "/" + oddlDD.SelectedValue.ToString + " " + oddlHora.SelectedValue.ToString + ":" + oddlMinutos.SelectedValue.ToString + ":" + oddlSegundos.SelectedValue.ToString


    End Sub


    Public Sub subirAudio()
        Dim extension As String
        Dim nombreArchivo As String
        Label11.Text = ""

        olblMensajeUpload.Text = ""
        If FileUpload2.HasFile Then

            Label2.Text = FileUpload2.PostedFile.ContentLength.ToString
            olblMensajeUpload.Visible = True


            If FileUpload2.PostedFile.ContentLength > 22953072000 Then
                Label11.Text = "El archivo que intenta subir tiene " + FileUpload2.PostedFile.ContentLength.ToString + " Bytes. - No se puede porque supera el lìmite máximo Permitido de 2000 KB (3.072.000 bytes)"
                olblMensajeUpload.Text = "La imagen no pudo ser transferida porque supera la capacidad maxima permitida de 3.072.000 bytes. (" + FileUpload2.PostedFile.ContentLength.ToString + ")"
            Else
                olblMensajeUpload.Text = ""
                extension = Right(FileUpload2.FileName, 5)
                nombreArchivo = otxtNombreArchivo.Text


                FileUpload2.SaveAs("C:\inetpub\sites\mpc\audios\" & nombreArchivo)
                Label11.Text = "Nombre de Archivo Origen: " & _
                    FileUpload2.PostedFile.FileName & "<br>" & _
                    "Tamaño de archivo en Bytes: " & _
                    FileUpload2.PostedFile.ContentLength & "<br>" & _
                    "Contenido del Archivo: " & _
                    FileUpload2.PostedFile.ContentType & "<br>"
                Label11.Visible = True




                Label11.Text = "https://www.miprimercasa.ar/audios/" + nombreArchivo
                Label11.Visible = True






            End If
        Else
            Label11.Text = "No ha seleccionado archivo."
        End If
    End Sub




    Protected Sub ogvGrabacionesRegistroTraer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvGrabacionesRegistroTraer.SelectedIndexChanged
        PanelReporte.Visible = False
        PanelAuditoria.Visible = True
        ' idGrabacion, grabacionFechaSubida, idOperador, idVendedor, grabacionFecha, grabacionArchivo, grabacionTranscripcion, grabacionPalabrasPositivasCantidad, grabacionInduccionAlSiCantidad, grabacionCierreCantidad, grabacionReferido, idGrabacionRevisionEstado, idGrabacionDictamen, grabacionDictamenObservacion, operadorDescripcion, Estado, Dictamen, Auditor

        olblIdGrabacion.text = ogvGrabacionesRegistroTraer.SelectedDataKey.Item("idGrabacion")
        olblVendedor.Text = ogvGrabacionesRegistroTraer.SelectedDataKey.Item("operadorDescripcion")
        otxtTranscripcion.Text = ogvGrabacionesRegistroTraer.SelectedDataKey.Item("grabacionTranscripcion")
        olblArchivoAudio.Text = ogvGrabacionesRegistroTraer.SelectedDataKey.Item("grabacionArchivo")
    End Sub

    Protected Sub obutTranscripcionVolver_Click(sender As Object, e As EventArgs) Handles obutTranscripcionVolver.Click
        PanelReporte.Visible = True
        PanelAuditoria.Visible = False
        ogvGrabacionesRegistroTraer.DataBind()

    End Sub

    Protected Sub obutTranscripcionGrabar_Click(sender As Object, e As EventArgs) Handles obutTranscripcionGrabar.Click
        transcripcionGraba()
        PanelAuditoria.Visible = False
        ogvGrabacionesRegistroTraer.DataBind()
        PanelReporte.Visible = True
    End Sub

    Private Sub transcripcionGraba()
        olblMensajeUpload.Text = "grabando transcripcion"
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
                .CommandText = "transcripcionGraba"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idGrabacion", Data.SqlDbType.Int).SqlValue = olblIdGrabacion.Text
                cmd.Parameters.Add("@grabacionTranscripcion", Data.SqlDbType.Text).SqlValue = otxtTranscripcion.Text







                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read

                        olblGestionSQL.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using






    End Sub

    Protected Sub obutArchivoReproducir_Click(sender As Object, e As EventArgs) Handles obutArchivoReproducir.Click
        Response.Redirect("https://www.miprimercasa.ar/audios/" + olblArchivoAudio.Text)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack Then
        Else
            verificaAuditor()

        End If
        
    End Sub
End Class
