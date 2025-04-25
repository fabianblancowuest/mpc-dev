Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_CENTROCOSTO         

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblCENTROCOSTOTitulo.text = "CENTROS DE COSTO                                                                                                                                                                                        "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCENTROCOSTO.Text = "0"  
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCENTROCOSTOCODIGO.text=       ""
otxtCENTROCOSTODESCRIPCION.text=        ""
otxtCENTROCOSTOEXPLICACION.text=        ""
otxtCENTROCOSTOESTADO.Checked=         0
otxtCENTROCOSTOIMPUTABLE.Checked=          0
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
         ogvCENTROCOSTO.DataBind()  
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCENTROCOSTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCENTROCOSTO.SelectedIndexChanged                 
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCENTROCOSTO.Text = ogvCENTROCOSTO.SelectedDataKey.Item("IDCENTROCOSTO")            
        otxtCENTROCOSTOCODIGO.text = ogvCENTROCOSTO.SelectedDataKey.Item("CENTROCOSTOCODIGO")                  
        otxtCENTROCOSTODESCRIPCION.text = ogvCENTROCOSTO.SelectedDataKey.Item("CENTROCOSTODESCRIPCION")                    
        otxtCENTROCOSTOEXPLICACION.text = ogvCENTROCOSTO.SelectedDataKey.Item("CENTROCOSTOEXPLICACION")                   
        otxtCENTROCOSTOESTADO.Checked = ogvCENTROCOSTO.SelectedDataKey.Item("CENTROCOSTOESTADO")                    
        otxtCENTROCOSTOIMPUTABLE.Checked = ogvCENTROCOSTO.SelectedDataKey.Item("CENTROCOSTOIMPUTABLE")                     
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
                .CommandText = "CENTROCOSTOAM"   

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCENTROCOSTO", Data.SqlDbType.Int).SqlValue = olblIDCENTROCOSTO.Text         
         cmd.Parameters.Add("@CENTROCOSTOCODIGO", Data.SqlDbType.Char).SqlValue = otxtCENTROCOSTOCODIGO.text                
         cmd.Parameters.Add("@CENTROCOSTODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCENTROCOSTODESCRIPCION.text                  
         cmd.Parameters.Add("@CENTROCOSTOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCENTROCOSTOEXPLICACION.text                
         cmd.Parameters.Add("@CENTROCOSTOESTADO", Data.SqlDbType.Bit).SqlValue = otxtCENTROCOSTOESTADO.Checked                 
         cmd.Parameters.Add("@CENTROCOSTOIMPUTABLE", Data.SqlDbType.Bit).SqlValue = otxtCENTROCOSTOIMPUTABLE.Checked                  
                reader = cmd.ExecuteReader

                If reader.HasRows Then
                    While reader.Read
                        olblGestionCodigo.text=reader.item("gestionCodigo")
                        olblGestionDescripcion.Text = reader.Item("gestionDescripcion")
                    End While
                End If
            Catch ex As Exception
                olblGestionDescripcion.Text = ex.Message

            End Try
            connection.Close()
        End Using
    End Sub
End Class 