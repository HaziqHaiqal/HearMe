Imports System
Imports System.Data.SqlClient
Imports System.Threading.Tasks
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin.Security
Imports Owin

Partial Public Class Manage
    Inherits System.Web.UI.Page
    Public unamePH, emailPH, pnPH As String
    Protected Property SuccessMessage() As String
        Get
            Return m_SuccessMessage
        End Get
        Private Set(value As String)
            m_SuccessMessage = value
        End Set
    End Property
    Private m_SuccessMessage As String

    Private Function HasPassword(manager As ApplicationUserManager) As Boolean
        Dim appUser = manager.FindById(User.Identity.GetUserId())
        Return (appUser IsNot Nothing AndAlso appUser.PasswordHash IsNot Nothing)
    End Function

    Protected Property HasPhoneNumber() As Boolean
        Get
            Return m_HasPhoneNumber
        End Get
        Private Set(value As Boolean)
            m_HasPhoneNumber = value
        End Set
    End Property
    Private m_HasPhoneNumber As Boolean

    Protected Property TwoFactorEnabled() As Boolean
        Get
            Return m_TwoFactorEnabled
        End Get
        Private Set(value As Boolean)
            m_TwoFactorEnabled = value
        End Set
    End Property
    Private m_TwoFactorEnabled As Boolean

    Protected Property TwoFactorBrowserRemembered() As String
        Get
            Return m_TwoFactorBrowserRemembered
        End Get
        Private Set(value As String)
            m_TwoFactorBrowserRemembered = value
        End Set
    End Property
    Private m_TwoFactorBrowserRemembered As String

    Public Property LoginsCount As Integer

    Protected Sub Page_Load() Handles Me.Load
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()

        HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()))

        ' Enable this after setting up two-factor authentientication
        'PhoneNumber.Text = If(manager.GetPhoneNumber(User.Identity.GetUserId()), String.Empty)

        TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId())

        LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count

        Dim authenticationManager = HttpContext.Current.GetOwinContext().Authentication

        If Not IsPostBack Then
            ' Determine the sections to render
            If HasPassword(manager) Then
                ChangePassword.Visible = True
            Else
                CreatePassword.Visible = True
                ChangePassword.Visible = False
            End If

            ' Render success message
            Dim message = Request.QueryString("m")
            If message IsNot Nothing Then
                ' Strip the query string from action
                Form.Action = ResolveUrl("~/Account/Manage")

                SuccessMessage = If(message = "ChangePwdSuccess", "Your password has been changed.",
                    If(message = "SetPwdSuccess", "Your password has been set.",
                    If(message = "RemoveLoginSuccess", "The account was removed.",
                    If(message = "AddPhoneNumberSuccess", "Phone number has been added",
                    If(message = "RemovePhoneNumberSuccess", "Phone number was removed", String.Empty)))))
                SuccessMessagePlaceHolder.Visible = Not String.IsNullOrEmpty(SuccessMessage)
            End If
        End If



        Dim TUser As IdentityUser = manager.FindById(User.Identity.GetUserId())

        emailPH = TUser.Email
        unamePH = TUser.UserName
        pnPH = TUser.PhoneNumber

        Dim script2 As String = "<script>$('#MainContent_Email').attr('placeholder', '" + emailPH + "');</script>"
        ClientScript.RegisterStartupScript(Me.GetType(), "alert2", script2)

        Dim script3 As String = "<script>$('#MainContent_uNameTxt').attr('placeholder', '" + unamePH + "');</script>"
        ClientScript.RegisterStartupScript(Me.GetType(), "alert3", script3)

        Dim script4 As String = "<script>$('#MainContent_PhoneNo').attr('placeholder', '" + pnPH + "');</script>"
        ClientScript.RegisterStartupScript(Me.GetType(), "alert4", script4)

    End Sub

    Private Sub AddErrors(result As IdentityResult)
        For Each [error] As String In result.Errors
            ModelState.AddModelError("", [error])
        Next
    End Sub

    ' Remove phonenumber from user
    Protected Sub RemovePhone_Click(sender As Object, e As EventArgs)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim signInManager = Context.GetOwinContext().Get(Of ApplicationSignInManager)()
        Dim result = manager.SetPhoneNumber(User.Identity.GetUserId(), Nothing)
        If Not result.Succeeded Then
            Return
        End If
        Dim userInfo = manager.FindById(User.Identity.GetUserId())
        If userInfo IsNot Nothing Then
            signInManager.SignIn(userInfo, isPersistent:=False, rememberBrowser:=False)
            Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess")
        End If
    End Sub

    ' DisableTwoFactorAuthentication
    Protected Sub TwoFactorDisable_Click(sender As Object, e As EventArgs)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        manager.SetTwoFactorEnabled(User.Identity.GetUserId(), False)

        Response.Redirect("/Account/Manage")
    End Sub

    'EnableTwoFactorAuthentication 
    Protected Sub TwoFactorEnable_Click(sender As Object, e As EventArgs)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        manager.SetTwoFactorEnabled(User.Identity.GetUserId(), True)

        Response.Redirect("/Account/Manage")
    End Sub
    Protected Sub btnUpdate_click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim myconn As SqlConnection
        Dim idcommand As SqlCommand
        Dim reader As SqlDataReader
        Dim idquery, serializedResult As String
        Dim count As Integer
        'Dim arr(1) As String
        ' Dim time As DateTime
        Dim datadate As String, cb As String, NO3 As String, NO2 As String, DO2 As String, watertemp As String, waterhard As String
        ' Dim adaketak As SiteMaster

        ' Dim datedata = New List(Of FarmData)()
        Dim CS As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("DefaultConnection")
        Dim connectionString As String = CS.ConnectionString

        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim TUser As IdentityUser = manager.FindById(User.Identity.GetUserId())

        TUser.Email = Email.Text
        TUser.UserName = uNameTxt.Text
        TUser.PhoneNumber = PhoneNo.Text


        manager.Update(TUser)

        Dim prop As String = Master.adagambar

        If prop = True Then

            Update()
        Else
            Upload()
        End If
    End Sub
    Sub Upload()
        Dim myconn As SqlConnection
        Dim idcommand As SqlCommand
        Dim reader As SqlDataReader
        Dim CS As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("DefaultConnection")
        Dim connectionString As String = CS.ConnectionString
        myconn = New SqlConnection(connectionString)
        Dim guid As Guid = Guid.NewGuid()
        Dim id As String = User.Identity.GetUserId()

        If wizard.HasFile Then
            Dim strname As String = wizard.FileName.ToString()
            wizard.PostedFile.SaveAs(Server.MapPath("~/upload/") & strname)
            myconn.Open()
            Dim cmd As SqlCommand = New SqlCommand("insert into userpicture values(@guid,@id, @imgstr)", myconn)
            cmd.Parameters.AddWithValue("@guid", guid.ToString)
            cmd.Parameters.AddWithValue("@id", id)
            cmd.Parameters.AddWithValue("@imgstr", strname)
            cmd.ExecuteNonQuery()


            myconn.Close()
            'Label1.Visible = True
            'Label1.Text = "Image Uploaded successfully"
            'txtname.Text = ""
        Else
            'Label1.Visible = True
            'Label1.Text = "Plz upload the image!!!!"
        End If
    End Sub
    Sub Update()
        Dim myconn As SqlConnection
        Dim idcommand As SqlCommand
        Dim reader As SqlDataReader
        Dim CS As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("DefaultConnection")
        Dim connectionString As String = CS.ConnectionString
        myconn = New SqlConnection(connectionString)
        Dim guid As Guid = Guid.NewGuid()
        Dim id As String = User.Identity.GetUserId()
        Try
            If wizard.HasFile Then
                Dim strname As String = wizard.FileName.ToString()
                wizard.PostedFile.SaveAs(Server.MapPath("~/upload/") & strname)
                myconn.Open()
                Dim cmd As SqlCommand = New SqlCommand("UPDATE userpicture SET image = '" & strname & "' WHERE uid=@id;", myconn)
                cmd.Connection = myconn
                cmd.Parameters.AddWithValue("@id", id)
                cmd.ExecuteNonQuery()


                myconn.Close()
                'Label1.Visible = True
                'Label1.Text = "Image Uploaded successfully"
                'txtname.Text = ""
                'MsgBox("Image Updated")
            Else
                'Label1.Visible = True
                'Label1.Text = "Plz upload the image!!!!"
            End If
        Catch ex As SqlException
            MsgBox(ex.Message)
        Finally
            myconn.Dispose()

        End Try
    End Sub

End Class


