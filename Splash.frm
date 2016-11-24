VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.0#0"; "Codejock.Controls.v13.0.0.Demo.ocx"
Begin VB.Form frmSplash 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5250
   ClientLeft      =   225
   ClientTop       =   1380
   ClientWidth     =   7065
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "Splash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5250
   ScaleWidth      =   7065
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraSplash 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
      Height          =   6000
      Left            =   -270
      TabIndex        =   0
      Top             =   -120
      Width           =   7320
      Begin XtremeSuiteControls.PushButton PushButton1 
         Height          =   285
         Left            =   6000
         TabIndex        =   9
         Top             =   4680
         Width           =   1245
         _Version        =   851968
         _ExtentX        =   2196
         _ExtentY        =   503
         _StockProps     =   79
         Caption         =   "Entrar"
         UseVisualStyle  =   -1  'True
      End
      Begin VB.Timer tmrUnload 
         Interval        =   100
         Left            =   4860
         Top             =   2520
      End
      Begin XtremeSuiteControls.ProgressBar conteo 
         Height          =   120
         Left            =   1860
         TabIndex        =   8
         Top             =   4890
         Width           =   3735
         _Version        =   851968
         _ExtentX        =   6588
         _ExtentY        =   212
         _StockProps     =   93
         BackColor       =   16744576
         Min             =   1
         Max             =   25
         Scrolling       =   2
         Appearance      =   6
         UseVisualStyle  =   0   'False
         BarColor        =   255
      End
      Begin XtremeSuiteControls.PushButton PusLogin 
         Height          =   285
         Left            =   6000
         TabIndex        =   10
         Top             =   5010
         Width           =   1245
         _Version        =   851968
         _ExtentX        =   2196
         _ExtentY        =   503
         _StockProps     =   79
         Caption         =   "Login"
         UseVisualStyle  =   -1  'True
      End
      Begin VB.Label lblWGESTION 
         Alignment       =   2  'Center
         BackColor       =   &H00404040&
         BackStyle       =   0  'Transparent
         Caption         =   "WGESTION"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   345
         Left            =   5640
         TabIndex        =   7
         Top             =   630
         Width           =   1800
      End
      Begin VB.Label lblCompania 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Wheelwright Software Factory"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00404040&
         Height          =   330
         Left            =   1590
         TabIndex        =   4
         Top             =   870
         Width           =   5715
      End
      Begin VB.Label lblTipoVersion 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00400000&
         Height          =   330
         Left            =   240
         TabIndex        =   6
         Top             =   180
         Width           =   7020
      End
      Begin VB.Label lblCopyright 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Copyright © 2009,2010 WSF"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4230
         TabIndex        =   2
         Top             =   3330
         Width           =   3015
      End
      Begin VB.Label lblLicence 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Distributed under GPL"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4080
         TabIndex        =   1
         Top             =   3540
         Width           =   3165
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Versión"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   6375
         TabIndex        =   3
         Top             =   3150
         Width           =   840
      End
      Begin VB.Label lblDemo 
         BackStyle       =   0  'Transparent
         Height          =   885
         Left            =   0
         TabIndex        =   5
         Top             =   4380
         Width           =   7320
      End
      Begin VB.Image imgLogo 
         Height          =   6255
         Index           =   0
         Left            =   0
         Picture         =   "Splash.frx":1CFA
         Stretch         =   -1  'True
         Top             =   -60
         Width           =   7470
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Initialize()
If AppRunning Then
        vb.Unload Me
End If
End Sub

Private Function AppRunning() As Boolean
    If vb.App.PrevInstance Then
        MsgBox vb.App.EXEName & " ya se está ejecutando! ", vbCritical + vbSystemModal
        AppRunning = True
    End If
End Function



Private Sub Form_KeyPress(Keyascii As Integer)
    VerEntradaAlSistema
End Sub
Private Sub Form_Load()

  '  Call actualizar

    initPersonalizacion

    lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
    lblTipoVersion.Caption = LeerConfig(8)
    
    'Me.Show
    
    If CBool(LeerConfig(7)) = True Then
        'InitializeSystem
    End If
    
   ' Call controles  ' ejecuta controles
    
    
    
End Sub


Private Sub initPersonalizacion()
vAsientoAutomatico = LeerConfig(28)
End Sub

Private Sub fraSplash_Click()
    VerEntradaAlSistema
End Sub
Private Sub imgLogo_Click(Index As Integer)
    VerEntradaAlSistema
End Sub

Private Sub lblDescripcion_Click()
    VerEntradaAlSistema
End Sub

Private Sub ShoNombreDe_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

End Sub

Private Sub PushButton1_Click()
'Call actualizar
'frmPrincipal.Show
frmPrincipal.Show
End Sub

Private Sub PusLogin_Click()
frmLogin.Show
End Sub

Private Sub tmrUnload_Timer()
    Static Timeout As Integer
    Timeout = Timeout + 1
    conteo.Value = Timeout
    If Timeout >= 25 Then
        tmrUnload.Enabled = False
        VerEntradaAlSistema
        Unload Me
    Else
        Me.ZOrder
    End If
End Sub
Private Sub VerEntradaAlSistema()
On Error Resume Next

    Unload Me
    
    Select Case LeerConfig(6)
    
        Case "Auto"
                Call Login(LeerConfig(2), LeerConfig(4), LeerConfig(3), LeerConfig(5))
                'MsgBox ""
               
                'Call PushButton1_Click
                frmPrincipal.Show
               ' frmArticulos.Show
                Unload Me
               Exit Sub
     
        Case "Manual"
               frmLogin.Show
        Case Else
          frmPrincipal.Show
    End Select



If Err Then
'mensaje Err.Description
'MsgBox Err.Description
'GrabarLog "VerEntradaAlSistema", Err.Number & " " & Err.Description, Me.Caption
End If
End Sub
