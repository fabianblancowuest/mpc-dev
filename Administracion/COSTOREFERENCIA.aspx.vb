
imports STRSYSTEM    
Partial Class STRSYSTEM_Administracion_COSTOREFERENCIA          

    Inherits System.Web.UI.Page

Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load       
        If Session("session_idOperador") Is Nothing Then
            Response.Redirect("~/Administracion/accesoFueraDeSesion.aspx")
        End If

        If IsPostBack Then
            ' Tareas que hay que realizar si se retorna a la Pagina desde 
    
        ELSE
          olblCOSTOREFERENCIATitulo.text="VALORES DE REFERENCIA POR PER�ODO CONTABLE                                                                                                                                                              "
            
            'Tareas que se realizan en esta pagina por primer y �nica vez
     
            'STRSYSTEM.accesoRolUsuarioActividadRegistro(Session("session_idOperador"), Session("session_paginaActual")) 

        End If
END sub  



    Protected Sub obutAlta_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAlta.Click  
       olblGestionDescripcion.Text = "Esperando accion Operador."

     olblIdCOSTOREFERENCIA.Text = "0"   
        obutAltaConfirmada.Text = "Confirma Alta "
        obutAltaAbandonada.Text = "Abandona Alta" 
otxtCOSTOREFERENCIACODIGO.text=        ""
otxtCOSTOREFERENCIADESCRIPCION.text=         ""
otxtCOSTOREFERENCIAEXPLICACION.text=         ""
otxtCOSTOREFERENCIAESTADO.Checked=          0
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
         ogvCOSTOREFERENCIA.DataBind()   
        End If
  End Sub 

    Protected Sub obutAltaAbandonada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles obutAltaAbandonada.Click      
        Panel1.Visible = True
        PanelAlta.Visible = False
    End Sub

    Protected Sub ogvCOSTOREFERENCIA_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ogvCOSTOREFERENCIA.SelectedIndexChanged                   
        olblGestionDescripcion.Text = "Esperando accion de Operador"
        obutAltaConfirmada.Text = "Confirma Modificacion"
        obutAltaAbandonada.Text = "Abandona Modificacion"
        olblIdCOSTOREFERENCIA.Text = ogvCOSTOREFERENCIA.SelectedDataKey.Item("IDCOSTOREFERENCIA")               
        otxtCOSTOREFERENCIACODIGO.text = ogvCOSTOREFERENCIA.SelectedDataKey.Item("COSTOREFERENCIACODIGO")                     
        otxtCOSTOREFERENCIADESCRIPCION.text = ogvCOSTOREFERENCIA.SelectedDataKey.Item("COSTOREFERENCIADESCRIPCION")                       
        otxtCOSTOREFERENCIAEXPLICACION.text = ogvCOSTOREFERENCIA.SelectedDataKey.Item("COSTOREFERENCIAEXPLICACION")                      
        otxtCOSTOREFERENCIAESTADO.Checked = ogvCOSTOREFERENCIA.SelectedDataKey.Item("COSTOREFERENCIAESTADO")                       
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
                .CommandText = "COSTOREFERENCIAAM"    

                .Parameters.Clear()
            End With
            Try
                connection.Open()


            cmd.Parameters.Add("@idOperador", Data.SqlDbType.Int).SqlValue = Session("session_idOperador")
            cmd.Parameters.Add("@IDCOSTOREFERENCIA", Data.SqlDbType.Int).SqlValue = olblIDCOSTOREFERENCIA.Text           
         cmd.Parameters.Add("@COSTOREFERENCIACODIGO", Data.SqlDbType.Char).SqlValue = otxtCOSTOREFERENCIACODIGO.text                  
         cmd.Parameters.Add("@COSTOREFERENCIADESCRIPCION", Data.SqlDbType.Char).SqlValue = otxtCOSTOREFERENCIADESCRIPCION.text                    
         cmd.Parameters.Add("@COSTOREFERENCIAEXPLICACION", Data.SqlDbType.Text).SqlValue = otxtCOSTOREFERENCIAEXPLICACION.text                  
         cmd.Parameters.Add("@COSTOREFERENCIAESTADO", Data.SqlDbType.Bit).SqlValue = otxtCOSTOREFERENCIAESTADO.Checked                   
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