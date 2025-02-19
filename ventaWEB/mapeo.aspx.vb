Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class ventaWEB_mapeo
    Inherits System.Web.UI.Page

    Protected Sub oddlBarrioTrae_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioTrae.SelectedIndexChanged
        obutVerMapa.Visible = False
        obutComoLlegar.Visible = False
        olblManzana.Text = "Barrio refresca manzana"
        olblLote.Text = "Barrio refresca Lote"
        oddlBarrioManzanaTrae.DataBind()
        oddlBarrioManzanaParcelaTrae.DataBind()
        olblLoteSeleccionado.Text = "Lote no seleccionado"
    End Sub

    Protected Sub oddlBarrioManzanaTrae_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaTrae.SelectedIndexChanged
        obutVerMapa.Visible = False
        obutComoLlegar.Visible = False
        oddlBarrioManzanaParcelaTrae.DataBind()
        olblLote.Text = "Manzana refresca lotes"
        olblLoteSeleccionado.Text = "Lote no seleccionado"
    End Sub

    Protected Sub oddlBarrioManzanaParcelaTrae_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oddlBarrioManzanaParcelaTrae.SelectedIndexChanged
        ogvLotePerimetro.DataBind()

        olblLote.Text = "Lote seleccionado "
        olblLoteSeleccionado.Text = oddlBarrioManzanaParcelaTrae.SelectedItem.ToString
        cerear()
        mapaMarcaBarrio()
        mapaMarcaManzana()
        mapaMarcaLote()
        mapaLotePin()

        PanelSeleccion.Visible = False
        PanelMapa.Visible = True

    End Sub


    Private Sub cerear()
        rptMarkers.Controls.Clear()
        rptMarkers2.Controls.Clear()
        rptMarkers3.Controls.Clear()
        rptMarkers4.Controls.Clear()
        rptMarkers5.Controls.Clear()
        rptMarkers6.Controls.Clear()
        rptMarkers7.Controls.Clear()
        rptMarkers8.Controls.Clear()
        rptMarkers9.Controls.Clear()
        rptMarkers10.Controls.Clear()
    End Sub


    Private Sub mapaMarcaBarrio()
        Dim connection As SqlConnection = New SqlConnection("Data Source=190.106.131.63;Initial Catalog=strsystem;Persist Security Info=True;User ID=sa;Password=Pgs179308236")
        Dim host_ip As String = Context.Request.UserHostAddress.ToString

        Dim dt As New DataTable
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand("exec mapaMarcaBarrio @idBarrio", connection)


        da.SelectCommand.Parameters.Add("@idBarrio", SqlDbType.Int, 100).Value = oddlBarrioTrae.SelectedValue

        da.Fill(dt)

        rptMarkers.DataSource = dt
        rptMarkers.DataBind()


    End Sub

    Private Sub mapaMarcaManzana()
        Dim connection As SqlConnection = New SqlConnection("Data Source=190.106.131.63;Initial Catalog=strsystem;Persist Security Info=True;User ID=sa;Password=Pgs179308236")
        Dim host_ip As String = Context.Request.UserHostAddress.ToString

        Dim dt As New DataTable
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand("exec mapaMarcaManzana @idManzana", connection)


        da.SelectCommand.Parameters.Add("@idManzana", SqlDbType.Int, 100).Value = oddlBarrioManzanaTrae.SelectedValue

        da.Fill(dt)

        rptMarkers2.DataSource = dt
        rptMarkers2.DataBind()

    End Sub


    Private Sub mapaMarcaLote()
        Dim connection As SqlConnection = New SqlConnection("Data Source=190.106.131.63;Initial Catalog=strsystem;Persist Security Info=True;User ID=sa;Password=Pgs179308236")
        Dim host_ip As String = Context.Request.UserHostAddress.ToString

        Dim dt As New DataTable
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand("exec mapaMarcaLote @idLote", connection)


        da.SelectCommand.Parameters.Add("@idLote", SqlDbType.Int, 100).Value = oddlBarrioManzanaParcelaTrae.SelectedValue

        da.Fill(dt)

        rptMarkers3.DataSource = dt
        rptMarkers3.DataBind()

    End Sub

    Private Sub mapaLotePin()


        rptMarkersPin.Controls.Clear()

        Try


            Dim connection As SqlConnection = New SqlConnection("Data Source=190.106.131.63;Initial Catalog=strsystem;Persist Security Info=True;User ID=sa;Password=Pgs179308236")
            Dim host_ip As String = Context.Request.UserHostAddress.ToString

            Dim dt As New DataTable
            Dim da As New SqlDataAdapter()
            da.SelectCommand = New SqlCommand("exec mapaMarcaLotePin @idLote", connection)


            da.SelectCommand.Parameters.Add("@idLote", SqlDbType.Int, 100).Value = oddlBarrioManzanaParcelaTrae.SelectedValue

            da.Fill(dt)
            rptMarkersPin.DataSource = dt
            rptMarkersPin.DataBind()
            olblMensaje.Text = "relleno gua[u"
        Catch ex As Exception

            olblMensaje.Text = ex.Message
        End Try


    End Sub


    Protected Sub obutLoteVolver_Click(sender As Object, e As EventArgs) Handles obutLoteVolver.Click
        PanelSeleccion.Visible = True
        PanelMapa.Visible = False
        obutVerMapa.Visible = True
        obutComoLlegar.Visible = True

    End Sub

    Protected Sub obutVerMapa_Click(sender As Object, e As EventArgs) Handles obutVerMapa.Click
        PanelSeleccion.Visible = False
        PanelMapa.Visible = True

    End Sub

    Protected Sub obutComoLlegar_Click(sender As Object, e As EventArgs) Handles obutComoLlegar.Click
        Response.Redirect("https://www.google.com.ar/maps/@-26.1872965,-58.1801719,18.5z?entry=ttu")

    End Sub
End Class
