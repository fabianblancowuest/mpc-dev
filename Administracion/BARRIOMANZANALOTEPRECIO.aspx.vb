Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_BARRIOMANZANALOTEPRECIO

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblBARRIOLOTETitulo.Text = "PRECIOS DE LOTES EN BARRIOS                                                                                                                                                                                        "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIOMANZANA.DataBind()
        oddlBARRIOMANZANA.SelectedValue = oddlBarrioManzanaOperador.SelectedValue
        oddlBARRIO.Enabled = False
        oddlBARRIOMANZANA.Enabled = False

        olblIdBARRIOLOTE.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtBARRIOLOTEPARCELA.Text = ""
        otxtBARRIOLOTEFRENTEMETROS.Text = ""
        otxtBARRIOLOTELADOIZQUIERDOMETROS.Text = ""
        otxtBARRIOLOTEFONDOMETROS.Text = ""
        otxtBARRIOLOTELADODERECHOMETROS.Text = ""
        otxtBARRIOLOTESUPERFICIE.Text = ""
        otxtSECUENCIA.Text = ""
        otxtBARRIOLOTEPRECIOREFERENCIABC.Text = ""
        otxtBARRIOLOTEADHESIONREFERENCIA.Text = ""
        otxtBARRIOLOTEESTADO.Checked = 0
        otxtBARRIOLOTEENVENTA.Checked = 0
        otxtBARRIOLOTEBONIFICADO.Checked = 0
        otxtPARCELACATASTRAL.Text = ""
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub


    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""
        nombreTablaAM()
        If Left(olblGestionCodigo.Text, 1) = "1" Then
            Panel1.Visible = True
            PanelAlta.Visible = False
            ogvBARRIOLOTE.DataBind()
           
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
        otxtPARCELACATASTRAL.text = ogvBARRIOLOTE.SelectedDataKey.Item("PARCELACATASTRAL")
        Panel1.Visible = False
        PanelAlta.Visible = True
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
                .CommandText = "BARRIOMANZANALOTEAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTE.Text
                cmd.Parameters.Add("@IDBARRIO", Data.SqlDbType.Int).SqlValue = oddlBARRIO.SelectedValue
                cmd.Parameters.Add("@IDBARRIOMANZANA", Data.SqlDbType.Int).SqlValue = oddlBARRIOMANZANA.SelectedValue
                cmd.Parameters.Add("@BARRIOLOTEPARCELA", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTEPARCELA.Text
                cmd.Parameters.Add("@BARRIOLOTEFRENTEMETROS", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTEFRENTEMETROS.Text
                cmd.Parameters.Add("@BARRIOLOTELADOIZQUIERDOMETROS", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTELADOIZQUIERDOMETROS.Text
                cmd.Parameters.Add("@BARRIOLOTEFONDOMETROS", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTEFONDOMETROS.Text
                cmd.Parameters.Add("@BARRIOLOTELADODERECHOMETROS", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTELADODERECHOMETROS.Text
                cmd.Parameters.Add("@BARRIOLOTESUPERFICIE", Data.SqlDbType.Char).SqlValue = otxtBARRIOLOTESUPERFICIE.Text.Replace(",", ".")

                cmd.Parameters.Add("@IDORIENTACION", Data.SqlDbType.Int).SqlValue = oddlORIENTACION.SelectedValue
                cmd.Parameters.Add("@SECUENCIA", Data.SqlDbType.Int).SqlValue = otxtSECUENCIA.Text
                cmd.Parameters.Add("@IDLOTETIPO", Data.SqlDbType.Int).SqlValue = oddlLOTETIPO.SelectedValue
                cmd.Parameters.Add("@IDCOSTOREFERENCIA", Data.SqlDbType.Int).SqlValue = oddlCOSTOREFERENCIA.SelectedValue
                cmd.Parameters.Add("@BARRIOLOTEPRECIOREFERENCIABC", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTEPRECIOREFERENCIABC.Text
                cmd.Parameters.Add("@BARRIOLOTEADHESIONREFERENCIA", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTEADHESIONREFERENCIA.Text
                cmd.Parameters.Add("@BARRIOLOTEESTADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOLOTEESTADO.Checked
                cmd.Parameters.Add("@BARRIOLOTEENVENTA", Data.SqlDbType.Bit).SqlValue = otxtBARRIOLOTEENVENTA.Checked
                cmd.Parameters.Add("@BARRIOLOTEBONIFICADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOLOTEBONIFICADO.Checked
                cmd.Parameters.Add("@PARCELACATASTRAL", Data.SqlDbType.Char).SqlValue = otxtPARCELACATASTRAL.Text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.Item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message
            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub oddlBARRIOOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIOOperador.SelectedIndexChanged

        oddlBarrioManzanaOperador.DataBind()
        ogvBARRIOLOTE.DataBind()
        oddlBARRIO.DataBind()
        oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue
        oddlBARRIO.Enabled = False


    End Sub

    Protected Sub oddlBarrioManzanaOperador_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaOperador.SelectedIndexChanged
        oddlBARRIOMANZANA.DataBind()

        oddlBARRIOMANZANA.SelectedValue = oddlBarrioManzanaOperador.SelectedValue
        oddlBARRIOMANZANA.Enabled = False
        ogvBARRIOLOTE.DataBind()
    End Sub

    Protected Sub oddlBARRIO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBARRIO.SelectedIndexChanged
        oddlBARRIOMANZANA.DataBind()
        olblBARRIOLOTETitulo.Text = oddlBARRIO.SelectedValue.ToString

    End Sub
End Class