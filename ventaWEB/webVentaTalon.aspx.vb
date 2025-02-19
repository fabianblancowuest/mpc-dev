
Partial Class ventaWEB_webVentaTalon
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
             
            olblIdSorteo.Text = 1
            olblSession.Text = Session.SessionID
            olblIdContactoTipo.Text = 9

            talonVendedorToma()
            olblIdSorteoTalonCobranza.Text = "0"
            sorteoInformacionGeneral()

        End If
        
      
    End Sub

    Protected Sub obutNumeros_Click(sender As Object, e As EventArgs) Handles obutNumeros.Click
        ' toma los talones seleccionados y presenta los números para colocar el premio y determinar el importe
       


        talonVendedorToma()
      
        talonVendedorAsientaPremio()

        PanelNumeros.Visible = True


        PanelPremio.Visible = False

    End Sub



    Public Sub talonVendedorToma()

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
        olblBilletesSeleccionadosCantidad.Text = "0"

        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoTalonVendedorActualizaWEB"
            End With


            For Each Row In ogvSorteoTalonVendedorVenta.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalon = CType(Row.FindControl("olblIdSorteoTalon"), Label)
                    sorteoTalonTomado = CType(Row.FindControl("ochSorteoTalonTomado"), CheckBox)
                    If sorteoTalonTomado.Checked = True Then
                        olblBilletesSeleccionadosCantidad.Text = (Val(olblBilletesSeleccionadosCantidad.Text) + 1).ToString

                    End If


                    connection.Open()
                    cmd.Parameters.Add("@idSorteoTalon", Data.SqlDbType.Int).SqlValue = idSorteoTalon.Text
                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = idOperador.Text
                    cmd.Parameters.Add("@sorteoTalonTomado", Data.SqlDbType.Int).SqlValue = sorteoTalonTomado.Checked
                    cmd.Parameters.Add("@sorteoTalonSession", Data.SqlDbType.Char).SqlValue = olblSession.Text


                    




                    reader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        While reader.Read
                            olblGestionCodigo.text = reader.Item("gestionCodigo")
                            olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                            olblPar02.Text = reader.Item("sessionesConcurrentes").ToString + " persona(s) comprando"
                            If RTrim(LTrim(olblGestionCodigo.Text)) = "0" Then

                                If sorteoTalonTomado.Checked = True Then
                                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " - " + reader.Item("gestionDescripcion").ToString

                                End If

                            End If



                        End While
                    End If

                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using
        If olblBilletesSeleccionadosCantidad.Text = "1" Then
            olblBilletesSeleccionados.Text = " billete seleccionado"
        Else
            olblBilletesSeleccionados.Text = " billetes seleccionados"
        End If


        If Val(olblBilletesSeleccionadosCantidad.Text) > 0 Then
            obutPremios.Enabled = True
            obutPremios.BackColor = Drawing.Color.Yellow
            obutPremios.ForeColor = Drawing.Color.Black


        Else
            obutPremios.Enabled = False
            obutPremios.BackColor = Drawing.Color.Gray
            obutPremios.ForeColor  = Drawing.Color.White

        End If
        ogvSorteoTalonVendedorVenta.DataBind()






    End Sub

    Public Sub UploadBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UploadBtn.Click

        subirImagen()
        PanelAlta.Visible = True
        PanelCliente.Visible = True


    End Sub


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
            otxtLeyendaPago.Visible = True
            obutRealizarPago.Visible = True

        Else
            PanelValores.Visible = False
            otxtLeyendaPago.Visible = False
            obutRealizarPago.Visible = False

        End If



    End Sub


    Public Sub subirImagen()
        Dim extension As String
        Dim nombreArchivo As String
        Label11.Text = ""

        olblMensajeUpload.Text = ""
        If FileUpLoad2.HasFile Then

            Label2.Text = FileUpLoad2.PostedFile.FileName
            olblMensajeUpload.Visible = True


            If FileUpLoad2.PostedFile.ContentLength > 3072000 Then
                Label11.Text = "El archivo que intenta subir tiene " + FileUpLoad2.PostedFile.ContentLength.ToString + " Bytes. - No se puede porque supera el lìmite máximo Permitido de 2000 KB (3.072.000 bytes)"
                olblMensajeUpload.Text = "La imagen no pudo ser transferida porque supera la capacidad maxima permitida de 3.072.000 bytes. (" + FileUpLoad2.PostedFile.ContentLength.ToString + ")"
            Else
                olblMensajeUpload.Text = ""
                extension = Right(FileUpLoad2.FileName, 4)
                nombreArchivo = Right("000000" + LTrim(RTrim(olblIdSorteoTalonCobranza.Text)), 6) + Right("0000" + LTrim(RTrim(olblidImagenTipo.Text)), 4).Replace(" ", "_")


                FileUpLoad2.SaveAs("C:\inetpub\sites\STRSYSTEM\talonesWEB\" & nombreArchivo + extension)
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

                Label11.Text = "https://www.miprimercasa.ar/mpc/talonesWEB/" + nombreArchivo + extension
                Label11.Visible = False

                Image1.ImageUrl = Label11.Text


                Image1.DataBind()


                sorteoTalonCobranzaAM()

            End If
        Else
            Label11.Text = "No ha seleccionado archivo."
        End If
    End Sub
      

    Protected Sub obutValoresComplementar_Click(sender As Object, e As EventArgs) Handles obutValoresComplementar.Click
        complementaTransferencia()
    End Sub



    Private Sub complementaTransferencia()
        If Val(otxtValorEfectivoMonto.Text) > Val(olblMontoTotal.Text) Then
            otxtValorEfectivoMonto.Text = olblMontoTotal.Text
        End If
        otxtValorTransferenciaMonto.Text = (Val(olblMontoTotal.Text) - Val(otxtValorEfectivoMonto.Text)).ToString


    End Sub

    Protected Sub sorteoOperadorDatosInicio()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
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

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = olblIdOperador.Text




                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        'olblTalonesAsignados.Text = reader.Item("talonesAsignados")
                        'olblTalonesVendidos.Text = reader.Item("talonesVenddos")
                        'olblTotalRecaudado.Text = reader.Item("totalRecaudado")
                        'olblTalonesPendientes.Text = reader.Item("talonesPendientes")
                        'olblCotizacionDolarVenta.Text = reader.Item("cotizacionDolarVenta")
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
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
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

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = olblIdOperador.Text
                cmd.Parameters.Add("@efectivoMonto", Data.SqlDbType.Money).SqlValue = 0
                cmd.Parameters.Add("@transferenciaMonto", Data.SqlDbType.Money).SqlValue = Val(olblMontoTotal.Text)
                cmd.Parameters.Add("@transferenciaNumero", Data.SqlDbType.Text).SqlValue = otxtValorTransferenciaNumero.Text
                cmd.Parameters.Add("@transferenciaImagen", Data.SqlDbType.Text).SqlValue = Label11.Text



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdSorteoTalonCobranza.Text = reader.Item("idSorteoTalonCobranza").ToString
                    End While
                End If
            Catch ex As Exception
                olblMensajeGrabacionCobranza.Text = ex.Message + "(  idTalon: " + olblIdSorteoTalonCobranza.Text + "  idOperador" + olblIdOperador.Text


            End Try
            connection.Close()
        End Using

    End Sub

    Protected Sub obutConfirmaOperacion_Click(sender As Object, e As EventArgs) Handles obutConfirmaOperacion.Click
        PanelEncuesta.Visible = True


        Dim habilita As Integer
        habilita = 1


        Dim correoValidado As Integer
        correoValidado = correoElectronicoValidador.correoValidadoCodigo()


        Dim telefonoValidado As Integer
        telefonoValidado = whatsappValidador.WhatsAppValidadoCodigo()



        olblMensajeValidacion.Text = ""

            If olblIdSorteoTalonCobranza.Text = "0" Then
                olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar operacion  -"
                habilita = 0

            End If

            If Len(LTrim(RTrim(otxtClienteApyNom.Text))) = 0 Then
                olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar apellido y nombres del cliente -"
                habilita = 0

            End If
            If Len(LTrim(RTrim(whatsappValidador.WhatsAppValidado()))) = 0 Then
            olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar teléfono del cliente -"
                habilita = 0
            End If
            'If Len(LTrim(RTrim(otxtClienteCorreoElectronico.Text))) = 0 Then
            '    olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar correo electronico -"
            '    habilita = 0

            'End If
            If Val(otxtValorTransferenciaMonto.Text) > 0 And Len(LTrim(RTrim(otxtValorTransferenciaNumero.Text))) = 0 Then
                olblMensajeValidacion.Text = LTrim(RTrim(olblMensajeValidacion.Text)) + "- Debe completar el número de transferencia que consta en el comprobante subido -"
                habilita = 0

            End If


        'If habilita = 1 And olblIdSorteoTalonCobranza.Text <> "0" Then
        ventaConfirmada()

        ' End If

    End Sub
    Protected Sub ventaConfirmada()
        talonVendedorAsientaCliente()
        'grabo por si hubo algùn cambio en forma de pago 
        sorteoTalonCobranzaAM()
        'Graba encuesta
        encuestaGraba()

        'inicializaVariables()

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
                    cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                    cmd.Parameters.Add("@clienteApynom", Data.SqlDbType.Text).SqlValue = otxtClienteApyNom.Text
                    cmd.Parameters.Add("@clienteTelefono", Data.SqlDbType.Text).SqlValue = whatsappValidador.WhatsAppValidado()
                    cmd.Parameters.Add("@clienteCorreoElectronico", Data.SqlDbType.Text).SqlValue = correoElectronicoValidador.correoValidado()

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



    Private Sub inicializaVariables()

        orbEncuesta_inversion.SelectedValue = "0"
        orbEncuesta_esPropietario.SelectedValue = "0"
        orbEncuesta_alquila.SelectedValue = "0"
        orbEncuesta_enQueInvertiria.SelectedValue = "0"
        orbEncuesta_esClienteMPC.SelectedValue = "0"
        ogvSorteoVendedorTalonSeleccionado.DataBind()

        ogvSorteoTalonVendedorVenta.DataBind()
        otxtClienteApyNom.Text = ""
        'otxtClienteTelefono.Text = ""
        'otxtClienteCorreoElectronico.Text = ""
        obutConfirmaOperacion.Visible = False
        obutOperacionRealizada.Visible = True
        olblOperacionRealizada.Text = "Venta asentada según número interno " + Right("00000000" + LTrim(RTrim(olblIdSorteoTalonCobranza.Text)).ToString, 8)
        Session.Item("idSorteoTalonCobranza") = 0


    End Sub


    Private Sub nuevaVenta()
        Response.Redirect("webVentaTalon.aspx")
    End Sub



    Private Sub encuestaGraba()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
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

                cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = olblIdSorteoTalonCobranza.Text
                cmd.Parameters.Add("@encuesta_inversion", Data.SqlDbType.Int).SqlValue = orbEncuesta_inversion.SelectedValue
                cmd.Parameters.Add("@encuesta_esPropietario", Data.SqlDbType.Int).SqlValue = orbEncuesta_esPropietario.SelectedValue
                cmd.Parameters.Add("@encuesta_alquila", Data.SqlDbType.Int).SqlValue = orbEncuesta_alquila.SelectedValue
                cmd.Parameters.Add("@encuesta_esClienteMPC", Data.SqlDbType.Int).SqlValue = orbEncuesta_esClienteMPC.SelectedValue
                cmd.Parameters.Add("@encuesta_enQueInvertiria", Data.SqlDbType.Int).SqlValue = orbEncuesta_enQueInvertiria.SelectedValue



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIdSorteoTalonCobranza.Text = reader.Item("idSorteoTalonCobranza").text

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

     

    Protected Sub obutPremios_Click(sender As Object, e As EventArgs) Handles obutPremios.Click
        PanelNumeros.Visible = False
        PanelPremio.Visible = True
        ogvSorteoVendedorTalonSeleccionado.DataBind()
        talonVendedorAsientaPremio()
    End Sub


    Protected Sub sorteoInformacionGeneral()
        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()
        Dim retorno As Integer
        olblMensajeGrabacionCobranza.Text = ""
        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString
        retorno = 0
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoInformacionGeneralID"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@operadorID", Data.SqlDbType.Text).SqlValue = Request.QueryString("Operador")
                

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblInformacionVenta.Text = reader.Item("InformacionVenta").ToString
                        olblIdOperador.Text = reader.Item("idOperador")
                        idOperador.Text = reader.Item("idOperador")



                    End While
                End If
            Catch ex As Exception
                olblInformacionVenta.Text = ex.Message
            End Try
            connection.Close()

            If idOperador.Text = "0" Then
                PanelAlta.Visible = False

            End If
        End Using
    End Sub

    Protected Sub obutRealizarPago_Click(sender As Object, e As EventArgs) Handles obutRealizarPago.Click
        sorteoTalonCobranzaAM()

        PanelMercadoPAgo.Visible = False
        PanelTransferencia.Visible = False

        PanelValores.Visible = True
        PanelPremio.Visible = False
        'obutNumeros.Enabled = False
        'obutPremios.Enabled = False
        'obutCobrar.Enabled = True
        obutNumeros.BackColor = Drawing.Color.Gray
        obutPremios.BackColor = Drawing.Color.Gray
        obutPremios.ForeColor = Drawing.Color.White

        obutCobrar.BackColor = Drawing.Color.Orange
        obutCobrar.ForeColor = Drawing.Color.White


        olblPagoConfirmadoMonto.Text = "$" + olblMontoTotal.Text

        olblPagoConfirmadoMonto.Font.Size = 40


        PanelConfirmaOperacion.Visible = True

    End Sub

   
    Protected Sub obutOpcionPagoConMercadoPago_Click(sender As Object, e As EventArgs) Handles obutOpcionPagoConMercadoPago.Click
        Image1.ImageUrl = "https://www.miprimercasa.ar/mpc/talonesWEB/mercadoPagoImagenPendiente.jpg"
        obutOpcionPagoConMercadoPago.Visible = False
        obutTransferenciaAMercadoPago.Visible = False
        obutVolverFormasDePago.Visible = True
        obutPagaConMercadoPago.Text = "PAGAR CON MERCADO PAGO"
        obutPagaConMercadoPago.BackColor = Drawing.Color.Blue
        obutPagaConMercadoPago.ForeColor = Drawing.Color.White






        PanelMercadoPAgo.Visible = True
        PanelTransferencia.Visible = False








    End Sub

    Protected Sub obutPagaConMercadoPago_Click(sender As Object, e As EventArgs) Handles obutPagaConMercadoPago.Click


        obutPagaConMercadoPago.BackColor = Drawing.Color.LightGreen
        obutPagaConMercadoPago.Text = "PAGO CON MP - en proceso"
        Dim URL As String = "https://link.mercadopago.com.ar/pagobilletesorteo"

        Dim Funcion As String = "OpenWindows('" & URL & "');"

        ScriptManager.RegisterStartupScript(Me.Page, Me.GetType(), "SIFEL", Funcion, True)


        uploadPanelMostrar()



    End Sub




    Protected Sub uploadPanelMostrar()
        PanelUpload.Visible = True
    End Sub

    Protected Sub obutTransferenciaAMercadoPago_Click(sender As Object, e As EventArgs) Handles obutTransferenciaAMercadoPago.Click
        obutOpcionPagoConMercadoPago.Visible = False
        obutTransferenciaAMercadoPago.Visible = False
        obutVolverFormasDePago.Visible = True
       

        PanelMercadoPAgo.Visible = False
        PanelTransferencia.Visible = True

        Image1.ImageUrl = "https://www.miprimercasa.ar/mpc/talonesWEB/transferenciaImagenPendiente.jpg"

        uploadPanelMostrar()


    End Sub

    Protected Sub obutVolverFormasDePago_Click(sender As Object, e As EventArgs) Handles obutVolverFormasDePago.Click
        PanelMercadoPAgo.Visible = False
        PanelTransferencia.Visible = False
        PanelUpload.Visible = False


        obutOpcionPagoConMercadoPago .Visible =true
        obutTransferenciaAMercadoPago.Visible = True
        obutVolverFormasDePago.Visible = False

    End Sub

    Protected Sub FileUpLoad2_DataBinding(sender As Object, e As EventArgs) Handles FileUpLoad2.DataBinding
        subirImagen()

    End Sub

    Protected Sub obutConfirmaPago_Click(sender As Object, e As EventArgs) Handles obutConfirmaPago.Click
        PanelMercadoPAgo.Visible = False
        PanelTransferencia.Visible = False
        PanelUpload.Visible = False
        PanelCliente.Visible = True


    End Sub


   
End Class
