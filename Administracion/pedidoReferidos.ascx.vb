
Partial Class Administracion_pedidoReferido

    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
        Else
            ogvPedidoReferido.DataBind()

        End If
    End Sub




    Protected Sub obutMostrar_Click(sender As Object, e As EventArgs) Handles obutMostrar.Click
        If ogvPedidoReferido.Visible = False Then
            ogvPedidoReferido.Visible = True
            obutMostrar.Text = " Ocultar frases de pedido de referidos."
        Else
            ogvPedidoReferido.Visible = False
            obutMostrar.Text = " Mostrar frases de pedido de referidos."
        End If
    End Sub
End Class
