
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_COMPROBANTETIPO           

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblCOMPROBANTETIPOTitulo.text="                                                                                                                                                                                                        "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCOMPROBANTETIPO.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCOMPROBANTETIPOCODIGO.text=         ""
otxtCOMPROBANTETIPODESCRIPCION.text=          ""
otxtCOMPROBANTETIPOLETRA.text=        ""
otxtCOMPROBANTETIPOPUNTO.text=        ""
otxtCOMPROBANTETIPOEXPLICACION.text=         ""
otxtCOMPROBANTETIPOESTADO.Checked=           0
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
         ogvCOMPROBANTETIPO.DataBind()    
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCOMPROBANTETIPO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCOMPROBANTETIPO.SelectedIndexChanged                    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCOMPROBANTETIPO.Text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("IDCOMPROBANTETIPO")                
        otxtCOMPROBANTETIPOCODIGO.text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPOCODIGO")                      
        otxtCOMPROBANTETIPODESCRIPCION.text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPODESCRIPCION")                        
        otxtCOMPROBANTETIPOLETRA.text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPOLETRA")                    
        otxtCOMPROBANTETIPOPUNTO.text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPOPUNTO")                     
        otxtCOMPROBANTETIPOEXPLICACION.text = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPOEXPLICACION")                       
        oddlEMPRESASECTOR.SelectedValue = ogvCOMPROBANTETIPO.SelectedDataKey.Item("IDEMPRESASECTOR")                  
        otxtCOMPROBANTETIPOESTADO.Checked = ogvCOMPROBANTETIPO.SelectedDataKey.Item("COMPROBANTETIPOESTADO")                        
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
                .CommandText = "COMPROBANTETIPOAM"     

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCOMPROBANTETIPO", Data.SqlDbType.Int).SqlValue = olblIDCOMPROBANTETIPO.Text           
         cmd.Parameters.Add("@COMPROBANTETIPOCODIGO", Data.SqlDbType.Char).SqlValue = otxtCOMPROBANTETIPOCODIGO.text                  
         cmd.Parameters.Add("@COMPROBANTETIPODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCOMPROBANTETIPODESCRIPCION.text                     
         cmd.Parameters.Add("@COMPROBANTETIPOLETRA", Data.SqlDbType.Char).SqlValue = otxtCOMPROBANTETIPOLETRA.text                 
         cmd.Parameters.Add("@COMPROBANTETIPOPUNTO", Data.SqlDbType.Int).SqlValue = otxtCOMPROBANTETIPOPUNTO.text                 
         cmd.Parameters.Add("@COMPROBANTETIPOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCOMPROBANTETIPOEXPLICACION.text                   
         cmd.Parameters.Add("@IDEMPRESASECTOR", Data.SqlDbType.Int).SqlValue = oddlEMPRESASECTOR.SelectedValue              
         cmd.Parameters.Add("@COMPROBANTETIPOESTADO", Data.SqlDbType.Bit).SqlValue = otxtCOMPROBANTETIPOESTADO.Checked                    
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