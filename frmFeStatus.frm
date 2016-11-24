VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.0#0"; "Codejock.Controls.v13.0.0.Demo.ocx"
Object = "{757B5B41-998B-41F8-95D8-B90E12A1D40B}#222.0#0"; "WSAFIPFEOCX.ocx"
Begin VB.Form frmFeStatus 
   Caption         =   "FE Status"
   ClientHeight    =   5220
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9570
   LinkTopic       =   "Form1"
   ScaleHeight     =   5220
   ScaleWidth      =   9570
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox vnro2 
      Height          =   285
      Left            =   8400
      TabIndex        =   5
      Text            =   "vnro"
      Top             =   120
      Width           =   1125
   End
   Begin VB.TextBox vsucursal 
      Height          =   285
      Left            =   6090
      TabIndex        =   4
      Text            =   "Vsucursal"
      Top             =   120
      Width           =   945
   End
   Begin VB.TextBox vtipo 
      Height          =   285
      Left            =   3600
      TabIndex        =   3
      Text            =   "Vtipo"
      Top             =   120
      Width           =   945
   End
   Begin XtremeSuiteControls.PushButton PushButton1 
      Height          =   405
      Left            =   30
      TabIndex        =   1
      Top             =   30
      Width           =   795
      _Version        =   851968
      _ExtentX        =   1402
      _ExtentY        =   714
      _StockProps     =   79
      Caption         =   "Consultar"
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.ListBox logStatus 
      Height          =   4605
      Left            =   30
      TabIndex        =   0
      Top             =   630
      Width           =   9525
      _Version        =   851968
      _ExtentX        =   16801
      _ExtentY        =   8123
      _StockProps     =   77
      ForeColor       =   15591427
      BackColor       =   4210752
      BackColor       =   4210752
      Appearance      =   6
      UseVisualStyle  =   0   'False
   End
   Begin WSAFIPFEOCX.WSAFIPFEx vfe 
      Left            =   30
      Top             =   5070
      _ExtentX        =   2196
      _ExtentY        =   1879
   End
   Begin XtremeSuiteControls.PushButton PushButton2 
      Height          =   405
      Left            =   840
      TabIndex        =   2
      Top             =   30
      Width           =   585
      _Version        =   851968
      _ExtentX        =   1032
      _ExtentY        =   714
      _StockProps     =   79
      Caption         =   "Volver"
      UseVisualStyle  =   -1  'True
   End
   Begin VB.Label Label3 
      Caption         =   "Nro. Compr."
      Height          =   255
      Left            =   7200
      TabIndex        =   8
      Top             =   150
      Width           =   1125
   End
   Begin VB.Label Label2 
      Caption         =   "Sucursal: "
      Height          =   255
      Left            =   4800
      TabIndex        =   7
      Top             =   150
      Width           =   1125
   End
   Begin VB.Label Label1 
      Caption         =   "Tipo Doc AFIP:"
      Height          =   255
      Left            =   2220
      TabIndex        =   6
      Top             =   150
      Width           =   1125
   End
End
Attribute VB_Name = "frmFeStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public vnroFactA, vnroFactB As Long



Private Sub PushButton1_Click()
Call getStatusAfip
End Sub


Public Sub getStatusAfip(Optional ByRef vnfa, Optional ByRef vnfb)
On Error Resume Next

Dim vcantiIVA, vultimoNroComprobante, vPtoVta2 As Integer
Dim bResultado As Boolean
Dim cIdentificador, vsql, vultimoMensajeError As String
Dim v As Variant
Dim vDocAfip As Variant
Dim vmen As Variant

Screen.MousePointer = vbHourglass

' Documentación en: https://sites.google.com/site/facturaelectronicax/documentacion-wsfev1/wsfev1/wsfev1-metodos
v = Test
  
If Trim(LeerXml("modoFiscal")) = "1" Then
    bResultado = vfe.iniciar(1, Trim(LeerXml("vcuit")), App.Path + "\" + Trim(LeerXml("vcertificado")), App.Path + "\" + Trim(LeerXml("LicenciaWSAFIP")))
 Else
     bResultado = vfe.iniciar(0, Trim(LeerXml("vcuit")), App.Path + "\" + Trim(LeerXml("vcertificado")), "")
End If


'vsql = "select SucursalDocVenta as c from configuracion limit 1"
vPtoVta2 = traerDatos2("select * from configuracion", "SucursalDocVenta", PathDBConfig)
'If vPtoVta2 = 0 Then vPtoVta2 = 2
bResultado = vfe.f1ObtenerTicketAcceso()

vultimoMensajeError = vfe.UltimoMensajeError
vnroFactA = vfe.f1CompUltimoAutorizado(vPtoVta2, 1)
vnroFactB = vfe.f1CompUltimoAutorizado(vPtoVta2, 6)

If Val(vtipo) > 0 Then
    vDocAfip = vfe.F1CompConsultar(vPtoVta2, Val(Me.vtipo), Val(Me.vnro2))
    vmen = vfe.F1DetalleCAEA
    vmen = vmen + "  ---- " + vfe.f1RespuestaCAEA
    vmen = vmen + vfe.F1RespuestaDetalleCae
    
    
    vfe.ArchivoXMLRecibido = "c:\recibido.xml"
     vfe.ArchivoXMLEnviado = "c:\enviado.xml"
     
     
    
End If

vnfa = vnroFactA
vnfb = vnroFactB

Me.logStatus.Clear

Me.logStatus.AddItem "Ultimo mensaje WS AFIP: " + vultimoMensajeError + Chr(13)
Me.logStatus.AddItem "Ultima Factura A: " + Str(vnroFactA)
Me.logStatus.AddItem "Ultima Factura B: " + Str(vnroFactB)

If Not vDocAfip = "" Then
    Me.logStatus.AddItem "__________________________________________"
     Me.logStatus.AddItem ""
    Me.logStatus.AddItem "Documento AFIP :  " + Trim(vDocAfip)
    Me.logStatus.AddItem "Documento AFIP :  " + vmen
    Me.logStatus.AddItem "__________________________________________"
End If

Screen.MousePointer = vbDefault

If Err < 0 Then
    'getNroCompAfip = 0
    Exit Sub
End If
End Sub

