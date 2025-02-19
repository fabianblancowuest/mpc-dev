
Partial Class Administracion_rendicionSorteoCobranzaGlobal
    Inherits System.Web.UI.Page

    Protected Sub ogvrendicionSorteoCobranzaGlobal_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvrendicionSorteoCobranzaGlobal.SelectedIndexChanged
        olblTotalVentas.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("totalVentas")
        olblOperaciones.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("operaciones")

        olblEfectivo.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("efectivo")
        olblOperacionesEfectivo.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("operacionesEfectivo")

        olblTransferencias.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("transferencias")
        olblOperacionesTransferencia.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("operacionesTransferencia")
        olblIdOperador.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("idOperador").ToString
        olblOperadorDescripcion.Text = ogvrendicionSorteoCobranzaGlobal.SelectedDataKey.Item("operadorDescripcion")
        PanelGlobal.Visible = False
        PanelVendedor.Visible = True
        ogvrendicionSorteoCobranzaVendedor.DataBind()
        actualizaRendicion()
       



    End Sub

    Protected Sub ogvrendicionSorteoCobranzaVendedor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvrendicionSorteoCobranzaVendedor.SelectedIndexChanged

    End Sub

    Protected Sub obutPrevisualiza_Click(sender As Object, e As EventArgs) Handles obutPrevisualiza.Click
        actualizaRendicion()

    End Sub


    Private Sub actualizaRendicion()
        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalonCobranza As Label
        Dim efectivoMonto As Label
        Dim efectivoRinde As CheckBox
        Dim transferenciaMonto As Label
        Dim transferenciaRinde As CheckBox
        Dim fila As Integer

        olblValidacionMensajeError.Text = ""
        olblEfectivoRendidoMonto.Text = "0"
        olblEfectivoRendidoComprobantes.Text = "0"
        olblTransferenciasRendidasMonto.Text = "0"
        olblTransferenciasrendidasComprobantes.Text = "0"
        fila = 1
  


            For Each Row In ogvrendicionSorteoCobranzaVendedor.Rows

            cmd.Parameters.Clear()

            'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
            idSorteoTalonCobranza = CType(Row.FindControl("idSorteoTalonCobranza"), Label)
            efectivoMonto = CType(Row.FindControl("efectivoMonto"), Label)
            efectivoRinde = CType(Row.FindControl("efectivoRinde"), CheckBox)
            transferenciaMonto = CType(Row.FindControl("transferenciaMonto"), Label)
            transferenciaRinde = CType(Row.FindControl("transferenciaRinde"), CheckBox)

            If efectivoRinde.Checked = True Then

                olblEfectivoRendidoMonto.Text = (Val(olblEfectivoRendidoMonto.Text) + Val(efectivoMonto.Text.Replace(",", "."))).ToString
                If Val(efectivoMonto.Text.Replace(",", ".")) > 0 Then
                    olblEfectivoRendidoComprobantes.Text = (Val(olblEfectivoRendidoComprobantes.Text) + 1).ToString
                End If



                olblTransferenciasRendidasMonto.Text = (Val(olblTransferenciasRendidasMonto.Text) + Val(transferenciaMonto.Text.Replace(",", "."))).ToString

                If Val(transferenciaMonto.Text.Replace(",", ".")) > 0 Then
                    olblTransferenciasrendidasComprobantes.Text = (Val(olblTransferenciasrendidasComprobantes.Text) + 1).ToString
                End If

            End If

            fila = fila + 1

        Next
        otxtEfectivoEntregado.Text = olblEfectivoRendidoMonto.Text


    End Sub

    Protected Sub obutPrevisualizaEntregaRecaudacion_Click(sender As Object, e As EventArgs) Handles obutPrevisualizaEntregaRecaudacion.Click
        complemento()

        If Val(olblEfectivoRendidoMonto.Text) + Val(olblTransferenciasRendidasMonto.Text) > 0 Then

            otxtEfectivoEntregado.Enabled = False

            obutPrevisualizaEntregaRecaudacion.Visible = False
            obutReingresaRecaudado.Visible = True
            obutAltaRendicion.Visible = True

        Else
            olblValidacionMensajeError.Text = "Debe seleccionar una o mas cobranzas del vendedor seleccionado"

        End If


    End Sub


    Private Sub complemento()
        otxtAnticipoVendedor.Text = (Val(olblEfectivoRendidoMonto.Text) - Val(otxtEfectivoEntregado.Text)).ToString

    End Sub

    Protected Sub obutAltaRendicion_Click(sender As Object, e As EventArgs) Handles obutAltaRendicion.Click

        sorteoRendicionAlta()
        sorteoRendicionCobranza()
        sorteoRendicionAsiento()
        ogvrendicionSorteoCobranzaGlobal.DataBind()
        ogvrendicionSorteoCobranzaVendedor.DataBind()
        PanelVendedor.Visible = False
        PanelGlobal.Visible = True
        obutPrevisualizaEntregaRecaudacion.Visible = True
        obutReingresaRecaudado.Visible = False
        obutAltaRendicion.Visible = False
        otxtEfectivoEntregado.Enabled = True
        Response.Redirect("sorteoRendicionComprobante.aspx")
    End Sub

    Private Sub sorteoRendicionAlta()
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
                .CommandText = "sorteoRendicionAlta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperadorRecibe", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@idOperadorRinde", Data.SqlDbType.Int).SqlValue = olblIdOperador.Text
                cmd.Parameters.Add("@efectivoMonto", Data.SqlDbType.Float).SqlValue = olblEfectivoRendidoMonto.Text
                cmd.Parameters.Add("@efectivoComprobantes", Data.SqlDbType.Int).SqlValue = olblEfectivoRendidoComprobantes.Text
                cmd.Parameters.Add("@transferenciasMonto", Data.SqlDbType.Float).SqlValue = olblTransferenciasRendidasMonto.Text
                cmd.Parameters.Add("@transferenciasComprobantes", Data.SqlDbType.Int).SqlValue = olblTransferenciasrendidasComprobantes.Text
                cmd.Parameters.Add("@aCuentaVendedor", Data.SqlDbType.Float).SqlValue = otxtAnticipoVendedor.Text


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        Session.Item("idSorteoRendicion") = reader.Item("idSorteoRendicion")
                    End While
                End If
            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message
            End Try
            connection.Close()
        End Using

    End Sub

    Private Sub sorteoRendicionCobranza()
        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idSorteoTalonCobranza As Label
          Dim efectivoRinde As CheckBox
          Dim transferenciaRinde As CheckBox


        Dim fila As Integer
        

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "sorteoRendicionCobranzaAlta"
            End With


            For Each Row In ogvrendicionSorteoCobranzaVendedor.Rows
                Try
                    cmd.Parameters.Clear()

                    'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                    idSorteoTalonCobranza = CType(Row.FindControl("idSorteoTalonCobranza"), Label)
                      efectivoRinde = CType(Row.FindControl("efectivoRinde"), CheckBox)
                      transferenciaRinde = CType(Row.FindControl("transferenciaRinde"), CheckBox)

                    connection.Open()
                    cmd.Parameters.Add("@idSorteoRendicion", Data.SqlDbType.Int).SqlValue = Session("idSorteoRendicion")
                    cmd.Parameters.Add("@idSorteoTalonCobranza", Data.SqlDbType.Int).SqlValue = idSorteoTalonCobranza.Text
                    cmd.Parameters.Add("@efectivoRendido", Data.SqlDbType.Bit).SqlValue = efectivoRinde.Checked
                    cmd.Parameters.Add("@transferenciaRendida", Data.SqlDbType.Bit).SqlValue = transferenciaRinde.Checked




                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = ex.Message
                End Try
                connection.Close()



                fila = fila + 1

            Next
        End Using
    End Sub


    Private Sub sorteoRendicionAsiento()
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
                .CommandText = "sorteoRendicionAsiento"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idEmpresaOperador", Data.SqlDbType.Int).SqlValue = Session("idEmpresaOperador")
                cmd.Parameters.Add("@idSorteoRendicion", Data.SqlDbType.Int).SqlValue = Session("idSorteoRendicion")
               

                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read

                    End While
                End If
            Catch ex As Exception
                olblValidacionMensajeError.Text = ex.Message
            End Try
            connection.Close()
        End Using

    End Sub




    Protected Sub obutReingresaRecaudado_Click(sender As Object, e As EventArgs) Handles obutReingresaRecaudado.Click
        obutPrevisualizaEntregaRecaudacion.Visible = True
        obutReingresaRecaudado.Visible = False
        obutAltaRendicion.Visible = False
        otxtEfectivoEntregado.Enabled = True

    End Sub





End Class
