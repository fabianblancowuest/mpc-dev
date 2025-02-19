
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_EMPRESASECTOR           

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblEMPRESASECTORTitulo.text="SECTOR DE EMPRESA                                                                                                                                                                                       "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdEMPRESASECTOR.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtEMPRESASECTORCODIGO.text=         ""
otxtEMPRESASECTORDESCRIPCION.text=          ""
otxtEMPRESASECTOREXPLICACION.text=         ""
otxtEMPRESASECTORESTADO.Checked=           0
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
         ogvEMPRESASECTOR.DataBind()    
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvEMPRESASECTOR_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvEMPRESASECTOR.SelectedIndexChanged                    
  oddlEMPRESA.SelectedValue = oddlEMPRESAOperador.SelectedValue         
  oddlEMPRESA.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdEMPRESASECTOR.Text = ogvEMPRESASECTOR.SelectedDataKey.Item("IDEMPRESASECTOR")                
        oddlEMPRESA.SelectedValue = ogvEMPRESASECTOR.SelectedDataKey.Item("IDEMPRESA")             
        otxtEMPRESASECTORCODIGO.text = ogvEMPRESASECTOR.SelectedDataKey.Item("EMPRESASECTORCODIGO")                      
        otxtEMPRESASECTORDESCRIPCION.text = ogvEMPRESASECTOR.SelectedDataKey.Item("EMPRESASECTORDESCRIPCION")                        
        otxtEMPRESASECTOREXPLICACION.text = ogvEMPRESASECTOR.SelectedDataKey.Item("EMPRESASECTOREXPLICACION")                       
        otxtEMPRESASECTORESTADO.Checked = ogvEMPRESASECTOR.SelectedDataKey.Item("EMPRESASECTORESTADO")                        
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
                .CommandText = "EMPRESASECTORAM"     

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDEMPRESASECTOR", Data.SqlDbType.Int).SqlValue = olblIDEMPRESASECTOR.Text           
         cmd.Parameters.Add("@IDEMPRESA", Data.SqlDbType.Int).SqlValue = oddlEMPRESA.SelectedValue        
         cmd.Parameters.Add("@EMPRESASECTORCODIGO", Data.SqlDbType.Char).SqlValue = otxtEMPRESASECTORCODIGO.text                  
         cmd.Parameters.Add("@EMPRESASECTORDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtEMPRESASECTORDESCRIPCION.text                     
         cmd.Parameters.Add("@EMPRESASECTOREXPLICACION", Data.SqlDbType.Text).SqlValue = otxtEMPRESASECTOREXPLICACION.text                   
         cmd.Parameters.Add("@EMPRESASECTORESTADO", Data.SqlDbType.Bit).SqlValue = otxtEMPRESASECTORESTADO.Checked                    
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