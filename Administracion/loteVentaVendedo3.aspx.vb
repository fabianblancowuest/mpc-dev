Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_LOTEVENTAVENDEDO3

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Session.Item("idBarrioLote") = 1750
        Session.Item("idBarrio") = oddlBARRIO.SelectedValue
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblLOTEVENTATitulo.Text = "                                                                                                                                                                                                        "
            'otxtLOTEVENTAFECHAVISITA.Attributes.Add("readonly", "readonly")
            otxtLOTEVENTAFECHAVISITA.Text = Left(Date.Today.ToString, 10)
            otxtLOTEVENTAFECHACANCELACION.Text = Left(Date.Today.ToString, 10)
            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        oddlBARRIO.SelectedValue = oddlBarrioHabilitadoSelecciona.SelectedValue
        oddlBARRIO.Enabled = False

        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIDLOTEVENTA.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtLOTEVENTACODIGO.Text = ""
        otxtLOTEVENTADESCRIPCION.Text = ""
        otxtLOTEVENTAFECHAVISITA.Text = ""
        otxtLOTEVENTAFECHACANCELACION.Text = ""

        otxtLOTEVENTAADHESIONMONTO.Text = ""
        otxtLOTEVENTACUOTAMONTO.Text = ""
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
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub


    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""
        nombreTablaAM()
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


            oddlBARRIOLOTE.SelectedValue = oddlBARRIOLOTEOperador.SelectedValue
            oddlBARRIOLOTE.Enabled = False
            olblGestionDescripcion.Text = "Esperando accion de Operador"
            obutAltaConfirmada.Text = "Confirma Modificacion"
            obutAltaAbandonada.Text = "Abandona Modificacion"
            olblIDLOTEVENTA.Text = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTEVENTA")
            oddlBARRIOLOTE.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDBARRIOLOTE")
            otxtLOTEVENTACODIGO.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTACODIGO")
            otxtLOTEVENTADESCRIPCION.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEVENTADESCRIPCION")
            oddlBARRIO.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDBARRIO")
            oddlVENDEDOR.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDVENDEDOR")
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
            oddlLOTEDIMENSION.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTEDIMENSION")
            oddlCUOTASCANTIDAD.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDCUOTASCANTIDAD")
            oddlLOTETIPO.SelectedValue = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTETIPO")
            OTXTLOTEPRECIOBC.Text = ogvLOTEVENTA.SelectedDataKey.Item("LOTEPRECIOBC")
            OTXTCUOTABC.Text = ogvLOTEVENTA.SelectedDataKey.Item("CUOTABC")
            olblIDLOTEVENTA.Text = ogvLOTEVENTA.SelectedDataKey.Item("IDLOTEVENTA")
            Panel1.Visible = False
            PanelAlta.Visible = True

        Else
            olblMensajeValidacion.Text = "No pueden editarse los datos de las ventas de otro vendedor"
        End If
    End Sub

    Private Sub nombreTablaAM()
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
                .CommandText = "LOTEVENTAVENDEDORAMCONTRATOREVISION"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDLOTEVENTA", Data.SqlDbType.Int).SqlValue = olblIDLOTEVENTA.Text
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = oddlBARRIOLOTE.SelectedValue
                cmd.Parameters.Add("@LOTEVENTACODIGO", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTACODIGO.Text
                cmd.Parameters.Add("@LOTEVENTADESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtLOTEVENTADESCRIPCION.Text
                cmd.Parameters.Add("@IDBARRIO", Data.SqlDbType.Int).SqlValue = oddlBARRIO.SelectedValue
                cmd.Parameters.Add("@IDVENDEDOR", Data.SqlDbType.Int).SqlValue = oddlVENDEDOR.SelectedValue
                cmd.Parameters.Add("@LOTEVENTAFECHAVISITA", Data.SqlDbType.Date).SqlValue = otxtLOTEVENTAFECHAVISITA.Text
                cmd.Parameters.Add("@LOTEVENTAFECHACANCELACION", Data.SqlDbType.Date).SqlValue = otxtLOTEVENTAFECHACANCELACION.Text
                cmd.Parameters.Add("@LOTEVENTAADHESIONMONTO", Data.SqlDbType.Float).SqlValue = otxtLOTEVENTAADHESIONMONTO.Text
                cmd.Parameters.Add("@LOTEVENTACUOTAMONTO", Data.SqlDbType.Float).SqlValue = otxtLOTEVENTACUOTAMONTO.Text
                cmd.Parameters.Add("@CLIENTE01NOMBRE", Data.SqlDbType.Char).SqlValue = otxtCLIENTE01NOMBRE.Text
                cmd.Parameters.Add("@CLIENTE01DNI", Data.SqlDbType.Char).SqlValue = otxtCLIENTE01DNI.Text
                cmd.Parameters.Add("@CLIENTE01DOMICILIO", Data.SqlDbType.Char).SqlValue = otxtCLIENTE01DOMICILIO.Text
                cmd.Parameters.Add("@CLIENTE01TELEFONO", Data.SqlDbType.Char).SqlValue = otxtCLIENTE01TELEFONO.Text
                cmd.Parameters.Add("@CLIENTE02NOMBRE", Data.SqlDbType.Char).SqlValue = otxtCLIENTE02NOMBRE.Text
                cmd.Parameters.Add("@CLIENTE02DNI", Data.SqlDbType.Char).SqlValue = otxtCLIENTE02DNI.Text
                cmd.Parameters.Add("@CLIENTE02DOMICILIO", Data.SqlDbType.Char).SqlValue = otxtCLIENTE02DOMICILIO.Text
                cmd.Parameters.Add("@CLIENTE02TELEFONO", Data.SqlDbType.Char).SqlValue = otxtCLIENTE02TELEFONO.Text
                cmd.Parameters.Add("@IDCLIENTEIVA", Data.SqlDbType.Int).SqlValue = oddlCLIENTEIVA.SelectedValue
                cmd.Parameters.Add("@CLIENTECUIT", Data.SqlDbType.Char).SqlValue = otxtCLIENTECUIT.Text
                cmd.Parameters.Add("@IDLOTEDIMENSION", Data.SqlDbType.Int).SqlValue = oddlLOTEDIMENSION.SelectedValue
                cmd.Parameters.Add("@IDCUOTASCANTIDAD", Data.SqlDbType.Int).SqlValue = oddlCUOTASCANTIDAD.SelectedValue
                cmd.Parameters.Add("@IDLOTETIPO", Data.SqlDbType.Int).SqlValue = oddlLOTETIPO.SelectedValue
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
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub oddlBARRIOLOTEOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOLOTEOperador.SelectedIndexChanged
        Session.Item("idBarrioLote") = oddlBARRIOLOTEOperador.SelectedValue
        olblIDBarrioLoteOperador.Text = oddlBARRIOLOTEOperador.SelectedValue.ToString

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
End Class