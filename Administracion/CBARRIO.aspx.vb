
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_CBARRIO       

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 

        Else
            olblCBARRIOTitulo.text = "CONTENEDOR DE BARRIO                                                                                                                                                                                    "

            'Tareas que se realizan en esta pagina por primer y única vez

            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
    End Sub



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCBARRIO.Text = "0"
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCBARRIOCODIGO.text=     ""
otxtCBARRIODESCRIPCION.text=      ""
otxtCBARRIOEXPLICACION.text=     ""
otxtCBARRIOPLANO.text=    ""
otxtCBARRIOESTADO.Checked=       0
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
         ogvCBARRIO.DataBind()
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCBARRIO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCBARRIO.SelectedIndexChanged            
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCBARRIO.Text = ogvCBARRIO.SelectedDataKey.Item("IDCBARRIO")    
        otxtCBARRIOCODIGO.text = ogvCBARRIO.SelectedDataKey.Item("CBARRIOCODIGO")          
        otxtCBARRIODESCRIPCION.text = ogvCBARRIO.SelectedDataKey.Item("CBARRIODESCRIPCION")            
        otxtCBARRIOEXPLICACION.text = ogvCBARRIO.SelectedDataKey.Item("CBARRIOEXPLICACION")           
        otxtCBARRIOPLANO.text = ogvCBARRIO.SelectedDataKey.Item("CBARRIOPLANO")         
        otxtCBARRIOESTADO.Checked = ogvCBARRIO.SelectedDataKey.Item("CBARRIOESTADO")            
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
                .CommandText = "CBARRIOAM" 

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCBARRIO", Data.SqlDbType.Int).SqlValue = olblIDCBARRIO.Text   
         cmd.Parameters.Add("@CBARRIOCODIGO", Data.SqlDbType.Char).SqlValue = otxtCBARRIOCODIGO.text          
         cmd.Parameters.Add("@CBARRIODESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCBARRIODESCRIPCION.text             
         cmd.Parameters.Add("@CBARRIOEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCBARRIOEXPLICACION.text           
         cmd.Parameters.Add("@CBARRIOPLANO", Data.SqlDbType.Char).SqlValue = otxtCBARRIOPLANO.text          
         cmd.Parameters.Add("@CBARRIOESTADO", Data.SqlDbType.Bit).SqlValue = otxtCBARRIOESTADO.Checked            
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