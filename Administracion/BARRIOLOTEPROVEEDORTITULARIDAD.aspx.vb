Imports STRSYSTEM
Partial Class STRSYSTEM_Administracion_BARRIOLOTEPROVEEDORTITULARIDAD               

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblBARRIOLOTEPROVEEDORTITULARIDADTitulo.text = "TITULARIDAD DE LOTES                                                                                                                                                                                   "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
        olblGestionDescripcion.Text = "Esperando accion Operador."

        olblIdBARRIOLOTEPROVEEDORTITULARIDAD.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
        otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE.text = ""
        otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION.text = ""
        otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO.text = ""
        otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO.Checked = 0
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
         ogvBARRIOLOTEPROVEEDORTITULARIDAD.DataBind()        
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvBARRIOLOTEPROVEEDORTITULARIDAD_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedIndexChanged                             
  oddlBARRIOLOTE.SelectedValue = oddlBARRIOLOTEOperador.SelectedValue         
  oddlBARRIOLOTE.Enabled = False    
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdBARRIOLOTEPROVEEDORTITULARIDAD.Text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("IDBARRIOLOTEPROVEEDORTITULARIDAD")                             
        oddlBARRIOLOTE.SelectedValue = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("IDBARRIOLOTE")                 
        oddlPERSONA.SelectedValue = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("IDPERSONA")                 
        otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE.text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE")                                      
        otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION.text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION")                                    
        otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO.text = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO")                                                
        otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO.Checked = ogvBARRIOLOTEPROVEEDORTITULARIDAD.SelectedDataKey.Item("BARRIOLOTEPROVEEDORTITULARIDADESTADO")                                     
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
                .CommandText = "BARRIOLOTEPROVEEDORTITULARIDADAM"         

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDBARRIOLOTEPROVEEDORTITULARIDAD", Data.SqlDbType.Int).SqlValue = olblIDBARRIOLOTEPROVEEDORTITULARIDAD.Text                    
         cmd.Parameters.Add("@IDBARRIOLOTE", Data.SqlDbType.Int).SqlValue = oddlBARRIOLOTE.SelectedValue        
         cmd.Parameters.Add("@IDPERSONA", Data.SqlDbType.Int).SqlValue = oddlPERSONA.SelectedValue        
         cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE", Data.SqlDbType.Float).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADPORCENTAJE.text                              
         cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADEXPLICACION.text                            
         cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO", Data.SqlDbType.Text).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADDOCUMENTOPROBATORIO.text                                        
         cmd.Parameters.Add("@BARRIOLOTEPROVEEDORTITULARIDADESTADO", Data.SqlDbType.Bit).SqlValue = otxtBARRIOLOTEPROVEEDORTITULARIDADESTADO.Checked                             
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