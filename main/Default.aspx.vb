Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModal();", True)
    End Sub
End Class