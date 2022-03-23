Imports System.Data.SqlClient
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.Owin

Public Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String
    Public showName As String
    'Public adagambar As Boolean
    Public m_bLoginRequired As Boolean = True

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' The code below helps to protect against XSRF attacks
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {
                 .HttpOnly = True,
                 .Value = _antiXsrfTokenValue
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim user As New System.Web.UI.Page
        Dim TUser As Microsoft.AspNet.Identity.EntityFramework.IdentityUser = manager.FindById(user.User.Identity.GetUserId())
        If TUser IsNot Nothing Then
            showName = TUser.UserName
        Else
            showName = "Guest"
        End If

    End Sub

    Public Property IsLoginRequired As Boolean
        Get
            Return m_bLoginRequired
        End Get
        Set(ByVal value As Boolean)
            m_bLoginRequired = value
        End Set
    End Property

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Set Anti-XSRF token
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validate the Anti-XSRF token
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
        If path = "/Account/Login" Then
            IsLoginRequired = False
        ElseIf path = "/Account/Register" Then
            IsLoginRequired = False
        ElseIf path = "/Account/RegisterExternalLogin" Then
            IsLoginRequired = False
        Else
            If IsLoginRequired = True Then
                If Not HttpContext.Current.User.Identity.IsAuthenticated Then
                    Response.Redirect("~/Account/Login")
                End If
            End If
        End If
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Dim myconn As SqlConnection
            Dim idcommand As SqlCommand
            Dim reader As SqlDataReader
            Dim idquery, serializedResult As String
            Dim count As Integer
            'Dim arr(1) As String
            ' Dim time As DateTime
            Dim datadate As String, cb As String, NO3 As String, NO2 As String, DO2 As String, watertemp As String, waterhard As String

            ' Dim datedata = New List(Of FarmData)()
            Dim CS As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("DefaultConnection")
            Dim connectionString As String = CS.ConnectionString

            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim getID = Page.User.Identity.GetUserId()

            Try

                myconn = New SqlConnection(connectionString)
                myconn.Open()
                Dim cmd As SqlCommand = New SqlCommand("SELECT image FROM userpicture where uid=@ID;", myconn)
                cmd.Parameters.AddWithValue("@ID", getID)

                reader = cmd.ExecuteReader
                While reader.Read
                    Dim script As String = "<script>$('#wizardPicturePreview').attr('src', '../upload/" & reader("image") & "').fadeIn('slow');</script>"
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script)


                    Dim script1 As String = "<script>$('#wizardPicturePreview1').attr('src', '../upload/" & reader("image") & "').fadeIn('slow');</script>"
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert1", script1)

                    adagambar = True

                End While
                'Label1.Visible = True
                'Label1.Text = "Image Uploaded successfully"
                'txtname.Text = ""

                myconn.Close()
            Catch ex As SqlException
                MsgBox(ex.Message)
                adagambar = False
            Finally
                myconn.Dispose()

            End Try
        End If
    End Sub

    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
    End Sub

    Public Property adagambar As Boolean
End Class