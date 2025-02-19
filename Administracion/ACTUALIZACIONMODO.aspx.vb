
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_ACTUALIZACIONMODO          

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblACTUALIZACIONMODOTitulo.text="MODO DE ACTUALIZACION                                                                                                                                                                                   "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdACTUALIZACIONMODO.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtACTUALIZACIONMODOCODIGO.text=        ""
otxtACTUALIZACIONMODODESCRIPCION.text=         ""
otxtACTUALIZACIONMODOEXPLICACION.text=         ""
otxtACTUALIZACIONMODOCANTIDADMESES.text=           ""
otxtACTUALIZACIONMODOESTADO.Checked=          0
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
         ogvACTUALIZACIONMODO.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvACTUALIZACIONMODO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvACTUALIZACIONMODO.SelectedIndexChanged                   
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdACTUALIZACIONMODO.Text = ogvACTUALIZACIONMODO.SelectedDataKey.Item("IDACTUALIZACIONMODO")               
        otxtACTUALIZACIONMODOCODIGO.text = ogvACTUALIZACIONMODO.SelectedDataKey.Item("ACTUALIZACIONMODOCODIGO")                     
        otxtACTUALIZACIONMODODESCRIPCION.text = ogvACTUALIZACIONMODO.SelectedDataKey.Item("ACTUALIZACIONMODODESCRIPCION")                       
        otxtACTUALIZACIONMODOEXPLICACION.text = ogvACTUALIZACIONMODO.SelectedDataKey.Item("ACTUALIZACIONMODOEXPLICACION")                      
        otxtACTUALIZACIONMODOCANTIDADMESES.text = ogvACTUALIZACIONMODO.SelectedDataKey.Item("ACTUALIZACIONMODOCANTIDADMESES")                           
        otxtACTUALIZACIONMODOESTADO.Checked = ogvACTUALIZACIONMODO.SelectedDataKey.Item("ACTUALIZACIONMODOESTADO")                       
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
                .CommandText = "ACTUALIZACIONMODOAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDACTUALIZACIONMODO", Data.SqlDbType.Int).SqlValue = olblIDACTUALIZACIONMODO.Text           
         cmd.Parameters.Add("@ACTUALIZACIONMODOCODIGO", Data.SqlDbType.Char).SqlValue = otxtACTUALIZACIONMODOCODIGO.text                  
         cmd.Parameters.Add("@ACTUALIZACIONMODODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtACTUALIZACIONMODODESCRIPCION.text                    
         cmd.Parameters.Add("@ACTUALIZACIONMODOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtACTUALIZACIONMODOEXPLICACION.text                  
         cmd.Parameters.Add("@ACTUALIZACIONMODOCANTIDADMESES", Data.SqlDbType.Int).SqlValue = otxtACTUALIZACIONMODOCANTIDADMESES.text                      
         cmd.Parameters.Add("@ACTUALIZACIONMODOESTADO", Data.SqlDbType.Bit).SqlValue = otxtACTUALIZACIONMODOESTADO.Checked                   
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