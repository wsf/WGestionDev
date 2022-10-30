VERSION 5.00
Begin VB.UserControl cResizer 
   BackColor       =   &H80000001&
   ClientHeight    =   3180
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3855
   FillColor       =   &H80000005&
   ScaleHeight     =   3180
   ScaleWidth      =   3855
End
Attribute VB_Name = "cResizer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Author:  tbdomain@yahoo.com
'Free for redistribution...
'to use... put codes below in form

'// Sub form_load()
'//   cResizer.autoInit
'// End Sub
'// Sub form_resize()
'//   cResizer.autoResize
'// End Sub

'



Dim UserContainerName As String

'Property Variables:
Dim Ctl As ParentControls
Dim ctlWidth() As Long
Dim ctlLeft() As Long
Dim ctlTop() As Long
Dim ctlHeight() As Long
Dim Frm As Form
Dim ctlCount As Long
Dim m_sizeChildren As Boolean

Private Sub UserControl_AccessKeyPress(KeyAscii As Integer)
    Debug.Print "AccessKeyPress: " & KeyAscii
End Sub

Private Sub UserControl_AmbientChanged(PropertyName As String)
    If PropertyName = Null Or PropertyName = "" Then
        Debug.Print "AmbientChanged: all"
    Else
        Debug.Print "AmbientChanged: " & PropertyName
    End If
End Sub

Private Sub UserControl_AsyncReadComplete(PropertyValue As AsyncProperty)
    Debug.Print "AsyncReadComplete: " & PropertyValue.AsyncType & ", " & PropertyValue.PropertyName
End Sub

Private Sub UserControl_Click()
    Debug.Print "Click"
End Sub

Private Sub UserControl_DblClick()
    Debug.Print "DblClick"
End Sub

Private Sub UserControl_DragDrop(Source As Control, x As Single, y As Single)
    Debug.Print "DragDrop: " & Source.Name & ", " & x & ", " & y
End Sub

Private Sub UserControl_DragOver(Source As Control, x As Single, y As Single, State As Integer)
    Debug.Print "DragOver: " & Source.Name & ", " & x & ", " & y & ", " & State
End Sub

Private Sub UserControl_EnterFocus()
    Debug.Print "EnterFocus"
End Sub

Private Sub UserControl_ExitFocus()
    Debug.Print "ExitFocus"
End Sub

Private Sub UserControl_GotFocus()
    Debug.Print "GotFocus"
End Sub

Private Sub UserControl_Initialize()
    Debug.Print "Initialize"
End Sub

Private Sub UserControl_InitProperties()
    Debug.Print "InitProperties"
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
    Debug.Print "KeyDown: " & KeyCode & ", " & Shift
End Sub

Private Sub UserControl_KeyPress(KeyAscii As Integer)
    Debug.Print "KeyPress: " & KeyAscii
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    Debug.Print "KeyUp: " & KeyCode & ", " & Shift
End Sub

Private Sub UserControl_LostFocus()
    Debug.Print "LostFocus"
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Debug.Print "MouseDown: " & Button & ", " & Shift & ", " & x & ", " & y
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Debug.Print "MouseMove: " & Button & ", " & Shift & ", " & x & ", " & y
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Debug.Print "MouseUp: " & Button & ", " & Shift & ", " & x & ", " & y
End Sub

Private Sub UserControl_OLECompleteDrag(Effect As Long)
    Debug.Print "OLECompleteDrag: " & Effect
End Sub

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    Debug.Print "OLEDragDrop: " & Effect & ", " & Button & ", " & x & ", " & y
End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
    Debug.Print "OLEDragOver: " & Effect & ", " & Button & ", " & x & ", " & y
End Sub

Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
    Debug.Print "OLEGiveFeedback: " & Effect & ", " & DefaultCursors
End Sub

Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)
    Debug.Print "OLESetData: " & DataFormat
End Sub

Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
    Debug.Print "OLEStartDrag: " & AllowedEffects
End Sub

