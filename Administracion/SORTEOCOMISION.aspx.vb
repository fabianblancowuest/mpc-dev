
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_SORTEOCOMISION          

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblSORTEOCOMISIONTitulo.text="MANTENIMIENTO DE COMISIONES POR SORTEO                                                                                                                                                                  "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdSORTEOCOMISION.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtSORTEOCOMISIONCODIGO.text=        ""
otxtSORTEOCOMISIONDESCRIPCION.text=         ""
otxtSORTEOCOMISIONEXPLICACION.text=        ""
otxtSORTEOCOMISIONESTADO.Checked=          0
otxtSORTEOCOMISIONLIQUIDACIONDIARIA.Checked=          0
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
         ogvSORTEOCOMISION.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvSORTEOCOMISION_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvSORTEOCOMISION.SelectedIndexChanged                  
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdSORTEOCOMISION.Text = ogvSORTEOCOMISION.SelectedDataKey.Item("IDSORTEOCOMISION")             
        otxtSORTEOCOMISIONCODIGO.text = ogvSORTEOCOMISION.SelectedDataKey.Item("SORTEOCOMISIONCODIGO")                   
        otxtSORTEOCOMISIONDESCRIPCION.text = ogvSORTEOCOMISION.SelectedDataKey.Item("SORTEOCOMISIONDESCRIPCION")                     
        otxtSORTEOCOMISIONEXPLICACION.text = ogvSORTEOCOMISION.SelectedDataKey.Item("SORTEOCOMISIONEXPLICACION")                    
        otxtSORTEOCOMISIONESTADO.Checked = ogvSORTEOCOMISION.SelectedDataKey.Item("SORTEOCOMISIONESTADO")                     
        otxtSORTEOCOMISIONLIQUIDACIONDIARIA.Checked = ogvSORTEOCOMISION.SelectedDataKey.Item("SORTEOCOMISIONLIQUIDACIONDIARIA")                      
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
                .CommandText = "SORTEOCOMISIONAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDSORTEOCOMISION", Data.SqlDbType.Int).SqlValue = olblIDSORTEOCOMISION.Text         
         cmd.Parameters.Add("@SORTEOCOMISIONCODIGO", Data.SqlDbType.Char).SqlValue = otxtSORTEOCOMISIONCODIGO.text                
         cmd.Parameters.Add("@SORTEOCOMISIONDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtSORTEOCOMISIONDESCRIPCION.text                   
         cmd.Parameters.Add("@SORTEOCOMISIONEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtSORTEOCOMISIONEXPLICACION.text                 
         cmd.Parameters.Add("@SORTEOCOMISIONESTADO", Data.SqlDbType.Bit).SqlValue = otxtSORTEOCOMISIONESTADO.Checked                  
         cmd.Parameters.Add("@SORTEOCOMISIONLIQUIDACIONDIARIA", Data.SqlDbType.Bit).SqlValue = otxtSORTEOCOMISIONLIQUIDACIONDIARIA.Checked                   
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