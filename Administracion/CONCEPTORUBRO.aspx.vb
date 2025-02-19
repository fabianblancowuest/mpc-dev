
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_CONCEPTORUBRO           

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblCONCEPTORUBROTitulo.text="RUBRO DE CONCEPTOS                                                                                                                                                                                      "
            
            'Tareas que se realizan en esta pagina por primer y única vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCONCEPTORUBRO.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCONCEPTORUBROCODIGO.text=         ""
otxtCONCEPTORUBRODESCRIPCION.text=          ""
otxtCONCEPTORUBROEXPLICACION.text=         ""
otxtCONCEPTORUBROCUENTADEBITA.Checked=            0
otxtCONCEPTORUBROESTADO.Checked=           0
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
         ogvCONCEPTORUBRO.DataBind()    
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCONCEPTORUBRO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCONCEPTORUBRO.SelectedIndexChanged                    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCONCEPTORUBRO.Text = ogvCONCEPTORUBRO.SelectedDataKey.Item("IDCONCEPTORUBRO")                
        otxtCONCEPTORUBROCODIGO.text = ogvCONCEPTORUBRO.SelectedDataKey.Item("CONCEPTORUBROCODIGO")                      
        otxtCONCEPTORUBRODESCRIPCION.text = ogvCONCEPTORUBRO.SelectedDataKey.Item("CONCEPTORUBRODESCRIPCION")                        
        otxtCONCEPTORUBROEXPLICACION.text = ogvCONCEPTORUBRO.SelectedDataKey.Item("CONCEPTORUBROEXPLICACION")                       
        otxtCONCEPTORUBROCUENTADEBITA.Checked = ogvCONCEPTORUBRO.SelectedDataKey.Item("CONCEPTORUBROCUENTADEBITA")                           
        otxtCONCEPTORUBROESTADO.Checked = ogvCONCEPTORUBRO.SelectedDataKey.Item("CONCEPTORUBROESTADO")                        
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
                .CommandText = "CONCEPTORUBROAM"     

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCONCEPTORUBRO", Data.SqlDbType.Int).SqlValue = olblIDCONCEPTORUBRO.Text           
         cmd.Parameters.Add("@CONCEPTORUBROCODIGO", Data.SqlDbType.Char).SqlValue = otxtCONCEPTORUBROCODIGO.text                  
         cmd.Parameters.Add("@CONCEPTORUBRODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCONCEPTORUBRODESCRIPCION.text                     
         cmd.Parameters.Add("@CONCEPTORUBROEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCONCEPTORUBROEXPLICACION.text                   
         cmd.Parameters.Add("@CONCEPTORUBROCUENTADEBITA", Data.SqlDbType.Bit).SqlValue = otxtCONCEPTORUBROCUENTADEBITA.Checked                       
         cmd.Parameters.Add("@CONCEPTORUBROESTADO", Data.SqlDbType.Bit).SqlValue = otxtCONCEPTORUBROESTADO.Checked                    
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