Private Sub UserControl_Paint()
    Debug.Print "Paint"
    UserControl.Line (50, 50)-(UserControl.ScaleWidth / 3 * 2, UserControl.ScaleHeight / 3 * 2), vbBlue, BF
  UserControl.Line (100, 100)-(UserControl.ScaleWidth / 3 * 2 + 100, UserControl.ScaleHeight / 3 * 2 + 100), vbRed, BF

End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Debug.Print "ReadProperties"
    m_sizeChildren = PropBag.ReadProperty("sizeChildren", True)

End Sub

Private Sub UserControl_Resize()
    Debug.Print "Resize: " & Width & ", " & Height
End Sub

Private Sub UserControl_Terminate()
    Debug.Print "Terminate"
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Debug.Print "WriteProperties"
    Call PropBag.WriteProperty("sizeChildren", m_sizeChildren, True)

End Sub
Function autoSize()
If ctlCount = 0 Then Exit Function
  For i = 1 To UserControl.ParentControls.Count - 1
    'If UserControl.ParentControls(i).Name <> UserControl.Ambient.DisplayName Then
      If m_sizeChildren = True Then
        UserControl.ParentControls.Item(i).Left = ctlLeft(i - 1) * Frm.Width / 100
        UserControl.ParentControls.Item(i).Width = ctlWidth(i - 1) * Frm.Width / 100
        UserControl.ParentControls.Item(i).Top = ctlTop(i - 1) * Frm.Height / 100
        UserControl.ParentControls.Item(i).Height = ctlHeight(i - 1) * Frm.Height / 100
      ElseIf m_sizeChildren = False Then
        If UserControl.ParentControls.Item(i).Container.Name = UserContainerName Then
          UserControl.ParentControls.Item(i).Left = ctlLeft(i - 1) * Frm.Width / 100
          UserControl.ParentControls.Item(i).Width = ctlWidth(i - 1) * Frm.Width / 100
          UserControl.ParentControls.Item(i).Top = ctlTop(i - 1) * Frm.Height / 100
          UserControl.ParentControls.Item(i).Height = ctlHeight(i - 1) * Frm.Height / 100
        End If
      End If
    'End If
  Next
End Function
Function autoInit()

For i = 1 To UserControl.ParentControls.Count - 1
  If UserControl.ParentControls(i).Name = UserControl.Ambient.DisplayName Then
    UserContainerName = UserControl.ParentControls(i).Container.Name
  Exit For
  End If
Next

ctlCount = UserControl.ParentControls.Count - 2
If ctlCount = 0 Then Exit Function

Set Frm = UserControl.ParentControls(0)
ReDim ctlWidth(ctlCount)
ReDim ctlLeft(ctlCount)
ReDim ctlTop(ctlCount)
ReDim ctlHeight(ctlCount)

For i = 1 To UserControl.ParentControls.Count - 1
  'If UserControl.ParentControls(i).Name <> UserControl.Ambient.DisplayName Then
    If m_sizeChildren = True Then
      ctlLeft(i - 1) = UserControl.ParentControls(i).Left / Frm.Width * 100
      ctlWidth(i - 1) = UserControl.ParentControls(i).Width / Frm.Width * 100
      ctlTop(i - 1) = UserControl.ParentControls(i).Top / Frm.Height * 100
      ctlHeight(i - 1) = UserControl.ParentControls(i).Height / Frm.Height * 100
    ElseIf m_sizeChildren = False Then
      If UserControl.ParentControls.Item(i).Container.Name = UserContainerName Then
        ctlLeft(i - 1) = UserControl.ParentControls(i).Left / Frm.Width * 100
        ctlWidth(i - 1) = UserControl.ParentControls(i).Width / Frm.Width * 100
        ctlTop(i - 1) = UserControl.ParentControls(i).Top / Frm.Height * 100
        ctlHeight(i - 1) = UserControl.ParentControls(i).Height / Frm.Height * 100
      End If
    End If
  'End If
Next
End Function


Public Property Get sizeChildren() As Boolean
  sizeChildren = m_sizeChildren

End Property

Public Property Let sizeChildren(ByVal vData As Boolean)
  m_sizeChildren = vData
End Property
