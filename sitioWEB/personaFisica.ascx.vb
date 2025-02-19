
Partial Class sitioWEB_personaFisica
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
           
            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdPERSONAFISICA.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta"
        otxtPERSONAFISICACODIGO.text = ""
        otxtPERSONAFISICADESCRIPCION.text = ""
        otxtPERSONAFISICAAPELLIDO.text = ""
        otxtPERSONAFISICANOMBRES.text = ""
        otxtPERSONAFISICANACIMIENTOFECHA.text = ""
        otxtPERSONAFISICADOCUMENTONUMERO.text = ""
        otxtPERSONAFISICACUIT.text = ""
        otxtPERSONAFISICATELEFONONUMERO.text = ""
        otxtPERSONAFISICACORREOELECTRONICO.text = ""
        otxtPERSONAFISICABARRIO.text = ""
        otxtPERSONAFISICACALLE.text = ""
        otxtPERSONAFISICALOCALIDAD.text = ""
        otxtPERSONAFISICAPROFESION.text = ""
        otxtPERSONAFISICADOMICILIOLABORAL.text = ""
        Panel1.Visible = False
        PanelAlta.Visible = True
    End Sub

    Public Sub personaNumeroImpone(ByVal personaOrden As String)
        olblPersonaOrden.Text = personaOrden
        If personaOrden = "Comprador 1" Then
            obutPersonaDescartar.Visible = False

        End If
    End Sub
    Protected Sub obutAltaConfirmada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaConfirmada.Click

        olblGestionCodigo.Text = "0"
        olblGestionDescripcion.Text = ""
        nombreTablaAM()
        If Left(olblGestionCodigo.Text, 1) = "1" Then
            Panel1.Visible = False
            PanelAlta.Visible = False
            ogvPERSONAFISICA.DataBind()
            otxtPersonaSeleccionadaCodigo.Text = otxtPERSONAFISICACODIGO.Text
            otxtPersonaSeleccionadaDescripcion.Text = LTrim(RTrim(otxtPERSONAFISICAAPELLIDO.Text)) + " " + otxtPERSONAFISICANOMBRES.Text
            PanelPersona.Visible = True
        End If
    End Sub

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvPERSONAFISICA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvPERSONAFISICA.SelectedIndexChanged
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdPERSONAFISICA.Text = ogvPERSONAFISICA.SelectedDataKey.Item("IDPERSONAFISICA")
        otxtPERSONAFISICACODIGO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICACODIGO")
        otxtPERSONAFISICADESCRIPCION.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICADESCRIPCION")
        otxtPERSONAFISICAAPELLIDO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICAAPELLIDO")
        otxtPERSONAFISICANOMBRES.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICANOMBRES")
        otxtPERSONAFISICANACIMIENTOFECHA.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICANACIMIENTOFECHA")
        oddlPERSONAFISICADOCUMENTOTIPO.SelectedValue = ogvPERSONAFISICA.SelectedDataKey.Item("IDPERSONAFISICADOCUMENTOTIPO")
        otxtPERSONAFISICADOCUMENTONUMERO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICADOCUMENTONUMERO")
        otxtPERSONAFISICACUIT.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICACUIT")
        otxtPERSONAFISICATELEFONONUMERO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICATELEFONONUMERO")
        otxtPERSONAFISICACORREOELECTRONICO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICACORREOELECTRONICO")
        otxtPERSONAFISICABARRIO.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICABARRIO")
        otxtPERSONAFISICACALLE.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICACALLE")
        otxtPERSONAFISICALOCALIDAD.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICALOCALIDAD")
        otxtPERSONAFISICAPROFESION.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICAPROFESION")
        otxtPERSONAFISICADOMICILIOLABORAL.text = ogvPERSONAFISICA.SelectedDataKey.Item("PERSONAFISICADOMICILIOLABORAL")
        otxtPersonaSeleccionadaCodigo.Text = otxtPERSONAFISICACODIGO.Text
        otxtPersonaSeleccionadaDescripcion.Text = LTrim(RTrim(otxtPERSONAFISICAAPELLIDO.Text)) + " " + otxtPERSONAFISICANOMBRES.Text
        Panel1.Visible = False
        PanelPersona.Visible = True
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
                .CommandText = "PERSONAFISICAAM"

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
                cmd.Parameters.Add("@IDPERSONAFISICA", Data.SqlDbType.Int).SqlValue = olblIDPERSONAFISICA.Text
                cmd.Parameters.Add("@PERSONAFISICACODIGO", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICACODIGO.text
                cmd.Parameters.Add("@PERSONAFISICADESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICADESCRIPCION.text
                cmd.Parameters.Add("@PERSONAFISICAAPELLIDO", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICAAPELLIDO.text
                cmd.Parameters.Add("@PERSONAFISICANOMBRES", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICANOMBRES.text
                cmd.Parameters.Add("@PERSONAFISICANACIMIENTOFECHA", Data.SqlDbType.Date).SqlValue = otxtPERSONAFISICANACIMIENTOFECHA.Text
                cmd.Parameters.Add("@IDPERSONAFISICADOCUMENTOTIPO", Data.SqlDbType.Int).SqlValue = oddlPERSONAFISICADOCUMENTOTIPO.SelectedValue
                cmd.Parameters.Add("@PERSONAFISICADOCUMENTONUMERO", Data.SqlDbType.Float).SqlValue = otxtPERSONAFISICADOCUMENTONUMERO.text
                cmd.Parameters.Add("@PERSONAFISICACUIT", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICACUIT.text
                cmd.Parameters.Add("@PERSONAFISICATELEFONONUMERO", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICATELEFONONUMERO.text
                cmd.Parameters.Add("@PERSONAFISICACORREOELECTRONICO", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICACORREOELECTRONICO.text
                cmd.Parameters.Add("@PERSONAFISICABARRIO", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICABARRIO.text
                cmd.Parameters.Add("@PERSONAFISICACALLE", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICACALLE.text
                cmd.Parameters.Add("@PERSONAFISICALOCALIDAD", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICALOCALIDAD.text
                cmd.Parameters.Add("@PERSONAFISICAPROFESION", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICAPROFESION.text
                cmd.Parameters.Add("@PERSONAFISICADOMICILIOLABORAL", Data.SqlDbType.Char).SqlValue = otxtPERSONAFISICADOMICILIOLABORAL.text
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text = reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                        olblIDPERSONAFISICA.Text = reader.Item("idPersonaFisica")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub

    Protected Sub obutPersonaBuscar_Click(sender As Object, e As EventArgs) Handles obutPersonaBuscar.Click
        Panel1.Visible = True
        PanelPersona.Visible = False

    End Sub

    Public Function idPersonaFisica() As String
        Return olblIDPERSONAFISICA.Text

    End Function

    Protected Sub obutPersonaDescartar_Click(sender As Object, e As EventArgs) Handles obutPersonaDescartar.Click
        olblIDPERSONAFISICA.Text = "0"
        otxtPersonaSeleccionadaCodigo.Text = "Descartado"
        otxtPersonaSeleccionadaDescripcion.Text = "(Limpiar)"


    End Sub
End Class
