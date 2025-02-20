Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_LOTEVENTAVENDEDOR22

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Session.Item("idBarrioLote") = 1750
        Session.Item("idBarrio") = oddlBarrioHabilitadoSelecciona.SelectedValue
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            calFechaCancelacionProbable.SelectedDate = Date.Today
            otxtFechaCancelacionProbable.Text = Date.Today



            olblLOTEVENTATitulo.Text = "                                                                                                                                                                                                        "
            'otxtLOTEVENTAFECHAVISITA.Attributes.Add("readonly", "readonly")
            otxtLOTEVENTAFECHAVISITA.Text = Left(Date.Today.ToString, 10)
            otxtLOTEVENTAFECHACANCELACION.Text = Left(Date.Today.ToString, 10)
            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIDLOTEVENTA.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtLOTEVENTACODIGO.Text = ""
        otxtLOTEVENTADESCRIPCION.Text = ""
        otxtLOTEVENTAFECHAVISITA.Text = ""
        otxtLOTEVENTAFECHACANCELACION.Text = ""

        otxtLOTEVENTAADHESIONMONTO.Text = ""
        otxtLOTEVENTACUOTAMONTO.TEXT = ""
        otxtCLIENTE01NOMBRE.Text = ""
        otxtCLIENTE01DNI.Text = ""
        otxtCLIENTE01DOMICILIO.Text = ""
        otxtCLIENTE01TELEFONO.Text = ""
        otxtCLIENTE02NOMBRE.Text = ""
        otxtCLIENTE02DNI.Text = ""
        otxtCLIENTE02DOMICILIO.Text = ""
        otxtCLIENTE02TELEFONO.Text = ""
        otxtCLIENTECUIT.Text = ""
        OTXTLOTEPRECIOBC.Text = "0"
        OTXTCUOTABC.Text = "0"
        OTXTCUOTABC.Text = "9999999"
        cargarLote()
        OTXTCUOTABC.Text = "9999999"
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub


    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""

        If Left(olblGestionCodigo.Text, 1) = "1" Then
            ogvLOTEVENTA.DataBind()
            PanelAlta.Visible = False
            PanelDocumentacion.Visible = True
            olblCLIENTE01NOMBRE.Text = otxtCLIENTE01NOMBRE.Text
            olblCLIENTE02NOMBRE.Text = otxtCLIENTE02NOMBRE.Text

            persona1DocumentoAnverso.inicializa(olblIDLOTEVENTA, "1", olblCLIENTE01NOMBRE, "1")
            persona1DocumentoReverso.inicializa(olblIDLOTEVENTA, "2", olblCLIENTE01NOMBRE, "2")
            persona2DocumentoAnverso.inicializa(olblIDLOTEVENTA, "3", olblCLIENTE01NOMBRE, "1")
            persona2DocumentoReverso.inicializa(olblIDLOTEVENTA, "4", olblCLIENTE01NOMBRE, "2")
            consentimientoInformado.inicializa(olblIDLOTEVENTA, "5", olblCLIENTE01NOMBRE, "1")
            recibo1.inicializa(olblIDLOTEVENTA, "6", olblCLIENTE01NOMBRE, "2")
            transferencia1.inicializa(olblIDLOTEVENTA, "7", olblCLIENTE01NOMBRE, "1")
            recibo2.inicializa(olblIDLOTEVENTA, "8", olblCLIENTE01NOMBRE, "2")
            transferencia2.inicializa(olblIDLOTEVENTA, "9", olblCLIENTE01NOMBRE, "2")
            recibo3.inicializa(olblIDLOTEVENTA, "10", olblCLIENTE01NOMBRE, "1")
            transferencia3.inicializa(olblIDLOTEVENTA, "11", olblCLIENTE01NOMBRE, "2")


        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvLOTEVENTA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvLOTEVENTA.SelectedIndexChanged
        olblMensajeValidacion.Text = ""

        If Session("idOperador") = ogvLOTEVENTA.SelectedDataKey.Item("IDVENDEDOR") Then


            oddlBARRIOLOTEOperador.SelectedValue = oddlBARRIOLOTEOperador.SelectedValue
            oddlBARRIOLOTEOperador.Enabled = False
            olblGestionDescripcion.Text = "Esperando accion de Operador"
            obutAltaConfirmada.Text = "Confirma Modificacion"
            obutAltaAbandonada.Text = "Abandona Modificacion"
            olblIDLOTEVENTA.Text = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTEVENTA")
            oddlBARRIOLOTEOperador.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDBARRIOLOTE")
            otxtLOTEVENTACODIGO.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTACODIGO")
            otxtLOTEVENTADESCRIPCION.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTADESCRIPCION")
              otxtLOTEVENTAFECHAVISITA.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTAFECHAVISITA")
            otxtLOTEVENTAFECHACANCELACION.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTAFECHACANCELACION")
            otxtLOTEVENTAADHESIONMONTO.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTAADHESIONMONTO")
            otxtLOTEVENTACUOTAMONTO.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTACUOTAMONTO")

            otxtCLIENTE01NOMBRE.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE01NOMBRE")
            otxtCLIENTE01DNI.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE01DNI")
            otxtCLIENTE01DOMICILIO.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE01DOMICILIO")
            otxtCLIENTE01TELEFONO.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE01TELEFONO")
            otxtCLIENTE02NOMBRE.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE02NOMBRE")
            otxtCLIENTE02DNI.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE02DNI")
            otxtCLIENTE02DOMICILIO.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE02DOMICILIO")
            otxtCLIENTE02TELEFONO.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTE02TELEFONO")
            oddlCLIENTEIVA.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDCLIENTEIVA")
            otxtCLIENTECUIT.Text = ogvLOTEVENTA.SelectedDataKey.Item("CLIENTECUIT")
            oddlCUOTASCANTIDAD.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDCUOTASCANTIDAD")

            OTXTLOTEPRECIOBC.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEPRECIOBC")
            OTXTCUOTABC.Text = ogvLOTEVENTA.SelectedDataKey.Item("CUOTABC")
            olblIDLOTEVENTA.Text = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTEVENTA")
            If ogvLOTEVENTA.Rows.Count = 0 Then
                obutAlta.Visible = True
            Else
                obutAlta.Visible = false

            End If


            Panel1.Visible = False
            PanelAlta.Visible = True


        Else
            olblMensajeValidacion.Text = "No pueden editarse los datos de las ventas de otro vendedor"
        End If
    End Sub

    Private Sub loteVentaAltaConPrimerRecibo()
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
                .CommandText = "loteVentaAltaConPrimerRecibo"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDBARRIO", Data.SqlDbType.Int).SqlValue = oddlBarrioHabilitadoSelecciona.SelectedValue
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = oddlBARRIOLOTEOperador.SelectedValue
                cmd.Parameters.Add("@IDVENDEDOR", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@LOTEVENTAADHESIONMONTO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTAADHESIONMONTO.Text.Replace(",", ".")
                cmd.Parameters.Add("@LOTEVENTACUOTAMONTO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACUOTAMONTO.Text.Replace(",", ".")
                cmd.Parameters.Add("@IDCUOTASCANTIDAD", Data.SqlDbType.Int).SqlValue = oddlCUOTASCANTIDAD.SelectedValue
                cmd.Parameters.Add("@LOTEPRECIOBC", Data.SqlDbType.Char).SqlValue = OTXTLOTEPRECIOBC.Text.Replace(",", ".")
                cmd.Parameters.Add("@CUOTABC", Data.SqlDbType.Char).SqlValue = OTXTCUOTABC.Text.Replace(",", ".")


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblIDLOTEVENTA.Text = reader.Item("idLoteVenta")
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblReciboValidacionMensaje.Text = "error en alta de venta lote ////" + ex.Message + "/// BARRIO " + oddlBarrioHabilitadoSelecciona.SelectedValue.ToString + " Id Barrio Lote " + oddlBARRIOLOTEOperador.SelectedValue.ToString + " Monto adhesion " + otxtLOTEVENTAADHESIONMONTO.Text.Replace(",", ".") + "  Monto de cuota " + otxtLOTEVENTACUOTAMONTO.Text.Replace(",", ".") + " Precio Lote  BC " + OTXTLOTEPRECIOBC.Text.Replace(",", ".") + "  Cuota BC " + OTXTCUOTABC.Text.Replace(",", ".")
            End Try
            connection.Close()
        End Using

    End Sub

    Protected Sub oddlBARRIOLOTEOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOLOTEOperador.SelectedIndexChanged
        Session.Item("idBarrioLote") = oddlBARRIOLOTEOperador.SelectedValue
        ogvLOTEVENTA.DataBind()
        olblGrillaColumna.Text = ogvLOTEVENTA.Rows.Count.ToString


        If ogvLOTEVENTA.Rows.Count >= 1 Then
            obutAlta.Visible = False
        Else
            obutAlta.Visible = True

        End If
        oddlBarrioHabilitadoSelecciona.Visible = False
        oddlBarrioHabilitadoManzanaSelecciona.Visible = False
        oddlBARRIOLOTEOperador.Enabled = False
        olblSeleccionaBarrio.Visible = False
        olblSeleccionaManzana.Visible = False

        cargarLote()

        olblIDBarrioLoteOperador.Text = oddlBARRIOLOTEOperador.SelectedValue.ToString

    End Sub

    Private Sub cargarLote()
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
                .CommandText = "loteVentaCargaDatos"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idBarrioLote", Data.SqlDbType.Int).SqlValue = Session("idBarrioLote")
         
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        otxtLOTEVENTAADHESIONMONTO.Text = reader.Item("loteVentaAdhesionMonto")
                        OTXTLOTEPRECIOBC.Text = reader.Item("loteVentaPrecioLoteBC")
                        otxtbarrioManzanaBCPrecio.Text = reader.Item("barrioManzanaBCPrecio")
                        otxtloteDimension.Text = reader.Item("loteDimension")
                        otxtLoteSuperficie.Text = reader.Item("loteSuperficie")

                        otxtLoteTipoDescripcion.Text = reader.Item("loteTipoDescripcion")
                        olblloteVentaAdhesionMontoALetras.Text = reader.Item("loteVentaAdhesionMontoALetras")
                        olblBarrioManzanaParcelaSeleccionado.Text = reader.Item("barrioManzanaLoteSeleccionado")
                        

                    End While
                End If
            Catch ex As Exception

                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub
    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        otxtLOTEVENTAFECHAVISITA.Text = Calendar1.SelectedDate

    End Sub

    Protected Sub Calendar2_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar2.SelectionChanged
        otxtLOTEVENTAFECHACANCELACION.Text = Calendar2.SelectedDate

    End Sub

    Protected Sub oddlBarrioHabilitadoSelecciona_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioHabilitadoSelecciona.SelectedIndexChanged
        Session.Item("idBarrio") = oddlBarrioHabilitadoSelecciona.SelectedValue


    End Sub


    Protected Sub obutDocumentacionVolver_Click(sender As Object, e As EventArgs) Handles obutDocumentacionVolver.Click
        PanelAlta.Visible = True
        PanelDocumentacion.Visible = False
    End Sub

   
    Protected Sub oddlCUOTASCANTIDAD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlCUOTASCANTIDAD.SelectedIndexChanged
        If oddlCUOTASCANTIDAD.SelectedValue.ToString = "1" Then
            PanelCuotaValor.Visible = False
            PanelReserva.Visible = False

        Else
            cuotaValor()
            PanelReserva.Visible = True
            PanelCuotaValor.Visible = True

        End If
    End Sub

    Private Sub cuotaValor()
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
                .CommandText = "loteVentaCargaCuotaCantidad"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idBarrioLote", Data.SqlDbType.Int).SqlValue = Session("idBarrioLote")
                cmd.Parameters.Add("@idCuotaCantidad", Data.SqlDbType.Int).SqlValue = oddlCUOTASCANTIDAD.SelectedValue


                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        OTXTCUOTABC.Text = reader.Item("loteVentaCuotaBC")
                        otxtLOTEVENTACUOTAMONTO.Text = reader.Item("loteVentaCuotaMontoBC")
                        olblMontoCuotaEnLetras.Text = reader.Item("montoEnLetras")

                    End While
                End If
            Catch ex As Exception
                OTXTCUOTABC.Text = ex.Message
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutReserva_Click(sender As Object, e As EventArgs) Handles obutReserva.Click
        oddlCUOTASCANTIDAD.Enabled = False
        obutReserva.Visible = False
        obutReservaAbandona.Visible = False
        PanelReciboAsigna.Visible = True

    End Sub

    Protected Sub obutReciboValidaAlta_Click(sender As Object, e As EventArgs) Handles obutReciboValidaAlta.Click

        Dim totalCobranza As Double
        Dim totalEfectivo As Double
        Dim totalTransferencia As Double
        Dim saldoAdhesion As Double
        Dim habilita As Integer
        habilita = 0
        totalEfectivo = otxtReciboEfectivoMonto.Text
        totalTransferencia = otxtReciboTransferenciaMonto.Text

        totalCobranza = totalEfectivo + totalTransferencia
        Dim totalAdhesion As Double
        totalAdhesion = otxtLOTEVENTAADHESIONMONTO.Text

        olblReciboTotalIngresado.Text = totalCobranza.ToString
        habilita = 0

        If totalCobranza <= totalAdhesion Then
            If totalAdhesion = totalCobranza Then
                olblReciboValidacionMensaje.Text = "Cancelacion Total ."
                saldoAdhesion = 0
                habilita = 1
            Else
                olblReciboValidacionMensaje.Text = "Cancelacion parcial "
                saldoAdhesion = totalAdhesion - totalCobranza
                habilita = 1
            End If
            olblAdhesionSaldo.Text = saldoAdhesion.ToString
        Else
            olblReciboValidacionMensaje.Text = "Los valores ingresados exceden el monto de la adhesion."
            olblAdhesionSaldo.Text = "0"
        End If
        If totalCobranza < 50000 Then
            habilita = 0
            olblReciboValidacionMensaje.Text = "El recibo no debe ser de menos de $ 50.000 (pesos cincuenta mil )."
            calFechaCancelacionProbable.Visible = False

        End If
        If habilita = 1 Then
            otxtReciboEfectivoMonto.Enabled = False
            otxtReciboTransferenciaMonto.Enabled = False
            obutReciboConfirmaAlta.Visible = True
            obutReciboValidaAlta.Visible = False
            obutReciboReingresa.Visible = True
            If saldoAdhesion > 0 Then
                olblFechaCancelacionProbable.Visible = True
                otxtFechaCancelacionProbable.Enabled = False
                calFechaCancelacionProbable.Visible = True
            Else
                olblFechaCancelacionProbable.Visible = False

                otxtFechaCancelacionProbable.Visible = False
                otxtFechaCancelacionProbable.Enabled = False
                calFechaCancelacionProbable.Visible = False
            End If

        End If
    End Sub

    Protected Sub obutReciboReingresa_Click(sender As Object, e As EventArgs) Handles obutReciboReingresa.Click
        olblReciboValidacionMensaje.Text = ""
        obutReciboReingresa.Visible = False
        obutReciboValidaAlta.Visible = True
        obutReciboConfirmaAlta.Visible = False
        otxtReciboEfectivoMonto.Enabled = True
        otxtReciboTransferenciaMonto.Enabled = True
    End Sub

    Protected Sub calFechaCancelacionProbable_SelectionChanged(sender As Object, e As EventArgs) Handles calFechaCancelacionProbable.SelectionChanged
        otxtFechaCancelacionProbable.Text = calFechaCancelacionProbable.SelectedDate
    End Sub

    Protected Sub obutReciboConfirmaAlta_Click(sender As Object, e As EventArgs) Handles obutReciboConfirmaAlta.Click
        loteVentaAltaConPrimerRecibo()
        loteVentaReciboAsienta()

    End Sub


     

    Private Sub loteVentaReciboAsienta()
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
                .CommandText = "loteVentaReciboAsienta"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idRecibo", Data.SqlDbType.Int).SqlValue = oddlreciboOperadorAsignadoPendiente.SelectedValue
                cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIDLOTEVENTA.Text
                cmd.Parameters.Add("@reciboEfectivo", Data.SqlDbType.Text).SqlValue = otxtReciboEfectivoMonto.Text.Replace(",", ".")
                cmd.Parameters.Add("@reciboTransferencia", Data.SqlDbType.Text).SqlValue = otxtReciboTransferenciaMonto.Text.Replace(",", ".")



                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read


                    End While
                End If
            Catch ex As Exception
                olblReciboValidacionMensaje.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub
End Class