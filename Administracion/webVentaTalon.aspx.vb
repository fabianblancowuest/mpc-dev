
Partial Class Administracion_webVentaTalon
    Inherits System.Web.UI.Page

    Protected Sub obutCobrar_Click(sender As Object, e As EventArgs) Handles obutCobrar.Click
        ' toma los talones seleccionados y presenta los números para colocar el premio y determinar el importe
        If Val(olbltalonesPendientes.Text) = 0 Then
            Response.Redirect("inicioCorrecto.aspx")
        Else


            talonVendedorToma()
            ogvSorteoVendedorTalonSeleccionado.DataBind()

            talonVendedorAsientaPremio()

            PanelTalonSeleccion.Visible = False

            PanelCobranza.Visible = True
            ogvSorteoVendedorTalonSeleccionado.DataBind()
        End If

    End Sub


    Public Function talonVendedorToma() As String


        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim sorteoTalonTomado As CheckBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorActualiza"
            End With


            For Each Row In ogvSorteoTalonVendedorVenta.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    sorteoTalonTomado = CType(Row.FindControl("ochSorteoTalonTomado"), CheckBox)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@sorteoTalonTomado", Data.SqlDbType.Int).SqlValue = sorteoTalonTomado.Checked
                    cmd.Parameters.Add("@sorteoTalonSession", Data.SqlDbType.Char).SqlValue = Session.SessionID

                    'olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " - " + idSorteoTalon.Text + " - "

                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using




        Return ""


    End Function




    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        talonVendedorAsientaPremio()
    End Sub

    Private Sub talonVendedorAsientaPremio()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label
        Dim idSorteoPremio As DropDownList


        Dim fila As Integer

        olblValidacionMensajeErrorPremio.Text = ""
        olblValidacionMensajeErrores.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorAsientaPremio"
            End With
            olblMontoTotal.Text = "0"
            olblCantidadTotal.Text = "0"
            For Each Row In ogvSorteoVendedorTalonSeleccionado.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    idSorteoPremio = CType(Row.FindControl("oddlPremio"), DropDownList)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idSorteoPremio", Data.SqlDbType.Int).SqlValue = idSorteoPremio.SelectedValue


                    reader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read
                            olblMontoTotal.Text = (Val(olblMontoTotal.Text) + reader.Item("sorteoPremioCosto"))
                            If reader.Item("sorteoPremioCosto") > 0 Then
                                olblCantidadTotal.Text = (Val(olblCantidadTotal.Text) + 1).ToString
                            Else
                                olblValidacionMensajeErrores.Text = (Val(olblValidacionMensajeErrores.Text) + 1).ToString
                                olblValidacionMensajeErrorPremio.Text = "Debe completar el talón con el premio en cada billete seleccionado."
                            End If

                        End While
                    End If
                Catch ex As Exception
                    olblValidacionMensajeErrorPremio.Text = LTrim(RTrim(olblValidacionMensajeErrorPremio.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using


        ogvSorteoVendedorTalonSeleccionado.DataBind()

        If olblValidacionMensajeErrores.Text = "0" And Val(olblCantidadTotal.Text) > 0 Then
            PanelValores.Visible = True
        Else
            PanelValores.Visible = False

        End If



    End Sub


    Private Sub talonVendedorAsientaCliente()

        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalon As Label

        Dim fila As Integer

        olblValidacionMensajeErrorPremio.Text = ""
        olblValidacionMensajeErrores.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorAsientaCliente"
            End With
            olblMontoTotal.Text = "0"
            olblCantidadTotal.Text = "0"
            For Each Row In ogvSorteoVendedorTalonSeleccionado.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = Session("idSorteoTalonCobranza")
                    cmd.Parameters.Add("@clienteApynom", Data.SqlDbType.Text).SqlValue = otxtClienteApyNom.Text
                    cmd.Parameters.Add("@clienteTelefono", Data.SqlDbType.Text).SqlValue = otxtClienteTelefono.Text
                    cmd.Parameters.Add("@clienteCorreoElectronico", Data.SqlDbType.Text).SqlValue = otxtClienteCorreoElectronico.Text

                    reader = cmd.ExecuteReader()

                    If reader.HasRows Then
                        While reader.Read

                        End While
                    End If
                Catch ex As Exception
                    olblValidacionMensajeErrorPremio.Text = LTrim(RTrim(olblValidacionMensajeErrorPremio.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using


        ogvSorteoVendedorTalonSeleccionado.DataBind()

        If olblValidacionMensajeErrores.Text = "0" Then
            PanelValores.Visible = True
        Else
            PanelValores.Visible = False

        End If



    End Sub


    Protected Sub obutSeleccion_Click(sender As Object, e As EventArgs) Handles obutSeleccion.Click
        PanelTalonSeleccion.Visible = True
        PanelCobranza.Visible = False

    End Sub

    Protected Sub formaPago()

        PanelAlta.Visible = True

        obutValoresComplementar.Visible = False

            PanelEfectivo.Visible = False
            PanelTransferencia.Visible = True
            otxtValorEfectivoMonto.Text = "0"
            otxtValorEfectivoMonto.Enabled = False
            otxtValorTransferenciaMonto.Text = olblMontoTotal.Text
            otxtValorTransferenciaMonto.Enabled = False
            otxtValorTransferenciaNumero.Enabled = True

        sorteoTalonCobranzaAM()
        PanelCliente.Visible = True

    End Sub
    Private Sub complementaTransferencia()
        If Val(otxtValorEfectivoMonto.Text) > Val(olblMontoTotal.Text) Then
            otxtValorEfectivoMonto.Text = olblMontoTotal.Text
        End If
        otxtValorTransferenciaMonto.Text = (Val(olblMontoTotal.Text) - Val(otxtValorEfectivoMonto.Text)).ToString


    End Sub

    Protected Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click

        subirImagen()



    End Sub



    Private Sub subirImagen()
        Dim extension As String
        Dim nombreArchivo As String
        Label1.Text = ""

        olblMensajeUpload.Text = ""
        If FileUpLoad2.HasFile Then

            Label2.Text = FileUpLoad2.PostedFile.FileName
            olblMensajeUpload.Visible = True


            If FileUpLoad2.PostedFile.ContentLength > 3072000 Then
                Label1.Text = "El archivo que intenta subir tiene " + FileUpLoad2.PostedFile.ContentLength.ToString + " Bytes. - No se puede porque supera el lìmite máximo Permitido de 2000 KB (3.072.000 bytes)"
                olblMensajeUpload.Text = "La imagen no pudo ser transferida porque supera la capacidad maxima permitida de 3.072.000 bytes. (" + FileUpLoad2.PostedFile.ContentLength.ToString + ")"
            Else
                olblMensajeUpload.Text = ""
                extension = Right(FileUpLoad2.FileName, 4)
                nombreArchivo = Right("000000" + LTrim(RTrim(Session("idSorteoTalonCobranza"))), 6) + Right("0000" + LTrim(RTrim(olblidImagenTipo.Text)), 4).Replace(" ", "_")


                FileUpLoad2.SaveAs("C:\inetpub\sites\mpc\talonesWEB\" & nombreArchivo + extension)
                Label11.Text = "Nombre de Archivo Origen: " & _
                    FileUpLoad2.PostedFile.FileName & "<br>" & _
                    "Tamaño de archivo en Bytes: " & _
                    FileUpLoad2.PostedFile.ContentLength & "<br>" & _
                    "Contenido del Archivo: " & _
                    FileUpLoad2.PostedFile.ContentType & "<br>"
                Label11.Visible = True


                olblPrevisualiza.Text = "~/talonesWEB/" + nombreArchivo + extension
                olblPrevisualiza.Visible = True

                ' grabarURL()

                Image1.ImageUrl = "~/talonesWEB/" + nombreArchivo + extension
                Label11.Text = "https://www.miprimercasa.ar/talonesWEB/" + nombreArchivo + extension

                Image1.DataBind()


                sorteoTalonCobranzaAM()

            End If
        Else
            Label1.Text = "No ha seleccionado archivo."
        End If
    End Sub
    Private Sub grabarURL()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblGestionGrabacion.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "PRESTADORVEHICULOIAMAGENGRABA"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idPrestadorVehiculoImagen", Data.SqlDbType.Int).SqlValue = olblIdPrestadorVehiculoImagen.Text

                cmd.Parameters.Add("@prestadorVehiculoImagenURL", Data.SqlDbType.Char).SqlValue = olblPrevisualiza.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                    End While
                End If
            Catch ex As Exception
                olblGestionGrabacion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack Then
        Else
            Session.Item("idSorteoTalonCobranza") = 0
            sorteoOperadorDatosInicio()
            If Val(olblTalonesPendientes.Text) = 0 Then
                olblLeyendaVendedor.Text = "No posee billetes habilitados para la venta. Diríjase con su supervisor para que le asigne un rango y luego vuelva a ingresar."
                obutCobrar.Text = "Debe solicitar billetes del sorteo"
            End If
        End If

    End Sub

    Protected Sub obutValoresComplementar_Click(sender As Object, e As EventArgs) Handles obutValoresComplementar.Click
        complementaTransferencia()
    End Sub

    Protected Sub sorteoOperadorDatosInicio()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoOperadorDatosInicio"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblTalonesAsignados.Text = reader.Item("talonesAsignados")
                        olblTalonesVendidos.Text = reader.Item("talonesVenddos")
                        olblTotalRecaudado.Text = reader.Item("totalRecaudado")
                        olblTalonesPendientes.Text = reader.Item("talonesPendientes")
                        olblCotizacionDolarVenta.Text = reader.Item("cotizacionDolarVenta")
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub



    Private Sub sorteoTalonCobranzaAM()

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonCobranzaAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = Session("idSorteoTalonCobranza")
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                cmd.Parameters.Add("@efectivoMonto", Data.SqlDbType.Money).SqlValue = otxtValorEfectivoMonto.Text
                cmd.Parameters.Add("@transferenciaMonto", Data.SqlDbType.Money).SqlValue = otxtValorTransferenciaMonto.Text
                cmd.Parameters.Add("@transferenciaNumero", Data.SqlDbType.Text).SqlValue = otxtValorTransferenciaNumero.Text
                cmd.Parameters.Add("@transferenciaImagen", Data.SqlDbType.Text).SqlValue = Label11.Text



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        Session.Item("idSorteoTalonCobranza") = reader.Item("idSorteoTalonCobranza")
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message
            End Try
            connection.Close()
        End Using

    End Sub

    Protected Sub obutConfirmaOperacion_Click(sender As Object, e As EventArgs) Handles obutConfirmaOperacion.Click
        Dim habilita As Integer
        habilita = 1
        olblMensajeValidacion.Text = ""

        If Session("idSorteoTalonCobranza") = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar operacion  -"
            habilita = 0

        End If

        If Len(LTrim(RTrim(otxtClienteApyNom.Text))) = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar apellido y nombres del cliente -"
            habilita = 0

        End If
        If Len(LTrim(RTrim(otxtClienteTelefono.Text))) = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar teléfomo del cliente -"
            habilita = 0
        End If
        If Len(LTrim(RTrim(otxtClienteCorreoElectronico.Text))) = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar correo electronico -"
            habilita = 0

        End If
        If Val(otxtValorTransferenciaMonto.Text) > 0 And Len(LTrim(RTrim(otxtValorTransferenciaNumero.Text))) = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar el número de transferencia que consta en el comprobante subido -"
            habilita = 0

        End If

        If habilita = 1 And Session("idSorteoTalonCobranza") <> 0 Then
            ventaConfirmada()

        End If

    End Sub
    Protected Sub ventaConfirmada()
        talonVendedorAsientaCliente()
        'grabo por si hubo algùn cambio en forma de pago 
        sorteoTalonCobranzaAM()
        'Graba encuesta
        encuestaGraba()
        inicializaVariables()

    End Sub

    Private Sub inicializaVariables()

        orbEncuesta_inversion.SelectedValue = "0"
        orbEncuesta_esPropietario.SelectedValue = "0"
        orbEncuesta_alquila.SelectedValue = "0"
        orbEncuesta_enQueInvertiria.SelectedValue = "0"
        orbEncuesta_esClienteMPC.SelectedValue = "0"
        ogvSorteoVendedorTalonSeleccionado.DataBind()

        ogvSorteoTalonVendedorVenta.DataBind()
        otxtClienteApyNom.Text = ""
        otxtClienteTelefono.Text = ""
        otxtClienteCorreoElectronico.Text = ""
        obutConfirmaOperacion.Visible = False
        obutOperacionRealizada.Visible = True
        olblOperacionRealizada.Text = "Venta asentada según número interno " + Right("00000000" + LTrim(RTrim(Session("idSorteoTalonCobranza"))).ToString, 8)
        Session.Item("idSorteoTalonCobranza") = 0

        obutMenuPrincipal.Visible = True


    End Sub


    Private Sub nuevaVenta()
        Response.Redirect("operadorVentaTalon.aspx")
    End Sub

    Private Sub menuRolesVendedor()
        Response.Redirect("iniciocorrecto.aspx")

    End Sub

    Private Sub encuestaGraba()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings(Session("session_conexion"))
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonCobranzaEncuestaGraba"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = Session("idSorteoTalonCobranza")
                cmd.Parameters.Add("@encuesta_inversion", Data.SqlDbType.Int).SqlValue = orbEncuesta_inversion.SelectedValue
                cmd.Parameters.Add("@encuesta_esPropietario", Data.SqlDbType.Int).SqlValue = orbEncuesta_esPropietario.SelectedValue
                cmd.Parameters.Add("@encuesta_alquila", Data.SqlDbType.Int).SqlValue = orbEncuesta_alquila.SelectedValue
                cmd.Parameters.Add("@encuesta_esClienteMPC", Data.SqlDbType.Int).SqlValue = orbEncuesta_esClienteMPC.SelectedValue
                cmd.Parameters.Add("@encuesta_enQueInvertiria", Data.SqlDbType.Int).SqlValue = orbEncuesta_enQueInvertiria.SelectedValue



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        Session.Item("idSorteoTalonCobranza") = reader.Item("idSorteoTalonCobranza")
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutOperacionRealizada_Click(sender As Object, e As EventArgs) Handles obutOperacionRealizada.Click
        nuevaVenta()

    End Sub

    Protected Sub obutMenuPrincipal_Click(sender As Object, e As EventArgs) Handles obutMenuPrincipal.Click
        menuRolesVendedor()

    End Sub
End Class
