
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_BARRIOMANZANA          

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblBARRIOMANZANATitulo.text="MANZANAS EN BARRIOS                                                                                                                                                                                     "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdBARRIOMANZANA.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtBARRIOMANZANACODIGO.text=        ""
otxtBARRIOMANZANADESCRIPCION.text=         ""
otxtBARRIOMANZANAEXPLICACION.text=        ""
otxtBARRIOMANZANAESTADO.Checked=          0
otxtBARRIOMANZANAPRECIOBC.text=        ""
otxtBARRIOMANZANABONIFICACION.text=        ""
otxtBARRIOMANZANALOTEABLE.Checked=          0
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
         ogvBARRIOMANZANA.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvBARRIOMANZANA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIOMANZANA.SelectedIndexChanged                  
  oddlBARRIO.SelectedValue = oddlBARRIOOperador.SelectedValue      
  oddlBARRIO.Enabled = False  
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdBARRIOMANZANA.Text = ogvBARRIOMANZANA.SelectedDataKey.Item("IDBARRIOMANZANA")             
        oddlBARRIO.SelectedValue = ogvBARRIOMANZANA.SelectedDataKey.Item("IDBARRIO")        
        otxtBARRIOMANZANACODIGO.text = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANACODIGO")                   
        otxtBARRIOMANZANADESCRIPCION.text = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANADESCRIPCION")                     
        otxtBARRIOMANZANAEXPLICACION.text = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANAEXPLICACION")                    
        oddlBARRIOMANZANASTATUS.SelectedValue = ogvBARRIOMANZANA.SelectedDataKey.Item("IDBARRIOMANZANASTATUS")                    
        otxtBARRIOMANZANAESTADO.Checked = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANAESTADO")                     
        otxtBARRIOMANZANAPRECIOBC.text = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANAPRECIOBC")                    
        otxtBARRIOMANZANABONIFICACION.text = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANABONIFICACION")                    
        otxtBARRIOMANZANALOTEABLE.Checked = ogvBARRIOMANZANA.SelectedDataKey.Item("BARRIOMANZANALOTEABLE")                      
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
                .CommandText = "BARRIOMANZANAAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDBARRIOMANZANA", Data.SqlDbType.Int).SqlValue = olblIDBARRIOMANZANA.Text         
         cmd.Parameters.Add("@IDBARRIO", Data.SqlDbType.Int).SqlValue = oddlBARRIO.SelectedValue     
         cmd.Parameters.Add("@BARRIOMANZANACODIGO", Data.SqlDbType.Char).SqlValue = otxtBARRIOMANZANACODIGO.text                
         cmd.Parameters.Add("@BARRIOMANZANADESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtBARRIOMANZANADESCRIPCION.text                   
         cmd.Parameters.Add("@BARRIOMANZANAEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOMANZANAEXPLICACION.text                 
         cmd.Parameters.Add("@IDBARRIOMANZANASTATUS", Data.SqlDbType.Int).SqlValue = oddlBARRIOMANZANASTATUS.SelectedValue                
         cmd.Parameters.Add("@BARRIOMANZANAESTADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOMANZANAESTADO.Checked                  
         cmd.Parameters.Add("@BARRIOMANZANAPRECIOBC", Data.SqlDbType.Float).SqlValue = otxtBARRIOMANZANAPRECIOBC.text                 
         cmd.Parameters.Add("@BARRIOMANZANABONIFICACION", Data.SqlDbType.Float).SqlValue = otxtBARRIOMANZANABONIFICACION.text                 
         cmd.Parameters.Add("@BARRIOMANZANALOTEABLE", Data.SqlDbType.Bit).SqlValue = otxtBARRIOMANZANALOTEABLE.Checked                   
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text=reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
            olblGestionDescripcion.Text =ex.Message
            End Try
            connection.Close()
        End Using
    End Sub
End Class 