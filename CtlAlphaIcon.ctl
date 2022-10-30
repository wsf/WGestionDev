VERSION 5.00
Begin VB.UserControl AlphaIcon 
   BackStyle       =   0  'Transparent
   CanGetFocus     =   0   'False
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   DrawStyle       =   2  'Dot
   HasDC           =   0   'False
   PropertyPages   =   "CtlAlphaIcon.ctx":0000
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   ToolboxBitmap   =   "CtlAlphaIcon.ctx":001C
   Windowless      =   -1  'True
End
Attribute VB_Name = "AlphaIcon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' ----------------------------------------------------------------------------------
' Autor:     Leandro I. Ascierto
' Web:       www.leandroascierto.com.ar
' Fecha:     20 de septiembre de 2009
'
' Creditos:   Cobein(www.advancevb.com.ar), LaVolpe, Paul Caton, Steve McMahon(www.vbaccelerator.com), Frank Schüler(www.activevb.de)
' ----------------------------------------------------------------------------------

Private Declare Function RtlGetCompressionWorkSpaceSize Lib "NTDLL" (ByVal flags As Integer, WorkSpaceSize As Long, UNKNOWN_PARAMETER As Long) As Long
Private Declare Function NtAllocateVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, ByVal NumBits As Long, regionsize As Long, ByVal flags As Long, ByVal ProtectMode As Long) As Long
Private Declare Function RtlCompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, ByVal UNKNOWN_PARAMETER As Long, OutputSize As Long, ByVal WorkSpace As Long) As Long
Private Declare Function RtlDecompressBuffer Lib "NTDLL" (ByVal flags As Integer, ByVal BuffUnCompressed As Long, ByVal UnCompSize As Long, ByVal BuffCompressed As Long, ByVal CompBuffSize As Long, OutputSize As Long) As Long
Private Declare Function NtFreeVirtualMemory Lib "ntdll.dll" (ByVal ProcHandle As Long, BaseAddress As Long, regionsize As Long, ByVal flags As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef pDst As Any, ByRef pSrc As Any, ByVal ByteLen As Long)
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long
Private Declare Function CreateIconFromResourceEx Lib "user32.dll" (ByRef presbits As Any, ByVal dwResSize As Long, ByVal fIcon As Long, ByVal dwVer As Long, ByVal cxDesired As Long, ByVal cyDesired As Long, ByVal flags As Long) As Long
Private Declare Function DrawIconEx Lib "user32.dll" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function CopyIcon Lib "user32.dll" (ByVal hIcon As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Declare Function GetIconInfo Lib "user32.dll" (ByVal hIcon As Long, ByRef piconinfo As ICONINFO) As Long

Private Type ICONINFO
    fIcon           As Long
    xHotspot        As Long
    yHotspot        As Long
    hbmMask         As Long
    hbmColor        As Long
End Type

Private Const DI_MASK               As Long = &H1
Private Const DI_IMAGE              As Long = &H2
Private Const DI_NORMAL             As Long = DI_MASK Or DI_IMAGE
Private Const LR_DEFAULTCOLOR       As Long = &H0
Private Const LR_LOADFROMFILE       As Long = &H10
Private Const LR_LOADMAP3DCOLORS    As Long = &H1000
Private Const LR_SHARED             As Long = &H8000&
Private Const IMAGE_ICON            As Long = 1
Private Const ICONVERSION           As Long = &H30000

Public Event Click()
Public Event DblClick()
Public Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(Keyascii As Integer)
Public Event KeyUp(KeyCode As Integer, Shift As Integer)
Public Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)

Private c_lhWnd         As Long
Private c_bvData()      As Byte
Private m_IconWidth     As Long
Private m_IconHeight    As Long
Private hIcon           As Long
Private m_Stretch       As Boolean

Public Function LoadIcon(ByVal Address As String, ByVal Width As Long, ByVal Height As Long, Optional ByVal FromRes As Boolean = False) As Boolean
    If hIcon Then DestroyIcon hIcon
    hIcon = LoadImage(App.hInstance, Address, IMAGE_ICON, Width, Height, IIf(FromRes, LR_SHARED Or LR_LOADMAP3DCOLORS, LR_LOADFROMFILE))
    Me.IconWidth = Width
    Me.IconHeight = Height
    LoadIcon = hIcon <> 0
End Function

Public Property Get Icon() As Long
    Icon = hIcon
End Property

Public Property Let Icon(ByVal Value As Long)
    Dim II As ICONINFO
    If hIcon Then DestroyIcon hIcon
    hIcon = CopyIcon(Value)
    GetIconInfo hIcon, II
    Me.IconWidth = II.xHotspot * 2
    Me.IconHeight = II.yHotspot * 2
    UserControl_Paint
End Property

Public Property Let Stretch(ByVal Value As Boolean)
    m_Stretch = Value
    Call PropertyChanged("Stretch")
    UserControl_Resize
End Property

Public Property Get Stretch() As Boolean
    Stretch = m_Stretch
End Property

Public Property Let IconWidth(ByVal Value As Long)
    m_IconWidth = Value
    Call PropertyChanged("IconWidth")
    UserControl_Resize
End Property

