
Partial Class ventaWEB_loteDocumentacionBlanco
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else


        End If
    End Sub

    Public Sub inicializa(ByVal idLoteVenta As Label, ByVal idImagenTipo As String, ByVal referencia As Label, ByVal color As String)
        olblIDLoteVenta.Text = idLoteVenta.Text
        olblIdImagenTipo.Text = idImagenTipo
        olblReferencia.Text = referencia.Text
        imagenTipoCarga()
        oimgImagen.ImageUrl = olblImagenURL.Text
        If color = "1" Then
            PanelImagen.BackColor = Drawing.Color.White

        End If


        If color = "2" Then
            PanelImagen.BackColor = Drawing.Color.WhiteSmoke


        End If

        oimgImagen.DataBind()

    End Sub


    Private Sub imagenTipoCarga()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("strsystem")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "loteVentaimagenTipoCarga"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLoteVenta.Text
                cmd.Parameters.Add("@idImagenTipo", Data.SqlDbType.Int).SqlValue = olblIdImagenTipo.Text
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblImagenTipoDescripcion.Text = reader.Item("imagenTipoDescripcion")
                        olblImagenTipoExplicacion.Text = reader.Item("imagenTipoExplicacion")
                        'olblImagenTipoRequiereFechaVto.Text = reader.Item("imagenTipoRequiereFechaVto").ToString
                        olblImagenURL.Text = reader.Item("imagenURL")
                        olblURLMensaje.Text = "paso por aca " + olblIdImagenTipo.Text
                    End While
                End If
            Catch ex As Exception
                olblURLMensaje.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub


    Public Sub subirImagen()
        Dim extension As String
        Dim nombreArchivo As String
        Label11.Text = ""

        olblMensajeUpload.Text = ""
        If FileUpLoad2.HasFile Then

            Label2.Text = FileUpLoad2.PostedFile.FileName
            olblMensajeUpload.Visible = True


            If FileUpLoad2.PostedFile.ContentLength > 953072000 Then
                Label11.Text = "El archivo que intenta subir tiene " + FileUpLoad2.PostedFile.ContentLength.ToString + " Bytes. - No se puede porque supera el lìmite máximo Permitido de 2000 KB (3.072.000 bytes)"
                olblMensajeUpload.Text = "La imagen no pudo ser transferida porque supera la capacidad maxima permitida de 3.072.000 bytes. (" + FileUpLoad2.PostedFile.ContentLength.ToString + ")"
            Else
                olblMensajeUpload.Text = ""
                extension = Right(FileUpLoad2.FileName, 5)
                nombreArchivo = Right("000000" + LTrim(RTrim(olblIDLoteVenta.Text)), 6) + Right("0000" + LTrim(RTrim(olblIdImagenTipo.Text)), 4).Replace(" ", "_")


                FileUpLoad2.SaveAs("C:\inetpub\sites\mpc\loteDocumentacion\" & nombreArchivo + extension)
                Label11.Text = "Nombre de Archivo Origen: " & _
                    FileUpLoad2.PostedFile.FileName & "<br>" & _
                    "Tamaño de archivo en Bytes: " & _
                    FileUpLoad2.PostedFile.ContentLength & "<br>" & _
                    "Contenido del Archivo: " & _
                    FileUpLoad2.PostedFile.ContentType & "<br>"
                Label11.Visible = True


                olblPrevisualiza.Text = "~/loteDocumentacion/" + nombreArchivo + extension
                olblPrevisualiza.Visible = True



                Label11.Text = "https://www.miprimercasa.ar/loteDocumentacion/" + nombreArchivo + extension
                Label11.Visible = True


                oimgImagen.ImageUrl = Label11.Text


                oimgImagen.DataBind()

                grabarURL()

            End If
        Else
            Label11.Text = "No ha seleccionado archivo."
        End If
    End Sub
    Public Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click

        subirImagen()


    End Sub

    Private Sub grabarURL()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("strsystem")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "loteVentaimagenGrabaImagen"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLoteVenta.Text
                cmd.Parameters.Add("@idImagenTipo", Data.SqlDbType.Int).SqlValue = olblIdImagenTipo.Text
                cmd.Parameters.Add("@imagenURL", Data.SqlDbType.Text).SqlValue = Label11.Text



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read


                    End While
                End If
            Catch ex As Exception
                Label11.Text = ex.Message

            End Try
            connection.Close()
        End Using



    End Sub


End Class
