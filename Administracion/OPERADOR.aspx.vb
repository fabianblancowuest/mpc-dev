
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_OPERADOR        

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblOPERADORTitulo.text = "OPERADORES DEL SISTEMA                                                                                                                                                                                  "
            otxtOPERADORULTIMOLOGIN.Attributes.Add("readonly", "readonly")
            otxtOPERADORULTIMOLOGIN.Text = Left(Date.Today.ToString, 10)

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdOPERADOR.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtOPERADORCODIGO.text=      ""
otxtOPERADORDESCRIPCION.text=       ""
otxtOPERADORPASSWORD.text=         ""
otxtOPERADOROBSERVACION.text=         ""
otxtOPERADORTERMINAL.text=      ""
otxtOPERADORULTIMOLOGIN.text=       ""
otxtOPERADORESTADO.Checked=        0
otxtESSUPERVISOR.Checked=      0
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
         ogvOPERADOR.DataBind() 
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvOPERADOR_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvOPERADOR.SelectedIndexChanged               
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdOPERADOR.Text = ogvOPERADOR.SelectedDataKey.Item("IDOPERADOR")         
        otxtOPERADORCODIGO.text = ogvOPERADOR.SelectedDataKey.Item("OPERADORCODIGO")               
        otxtOPERADORDESCRIPCION.text = ogvOPERADOR.SelectedDataKey.Item("OPERADORDESCRIPCION")                 
        otxtOPERADORPASSWORD.text = ogvOPERADOR.SelectedDataKey.Item("OPERADORPASSWORD")                   
        otxtOPERADOROBSERVACION.text = ogvOPERADOR.SelectedDataKey.Item("OPERADOROBSERVACION")                   
        otxtOPERADORTERMINAL.text = ogvOPERADOR.SelectedDataKey.Item("OPERADORTERMINAL")               
        otxtOPERADORULTIMOLOGIN.text = ogvOPERADOR.SelectedDataKey.Item("OPERADORULTIMOLOGIN")                
        otxtOPERADORESTADO.Checked = ogvOPERADOR.SelectedDataKey.Item("OPERADORESTADO")                 
        otxtESSUPERVISOR.Checked = ogvOPERADOR.SelectedDataKey.Item("ESSUPERVISOR")             
        oddlSUPERVISOR.SelectedValue = ogvOPERADOR.SelectedDataKey.Item("IDSUPERVISOR")           
        oddlSORTEOCOMISION.SelectedValue = ogvOPERADOR.SelectedDataKey.Item("IDSORTEOCOMISION")              
        oddlPERSONA.SelectedValue = ogvOPERADOR.SelectedDataKey.Item("IDPERSONA")          
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
                .CommandText = "OPERADORAM"  

                .Parameters.Clear()
            End With
            Try
                connection.Open()


                cmd.Parameters.Add("@IDOPERADOR", Data.SqlDbType.Int).SqlValue = olblIDOPERADOR.Text
                cmd.Parameters.Add("@OPERADORCODIGO", Data.SqlDbType.Char).SqlValue = otxtOPERADORCODIGO.Text
                cmd.Parameters.Add("@OPERADORDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtOPERADORDESCRIPCION.Text
                cmd.Parameters.Add("@OPERADORPASSWORD", Data.SqlDbType.Char).SqlValue = otxtOPERADORPASSWORD.Text
                cmd.Parameters.Add("@OPERADOROBSERVACION", Data.SqlDbType.Char).SqlValue = otxtOPERADOROBSERVACION.Text
                cmd.Parameters.Add("@OPERADORTERMINAL", Data.SqlDbType.Char).SqlValue = otxtOPERADORTERMINAL.Text
                cmd.Parameters.Add("@OPERADORULTIMOLOGIN", Data.SqlDbType.DateTime).SqlValue = otxtOPERADORULTIMOLOGIN.Text
                cmd.Parameters.Add("@OPERADORESTADO", Data.SqlDbType.Bit).SqlValue = otxtOPERADORESTADO.Checked
                cmd.Parameters.Add("@ESSUPERVISOR", Data.SqlDbType.Bit).SqlValue = otxtESSUPERVISOR.Checked
                cmd.Parameters.Add("@IDSUPERVISOR", Data.SqlDbType.Int).SqlValue = oddlSUPERVISOR.SelectedValue
                cmd.Parameters.Add("@IDSORTEOCOMISION", Data.SqlDbType.Int).SqlValue = oddlSORTEOCOMISION.SelectedValue
                cmd.Parameters.Add("@IDPERSONA", Data.SqlDbType.Int).SqlValue = oddlPERSONA.SelectedValue
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text=reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            End Try
            connection.Close()
        End Using
    End Sub
End Class 