Public Property Get IconWidth() As Long
    IconWidth = m_IconWidth
End Property

Public Property Let IconHeight(ByVal Value As Long)
    m_IconHeight = Value
    Call PropertyChanged("IconHeight")
    UserControl_Resize
End Property

Public Property Get IconHeight() As Long
    IconHeight = m_IconHeight
End Property

Friend Function ppgGetStream() As Byte()
    ppgGetStream = c_bvData
End Function

Friend Function ppgSetStream(ByRef bvData() As Byte)
    If hIcon <> 0 Then DestroyIcon hIcon
    hIcon = CreateIconFromResourceEx(bvData(0), UBound(bvData), 1, ICONVERSION, m_IconWidth, m_IconHeight, LR_DEFAULTCOLOR)
    Cls
    UserControl_Paint

    c_bvData = bvData
    Call PropertyChanged("bvData")
    UserControl_Resize
End Function

Private Sub UserControl_HitTest(x As Single, y As Single, HitResult As Integer)
HitResult = vbHitResultHit
End Sub

Private Sub UserControl_Paint()
On Error Resume Next
    If hIcon Then
        DrawIconEx UserControl.hdc, 0, 0, hIcon, UserControl.ScaleWidth / 15, UserControl.ScaleHeight / 15, 0, 0, DI_NORMAL
    Else
        If Not Ambient.UserMode Then
            UserControl.Line (0, 0)-(UserControl.ScaleWidth - 10, UserControl.ScaleHeight - 10), vbHighlight, B
        End If
    End If
If Err Then Exit Sub
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    On Error Resume Next
    Dim BuffCompress() As Byte
    With PropBag
        If CBool(.ReadProperty("bData", False)) Then
            BuffCompress() = .ReadProperty("bvData")
            m_IconWidth = .ReadProperty("IconWidth", 0)
            m_IconHeight = .ReadProperty("IconHeight", 0)
            Call DeCompress(BuffCompress, c_bvData)
            hIcon = CreateIconFromResourceEx(c_bvData(0), UBound(c_bvData), 1, ICONVERSION, m_IconWidth, m_IconHeight, LR_DEFAULTCOLOR)
        End If
        m_Stretch = .ReadProperty("Stretch", False)
    End With
    UserControl_Resize
End Sub

Private Sub UserControl_Resize()
    If m_Stretch = False Then
        If m_IconWidth > 0 Or m_IconHeight > 0 Then
            UserControl.Width = m_IconWidth * Screen.TwipsPerPixelX
            UserControl.Height = m_IconHeight * Screen.TwipsPerPixelY
        End If
    End If
End Sub

Private Sub UserControl_Terminate()
    If hIcon <> 0 Then DestroyIcon hIcon
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Dim BuffDesCompress() As Byte
    With PropBag
        If IsArrayDim(VarPtrArray(c_bvData)) Then
            Call Compress(c_bvData, BuffDesCompress)
            Call .WriteProperty("bvData", BuffDesCompress)
            Call .WriteProperty("bData", True)
        Else
            Call .WriteProperty("bData", False)
        End If
        Call .WriteProperty("IconHeight", m_IconHeight)
        Call .WriteProperty("IconWidth", m_IconWidth)
        Call .WriteProperty("Stretch", m_Stretch)
    End With
End Sub

Private Function IsArrayDim(ByVal lpArray As Long) As Boolean
    Dim lAddress    As Long
    Call CopyMemory(lAddress, ByVal lpArray, &H4)
    IsArrayDim = Not (lAddress = 0)
End Function

Public Function Compress(Data() As Byte, Out() As Byte) As Long
    Dim WorkSpaceSize As Long
    Dim WorkSpace As Long
    ReDim Out(UBound(Data) * 1.13 + 4)
    RtlGetCompressionWorkSpaceSize 2, WorkSpaceSize, 0
    NtAllocateVirtualMemory -1, WorkSpace, 0, WorkSpaceSize, 4096, 64
    RtlCompressBuffer 2, VarPtr(Data(0)), UBound(Data), VarPtr(Out(0)), (UBound(Data) * 1.13 + 4), 0, Compress, WorkSpace
    NtFreeVirtualMemory -1, WorkSpace, 0, 16384
    ReDim Preserve Out(Compress)
End Function
 
Public Function DeCompress(Data() As Byte, dest() As Byte) As Long
    If UBound(Data) Then
        ReDim dest(UBound(Data) * 12.5)
        RtlDecompressBuffer 2, VarPtr(dest(0)), (UBound(Data) * 12.5), VarPtr(Data(0)), UBound(Data), DeCompress
        ReDim Preserve dest(DeCompress)
    End If
End Function

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, x, y)
End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
    RaiseEvent OLEDragOver(Data, Effect, Button, Shift, x, y, State)
End Sub

Private Sub UserControl_Click()
    RaiseEvent Click
End Sub

Private Sub UserControl_DblClick()
    RaiseEvent DblClick
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub UserControl_KeyPress(Keyascii As Integer)
    RaiseEvent KeyPress(Keyascii)
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseMove(Button, Shift, x, y)
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseDown(Button, Shift, x, y)
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    RaiseEvent MouseUp(Button, Shift, x, y)
End Sub

