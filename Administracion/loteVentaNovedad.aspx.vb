Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_loteVentaNovedad

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblBARRIOLOTETitulo.Text = "NOVEDADES DE LOTES EN BARRIOS  - CONTROL DOCUMENTACION                                                                                                                                                                                      "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub




   
    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvBARRIOLOTE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIOLOTE.SelectedIndexChanged
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIOMANZANA.SelectedValue = oddlBarrioManzanaOperador.SelectedValue

        oddlBARRIO.Enabled = False
        oddlBARRIOMANZANA.Enabled = False

        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdBARRIOLOTE.Text = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIOLOTE")
        oddlBARRIO.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIO")
        oddlBARRIOMANZANA.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDBARRIOMANZANA")
        otxtBARRIOLOTEPARCELA.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPARCELA")
        otxtBARRIOLOTEFRENTEMETROS.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFRENTEMETROS")
        otxtBARRIOLOTELADOIZQUIERDOMETROS.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTELADOIZQUIERDOMETROS")
        otxtBARRIOLOTEFONDOMETROS.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEFONDOMETROS")
        otxtBARRIOLOTELADODERECHOMETROS.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTELADODERECHOMETROS")
        otxtBARRIOLOTESUPERFICIE.Text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTESUPERFICIE")
        oddlORIENTACION.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDORIENTACION")
        otxtSECUENCIA.text = ogvBARRIOLOTE.SelectedDataKey.Item("SECUENCIA")
        oddlLOTETIPO.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDLOTETIPO")
        oddlCOSTOREFERENCIA.SelectedValue = ogvBARRIOLOTE.SelectedDataKey.Item("IDCOSTOREFERENCIA")
        otxtBARRIOLOTEPRECIOREFERENCIABC.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEPRECIOREFERENCIABC")
        otxtBARRIOLOTEADHESIONREFERENCIA.text = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEADHESIONREFERENCIA")
        otxtBARRIOLOTEESTADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEESTADO")
        otxtBARRIOLOTEENVENTA.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEENVENTA")
        otxtBARRIOLOTEBONIFICADO.Checked = ogvBARRIOLOTE.SelectedDataKey.Item("BARRIOLOTEBONIFICADO")
        otxtPARCELACATASTRAL.Text = ogvBARRIOLOTE.SelectedDataKey.Item("PARCELACATASTRAL")
        olblIdLoteVenta.Text = ogvBARRIOLOTE.SelectedDataKey.Item("idLoteVenta")

        If Val(olblIdLoteVenta.Text) <> 0 Then

            ogvloteVentaEstado.DataBind()

            Panel1.Visible = False
            PanelGrlla.Visible = True
        End If
    End Sub

   

    Protected Sub oddlBARRIOOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOOperador.SelectedIndexChanged
        ogvBARRIOLOTE.DataBind()
        oddlBARRIO.DataBind()
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIO.Enabled = False

        oddlBARRIOMANZANA.DataBind()
    End Sub

    Protected Sub oddlBarrioManzanaOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaOperador.SelectedIndexChanged
        oddlBARRIOMANZANA.DataBind()

        ogvBARRIOLOTE.DataBind()
        oddlBARRIOMANZANA.SelectedValue = oddlBarrioManzanaOperador.SelectedValue
        oddlBARRIOMANZANA.Enabled = False
    End Sub

    Protected Sub oddlBARRIO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIO.SelectedIndexChanged
        oddlBARRIOMANZANA.DataBind()
        olblBARRIOLOTETitulo.Text = oddlBARRIO.SelectedValue.ToString

    End Sub

    Protected Sub obutGrabarEstado_Click(sender As Object, e As EventArgs) Handles obutGrabarEstado.Click
        grabar()


    End Sub



    Private Sub grabar()
      
        ' Validación de valores recibidos contra monto a cancelar.

        Dim Settings As ConnectionStringSettings
        Dim reader As System.Data.SqlClient.SqlDataReader
        Dim errorMessages As New StringBuilder()

        Dim cmd As New System.Data.SqlClient.SqlCommand
        Settings = System.Configuration.ConfigurationManager.ConnectionStrings("STRSYSTEM")
        Dim connectionString As String = Settings.ConnectionString

        Dim Row As GridViewRow

        Dim idLoteVentaEstado As Label
        Dim idBarrioLoteVentaEstado As Label
        Dim ochLoteVentaEstado As CheckBox


        Dim fila As Integer

        olblValidacionMensajeError.Text = ""


        fila = 1
        Using connection As New System.Data.SqlClient.SqlConnection(connectionString)
            With cmd
                .Connection = connection
                .CommandType = Data.CommandType.StoredProcedure
                .CommandText = "loteVentaEstadoMovimientoGraba"
            End With


            For Each Row In ogvloteVentaEstado.Rows


                'olblValidacionMensaje.Text = LTrim(RTrim(olblValidacionMensaje.Text)) + "Por recuperar variables de grilla."
                idLoteVentaEstado = CType(Row.FindControl("idLoteVentaEstado"), Label)
                idBarrioLoteVentaEstado = CType(Row.FindControl("idBarrioLoteVentaEstado"), Label)
                ochLoteVentaEstado = CType(Row.FindControl("ochLoteVentaEstado"), CheckBox)



                Try
                    cmd.Parameters.Clear()
                    connection.Open()
                    cmd.Parameters.Add("@idLoteVentaEstado", Data.SqlDbType.Int).SqlValue = idLoteVentaEstado.Text
                    cmd.Parameters.Add("@idLoteVenta", Data.SqlDbType.Int).SqlValue = olblIdLoteVenta.Text
                    cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("idOperador")
                    cmd.Parameters.Add("@idBarrioLoteVentaEstado", Data.SqlDbType.Int).SqlValue = idBarrioLoteVentaEstado.Text
                    cmd.Parameters.Add("@estado", Data.SqlDbType.Bit).SqlValue = ochLoteVentaEstado.Checked





                    reader = cmd.ExecuteReader()


                Catch ex As Exception
                    olblValidacionMensajeError.Text = LTrim(RTrim(olblValidacionMensajeError.Text)) + " Error: " + ex.ToString

                End Try
                connection.Close()


                fila = fila + 1

            Next
        End Using
        ogvloteVentaEstado.DataBind()



    End Sub

    Protected Sub obutVolver_Click(sender As Object, e As EventArgs) Handles obutVolver.Click
        Panel1.Visible = True
        PanelGrlla.Visible = False
    End Sub

    Protected Sub obutActualizaYVuelve_Click(sender As Object, e As EventArgs) Handles obutActualizaYVuelve.Click
        grabar()
        Panel1.Visible = True
        ogvBARRIOLOTE.DataBind()
        PanelGrlla.Visible = False
    End Sub
End Class