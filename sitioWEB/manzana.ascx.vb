
Partial Class sitioWEB_manzana
    Inherits System.Web.UI.UserControl

    Public Sub color(ByVal color As Integer)
        If color = 1 Then
            PanelManzana.BackColor = Drawing.Color.Aqua
        End If

        If color = 2 Then
            PanelManzana.BackColor = Drawing.Color.Yellow
        End If

        If color = 3 Then
            PanelManzana.BackColor = Drawing.Color.WhiteSmoke
        End If

    End Sub


End Class
