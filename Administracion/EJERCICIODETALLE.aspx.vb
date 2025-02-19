
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_EJERCICIODETALLE         

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblEJERCICIODETALLETitulo.text="PERIODOS DE UN EJERCICIO CONTABLE                                                                                                                                                                       "
otxtEJERCICIODETALLEFECHADESDE.Attributes.Add("readonly", "readonly")       
otxtEJERCICIODETALLEFECHADESDE.Text = Left(Date.Today.ToString, 10)        
otxtEJERCICIODETALLEFECHAHASTA.Attributes.Add("readonly", "readonly")       
otxtEJERCICIODETALLEFECHAHASTA.Text = Left(Date.Today.ToString, 10)        
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdEJERCICIODETALLE.Text = "0" 
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtEJERCICIODETALLECODIGO.text=       ""
otxtEJERCICIODETALLEDESCRIPCION.text=        ""
otxtEJERCICIODETALLEFECHADESDE.text=         ""
otxtEJERCICIODETALLEFECHAHASTA.text=         ""
otxtEJERCICIODETALLEESTADO.Checked=         0
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
         ogvEJERCICIODETALLE.DataBind()  
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvEJERCICIODETALLE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvEJERCICIODETALLE.SelectedIndexChanged                
  oddlEJERCICIO.SelectedValue = oddlEJERCICIOOperador.SelectedValue      
  oddlEJERCICIO.Enabled = False  
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdEJERCICIODETALLE.Text = ogvEJERCICIODETALLE.SelectedDataKey.Item("IDEJERCICIODETALLE")          
        oddlEJERCICIO.SelectedValue = ogvEJERCICIODETALLE.SelectedDataKey.Item("IDEJERCICIO")       
        otxtEJERCICIODETALLECODIGO.text = ogvEJERCICIODETALLE.SelectedDataKey.Item("EJERCICIODETALLECODIGO")                
        otxtEJERCICIODETALLEDESCRIPCION.text = ogvEJERCICIODETALLE.SelectedDataKey.Item("EJERCICIODETALLEDESCRIPCION")                  
        otxtEJERCICIODETALLEFECHADESDE.text = ogvEJERCICIODETALLE.SelectedDataKey.Item("EJERCICIODETALLEFECHADESDE")                    
        otxtEJERCICIODETALLEFECHAHASTA.text = ogvEJERCICIODETALLE.SelectedDataKey.Item("EJERCICIODETALLEFECHAHASTA")                    
        otxtEJERCICIODETALLEESTADO.Checked = ogvEJERCICIODETALLE.SelectedDataKey.Item("EJERCICIODETALLEESTADO")                  
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
                .CommandText = "EJERCICIODETALLEAM"   

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDEJERCICIODETALLE", Data.SqlDbType.Int).SqlValue = olblIDEJERCICIODETALLE.Text       
         cmd.Parameters.Add("@IDEJERCICIO", Data.SqlDbType.Int).SqlValue = oddlEJERCICIO.SelectedValue     
         cmd.Parameters.Add("@EJERCICIODETALLECODIGO", Data.SqlDbType.Char).SqlValue = otxtEJERCICIODETALLECODIGO.text              
         cmd.Parameters.Add("@EJERCICIODETALLEDESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtEJERCICIODETALLEDESCRIPCION.text                 
         cmd.Parameters.Add("@EJERCICIODETALLEFECHADESDE", Data.SqlDbType.Date).SqlValue = otxtEJERCICIODETALLEFECHADESDE.text                   
         cmd.Parameters.Add("@EJERCICIODETALLEFECHAHASTA", Data.SqlDbType.Date).SqlValue = otxtEJERCICIODETALLEFECHAHASTA.text                  
         cmd.Parameters.Add("@EJERCICIODETALLEESTADO", Data.SqlDbType.Bit).SqlValue = otxtEJERCICIODETALLEESTADO.Checked                
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