
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_VENTAPLAZO        

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblVENTAPLAZOTitulo.text="PLAZOS DE VENTA                                                                                                                                                                                         "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdVENTAPLAZO.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtVENTAPLAZOCODIGO.text=      ""
otxtVENTAPLAZODESCRIPCION.text=       ""
otxtVENTAPLAZOMESES.text=      ""
otxtVENTAPLAZOESTADO.Checked=        0
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
         ogvVENTAPLAZO.DataBind() 
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvVENTAPLAZO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvVENTAPLAZO.SelectedIndexChanged               
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdVENTAPLAZO.Text = ogvVENTAPLAZO.SelectedDataKey.Item("IDVENTAPLAZO")         
        otxtVENTAPLAZOCODIGO.text = ogvVENTAPLAZO.SelectedDataKey.Item("VENTAPLAZOCODIGO")              
        otxtVENTAPLAZODESCRIPCION.text = ogvVENTAPLAZO.SelectedDataKey.Item("VENTAPLAZODESCRIPCION")                
        otxtVENTAPLAZOMESES.text = ogvVENTAPLAZO.SelectedDataKey.Item("VENTAPLAZOMESES")               
        otxtVENTAPLAZOESTADO.Checked = ogvVENTAPLAZO.SelectedDataKey.Item("VENTAPLAZOESTADO")                 
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
                .CommandText = "VENTAPLAZOAM"  

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDVENTAPLAZO", Data.SqlDbType.Int).SqlValue = olblIDVENTAPLAZO.Text      
         cmd.Parameters.Add("@VENTAPLAZOCODIGO", Data.SqlDbType.Char).SqlValue = otxtVENTAPLAZOCODIGO.text             
         cmd.Parameters.Add("@VENTAPLAZODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtVENTAPLAZODESCRIPCION.text                
         cmd.Parameters.Add("@VENTAPLAZOMESES", Data.SqlDbType.Int).SqlValue = otxtVENTAPLAZOMESES.text             
         cmd.Parameters.Add("@VENTAPLAZOESTADO", Data.SqlDbType.Bit).SqlValue = otxtVENTAPLAZOESTADO.Checked               
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