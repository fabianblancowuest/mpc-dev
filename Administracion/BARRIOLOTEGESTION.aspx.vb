Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_BARRIOLOTEGESTION


    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblBARRIOLOTETitulo.text = "LOTES EN BARRIOS                                                                                                                                                                                        "
            oddlBARRIOOperador.DataBind()
            oddlbarrioManzanaTraer.DataBind()

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub


    Protected Sub ogvBARRIOLOTE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIOLOTE.SelectedIndexChanged
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIO.Enabled = False
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        olblIDBARRIOLOTE.Text = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIOLOTE")
        oddlBARRIO.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIO")
        otxtBARRIOLOTEMANZANA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEMANZANA")
        otxtBARRIOLOTEPARCELA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPARCELA")
        otxtBARRIOLOTEFRENTEMETROS.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFRENTEMETROS")
        otxtBARRIOLOTEFONDOMETROS.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFONDOMETROS")
        oddlCOSTOREFERENCIA.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDCOSTOREFERENCIA")
        otxtBARRIOLOTEPRECIOREFERENCIA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPRECIOREFERENCIA")
        otxtBARRIOLOTEADHESIONREFERENCIA.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEADHESIONREFERENCIA")
        otxtBARRIOLOTEIMAGEN.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEIMAGEN")
        imgBARRIOLOTEIMAGEN.ImageUrl = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEIMAGEN")
        otxtBARRIOLOTEESTADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEESTADO")
        otxtBARRIOLOTEENVENTA.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEENVENTA")
        otxtBARRIOLOTEBONIFICADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEBONIFICADO")
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub

   
    Protected Sub obutVarios_Click(sender As Object, e As EventArgs) Handles obutVarios.Click
        panelesInvisibles()

        PanelDatos01.Visible = True
        

    End Sub

    Protected Sub obutPropietario_Click(sender As Object, e As EventArgs) Handles obutPropietario.Click
        panelesInvisibles()
        PanelPropietario.Visible = True
        
    End Sub

    Protected Sub obutComprador_Click(sender As Object, e As EventArgs) Handles obutComprador.Click
        panelesInvisibles()
        PanelComprador.Visible = True

    End Sub

    Protected Sub odsBARRIOOperador_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles odsBARRIOOperador.Selecting
        oddlbarrioManzanaTraer.DataBind()

    End Sub

    Protected Sub obutAltaPropietario_Click(sender As Object, e As EventArgs) Handles obutAltaPropietario.Click
        olblIDBARRIOLOTEPROVEEDORTITULARIDAD.Text = "0"
        panelesInvisibles()

        PanelPropietarioAlta.Visible = True
    End Sub




    Private Sub propietarioAM()
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
                .CommandText = "BARRIOLOTEPROVEEDORTITULARIDADAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDBARRIOLOTEPROVEEDORTITULARIDAD", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTEPROVEEDORTITULARIDAD.Text
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTE.Text
                cmd.Parameters.Add("@IDPERSONA", Data.SqlDbType.Int).SqlValue = oddlPERSONA.SelectedValue
                cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE.Text
                cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION.Text
                cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO.Text
                cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADESTADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO.Checked
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.Text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblPropietarioMensajeTexto.Text = ex.Message + olblIDBARRIOLOTE.Text + "   ODDL " + oddlPERSONA.SelectedValue.ToString + " Operador " + Session("session_idOperador").ToString


            End Try
            connection.Close()
        End Using
    End Sub




    Protected Sub obutAltaConfirmada_Click(sender As Object, e As EventArgs) Handles obutAltaConfirmada.Click
        propietarioAM()
        ogvBARRIOLOTEPROVEEDORTITULARIDAD.DataBind()

    End Sub

    Protected Sub ogvBARRIOLOTEPROVEEDORTITULARIDAD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedIndexChanged
        olblIDBARRIOLOTEPROVEEDORTITULARIDAD.Text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("IDBARRIOLOTEPROVEEDORTITULARIDAD")
        oddlPERSONA.SelectedValue = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("IDPERSONA")
        otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE.Text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE")
        otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION.Text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION")
        otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO.Text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO")
        otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO.Checked = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADESTADO")
        PanelPropietarioAlta.Visible = True
    End Sub

    Protected Sub obutComisionExtra_Click(sender As Object, e As EventArgs) Handles obutComisionExtra.Click
        panelesInvisibles()
        PanelComisionExtra.Visible = True
        ogvBARRIOLOTECOMISIONEXTRA.DataBind()


    End Sub

    Protected Sub obutAltaBarrioLoteComisionExtra_Click(sender As Object, e As EventArgs) Handles obutAltaBarrioLoteComisionExtra.Click
        PanelComisionExtraAlta.Visible = True
        olblIDBARRIOLOTECOMISIONEXTRA.Text = "0"
    End Sub




    Private Sub barrioLoteComisionAltaAM()
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
                .CommandText = "BARRIOLOTECOMISIONEXTRAAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()

                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDBARRIOLOTECOMISIONEXTRA", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTECOMISIONEXTRA.Text
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTE.Text
                cmd.Parameters.Add("@BARRIOLOTECOMISIONEXTRAEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTECOMISIONEXTRAEXPLICACION.Text
                cmd.Parameters.Add("@BARRIOLOTECOMISIONEXTRAMONTO", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTECOMISIONEXTRAMONTO.Text
                cmd.Parameters.Add("@FECHAVIGENCIADESDE", Data.SqlDbType.DateTime).SqlValue = otxtFECHAVIGENCIADESDE.Text
                cmd.Parameters.Add("@FECHAVIGENCIAHASTA", Data.SqlDbType.DateTime).SqlValue = otxtFECHAVIGENCIAHASTA.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblBarrioLoteComisionExtraSQLCodigo.Text = reader.Item("gestionCodigo")
                        olblBarrioLoteComisionExtraSQLDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblBarrioLoteComisionExtraSQLDescripcion.Text = " id barrio lote comision extra " + olblIDBARRIOLOTECOMISIONEXTRA.Text + " id barrio lote:" + olblIDBARRIOLOTE.Text + " Mensaje de Error:" + ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutBarrioLoteComisionExtraAltaConfirmada_Click(sender As Object, e As EventArgs) Handles obutBarrioLoteComisionExtraAltaConfirmada.Click

        olblBarrioLoteComisionExtraSQLCodigo.Text = "0"
        olblBarrioLoteComisionExtraSQLDescripcion.Text = ""
        barrioLoteComisionAltaAM()
        If Left(olblBarrioLoteComisionExtraSQLCodigo.Text, 1) = "1" Then
            PanelComisionExtra.Visible = True
            PanelComisionExtraAlta.Visible = False
            ogvBARRIOLOTECOMISIONEXTRA.DataBind()
        End If
    End Sub

    Protected Sub ogvBARRIOLOTECOMISIONEXTRA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ogvBARRIOLOTECOMISIONEXTRA.SelectedIndexChanged

    End Sub


    Private Sub panelesInvisibles()
        PanelPropietario.Visible = False
        PanelComprador.Visible = False
        PanelComisionExtra.Visible = False
        PanelComisionExtraAlta.Visible = False
        PanelDatos01.Visible = False

    End Sub
End Class