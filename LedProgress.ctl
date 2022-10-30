VERSION 5.00
Begin VB.UserControl LedProgress 
   BackColor       =   &H80000009&
   ClientHeight    =   390
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   390
   ScaleWidth      =   4800
End
Attribute VB_Name = "LedProgress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Function CreateRoundRectRgn Lib "gdi32" (ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function SetWindowRgn Lib "user32" (ByVal hWnd As Long, ByVal hRgn As Long, ByVal bRedraw As Boolean) As Long
Private Declare Function RoundRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, ByVal X3 As Long, ByVal Y3 As Long) As Long
Private Declare Function DrawText Lib "user32.dll" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, ByRef lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function SetRect Lib "user32" (lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32.dll" (ByVal crColor As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function CreateFont Lib "gdi32.dll" Alias "CreateFontA" (ByVal H As Long, ByVal W As Long, ByVal E As Long, ByVal O As Long, ByVal W As Long, ByVal i As Long, ByVal u As Long, ByVal S As Long, ByVal C As Long, ByVal OP As Long, ByVal CP As Long, ByVal Q As Long, ByVal PAF As Long, ByVal F As String) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long

Private Const FW_NORMAL As Long = 400

Private Const DT_CENTER         As Long = &H1
Private Const DT_VCENTER        As Long = &H4
Private Const DT_SINGLELINE     As Long = &H20
Private Const DT_CALCRECT       As Long = &H400
Private Const DT_NOCLIP         As Long = &H100

Private Type RECT
    Left                        As Long
    Top                         As Long
    Right                       As Long
    Bottom                      As Long
End Type

Public Enum cOrientation
    ccOrientationHorizontal = 0
    ccOrientationVertical = 1
End Enum

Dim m_Orientation               As cOrientation
Dim m_Value                     As Integer
Dim m_ShowText                  As Boolean
Dim m_ZoneYellow                As Integer
Dim m_ZoneRed                   As Integer
Dim hFont As Long

Private Sub UserControl_Terminate()
    If hFont Then DeleteObject hFont
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Orientation", m_Orientation, ccOrientationHorizontal)
    Call PropBag.WriteProperty("ShowText", m_ShowText, False)
    Call PropBag.WriteProperty("Value", m_Value, 0)
    Call PropBag.WriteProperty("ZoneYellow", m_ZoneYellow, 70)
    Call PropBag.WriteProperty("ZoneRed", m_ZoneRed, 90)
End Sub


Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    m_Orientation = PropBag.ReadProperty("Orientation", ccOrientationHorizontal)
    m_ShowText = PropBag.ReadProperty("ShowText", False)
    m_Value = PropBag.ReadProperty("Value", 0)
    m_ZoneYellow = PropBag.ReadProperty("ZoneYellow", 70)
    m_ZoneRed = PropBag.ReadProperty("ZoneRed", 90)

    If m_Orientation = ccOrientationVertical Then
        hFont = CreateFont(-11, 0, 900, 0, FW_NORMAL, 0, 0, 0, 0, 0, 0, 0, 0, vbNullString)
    End If
    
End Sub


Private Sub UserControl_Initialize()
    m_ZoneYellow = 70
    m_ZoneRed = 90
End Sub


Public Property Get ZoneYellow() As Integer
    ZoneYellow = m_ZoneYellow
End Property

Public Property Let ZoneYellow(ByVal New_ZoneYellow As Integer)
    m_ZoneYellow = New_ZoneYellow
    PropertyChanged "ZoneYellow"
    Draw
End Property


Public Property Get ZoneRed() As Integer
    ZoneRed = m_ZoneRed
End Property


Public Property Let ZoneRed(ByVal New_ZoneRed As Integer)
    m_ZoneRed = New_ZoneRed
    PropertyChanged "ZoneRed"
    Draw
End Property


Public Property Get Orientation() As cOrientation
    Orientation = m_Orientation
End Property


Public Property Let Orientation(ByVal New_Orientacion As cOrientation)
    m_Orientation = New_Orientacion
    PropertyChanged "Orientation"
    Dim TempW As Single, TempH As Single
    
    TempW = UserControl.Width
    TempH = UserControl.Height
    
    If New_Orientacion = ccOrientationVertical Then
        UserControl.Width = TempH
        UserControl.Height = TempW
        If hFont Then DeleteObject hFont
        hFont = CreateFont(-11, 0, 900, 0, FW_NORMAL, 0, 0, 0, 0, 0, 0, 0, 0, vbNullString)
    Else
        UserControl.Width = TempH
        UserControl.Height = TempW
    End If
    
    Draw
End Property


Public Property Get ShowText() As Boolean
    ShowText = m_ShowText
End Property


Public Property Let ShowText(ByVal New_ShowText As Boolean)
    m_ShowText = New_ShowText
    PropertyChanged "ShowText"
    Draw
End Property


Public Property Get Value() As Integer
    Value = m_Value
End Property
Public Property Let Value(ByVal New_Value As Integer)
    m_Value = New_Value
    PropertyChanged "Value"
    Draw
End Property

Private Sub UserControl_Resize()
    Dim hReg As Long
    hReg = CreateRoundRectRgn(0, 0, UserControl.ScaleWidth + 1, UserControl.ScaleHeight + 1, 5, 5)
    SetWindowRgn UserControl.hWnd, hReg, False

    Draw
End Sub

Private Sub UserControl_Show()
    UserControl.ForeColor = RGB(190, 190, 190)
    UserControl.ScaleMode = 3
    UserControl_Resize
End Sub

Private Sub Draw()
    Dim Text As String
    Dim Luz As Single
    Dim H As Long, W As Long
    Dim hBrushG As Long, hBrushY As Long, hBrushR As Long
    Dim hBrushLightG As Long, hBrushLightY As Long, hBrushLightR As Long
    Dim v100 As Single, V70 As Single, V90 As Single, i As Long
    Dim Rec As RECT

    UserControl.AutoRedraw = True
    UserControl.Cls
    
    H = UserControl.ScaleHeight
    W = UserControl.ScaleWidth
    
    hBrushG = CreateSolidBrush(vbGreen)
    hBrushY = CreateSolidBrush(vbYellow)
    hBrushR = CreateSolidBrush(vbRed)
    
    hBrushLightG = CreateSolidBrush(RGB(120, 255, 120))
    hBrushLightY = CreateSolidBrush(RGB(255, 255, 130))
    hBrushLightR = CreateSolidBrush(RGB(255, 120, 120))
    
    If m_Orientation = ccOrientationHorizontal Then
            Luz = H / 2.5
            v100 = (W * m_Value) / 100
            SetRect Rec, 0, 0, v100, H
            FillRect UserControl.hdc, Rec, hBrushG
            SetRect Rec, 0, 2, v100, Luz
            FillRect UserControl.hdc, Rec, hBrushLightG
    
        If m_Value > ZoneYellow Then
             V70 = v100 - (W * (m_Value - ZoneYellow)) / 100
            SetRect Rec, V70, 0, v100, H
            FillRect UserControl.hdc, Rec, hBrushY
            SetRect Rec, V70, 2, v100, Luz
            FillRect UserControl.hdc, Rec, hBrushLightY
        End If
    
        If m_Value > m_ZoneRed Then
            V90 = v100 - (W * (m_Value - m_ZoneRed)) / 100
            SetRect Rec, V90, 0, v100, H
            FillRect UserControl.hdc, Rec, hBrushR
            SetRect Rec, V90, 2, v100, Luz
            FillRect UserControl.hdc, Rec, hBrushLightR
        End If
    
        For i = 1 To v100 Step 10
            UserControl.Line (i, H)-(i, 0), UserControl.BackColor, BF
        Next
        
        If m_ShowText Then
            UserControl.ForeColor = vbBlack
            Text = m_Value & " %"
            SetRect Rec, 0, 0, W, H
            DrawText UserControl.hdc, Text, Len(Text), Rec, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
        End If
        
        
    Else
        Luz = W / 2.5
        v100 = (H * m_Value) / 100
        SetRect Rec, 0, H - v100, W, H
        FillRect UserControl.hdc, Rec, hBrushG
        SetRect Rec, 2, H - v100, Luz, H
        FillRect UserControl.hdc, Rec, hBrushLightG
    
        If m_Value > ZoneYellow Then
            V70 = v100 - (H * (m_Value - ZoneYellow)) / 100
            SetRect Rec, 0, H - v100, W, H - V70
            FillRect UserControl.hdc, Rec, hBrushY
            SetRect Rec, 2, H - v100, Luz, H - V70
            FillRect UserControl.hdc, Rec, hBrushLightY
        End If
    
        If m_Value > m_ZoneRed Then
            V90 = v100 - (H * (m_Value - m_ZoneRed)) / 100
            SetRect Rec, 0, H - v100, W, H - V90
            FillRect UserControl.hdc, Rec, hBrushR
            SetRect Rec, 2, H - v100, Luz, H - V90
            FillRect UserControl.hdc, Rec, hBrushLightR
        End If
        
        For i = 1 To v100 Step 10
            UserControl.Line (0, H - i)-(W, H - i), UserControl.BackColor, BF
        Next
        
        If m_ShowText Then
            UserControl.ForeColor = vbBlack
            Text = m_Value & " %"
            SetRect Rec, 0, 0, 0, 0
            Call SelectObject(UserControl.hdc, hFont)
            DrawText UserControl.hdc, Text, Len(Text), Rec, DT_CALCRECT
            SetRect Rec, (W / 2) - (Rec.Bottom / 2), (H / 2) + (Rec.Right / 2), W, H
            DrawText UserControl.hdc, Text, Len(Text), Rec, DT_NOCLIP
        End If
        
        
    End If
    
    UserControl.ForeColor = RGB(190, 190, 190)
    RoundRect UserControl.hdc, 0, 0, W, H, 6, 6
    

    
    DeleteObject hBrushG
    DeleteObject hBrushY
    DeleteObject hBrushR
    
    DeleteObject hBrushLightG
    DeleteObject hBrushLightY
    DeleteObject hBrushLightR
    
    
    UserControl.AutoRedraw = False
    
End Sub


