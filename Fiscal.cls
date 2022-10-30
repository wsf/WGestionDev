VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Fiscal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Dim sCmd, sCmdExt As String
Dim bAnswer As Boolean
Dim vd1, vd2, vd3, vd4, vd5 As String



Public Sub CerrarComprobanteNoFiscal()
With frmPrincipal.FiscalEpson2
           'Close
            sCmd = Chr$(&HE) + Chr$(&H6)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            'If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            'If bAnswer Then bAnswer = .AddDataField("")
            'If bAnswer Then bAnswer = .AddDataField("")
            'If bAnswer Then bAnswer = .AddDataField("")
            'If bAnswer Then bAnswer = .AddDataField("")
            'If bAnswer Then bAnswer = .AddDataField("")
            
            If bAnswer Then bAnswer = .AddDataField("")
            
            If bAnswer Then bAnswer = .SendCommand
End With
End Sub

Public Sub DatosClientesCF(vnombre As String, _
vcuit As String, _
vtipoCUIT, _
vCondiIVA, _
vDomicilio As String, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2

     
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H1)
            
            sCmd = Chr$(&HA) + Chr$(&H1)
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H1)
            Else
                sCmd = Chr$(&HA) + Chr$(&H1)
            End If
    
            
            'sCmd = Chr$(&HA) + Chr$(&H2)
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
                          
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            
            
            If vTipoComprobante = "Nota Credito" Then
            Else
                If bAnswer Then bAnswer = .SendCommand  'ojo '  panic
            End If
    
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
        
End With
          
End Sub

Public Sub DatosClientesTNF(vnombre As String, _
vcuit As String, _
vtipoCUIT, _
vCondiIVA, _
vDomicilio As String, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2
   '---------------------------
        ' D.N.F.
        '---------------------------
            'Open
            'sCmd = Chr$(&HE) + Chr$(&H1)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H0)
            'If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            'If bAnswer Then bAnswer = .SendCommand
            'Call FPDelay
            'If .ReturnCode <> 0 Then ShowMsg
            
            
             'Open
            sCmd = Chr$(&HE) + Chr$(&H1)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
           
            
            
            
End With
          
End Sub


Public Sub DatosClientesNC(vnombre As String, _
vcuit As String, _
vtipoCUIT, _
vCondiIVA, _
vDomicilio As String, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2

            sCmd = Chr$(&HD) + Chr$(&H1)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(Trim(vnombre))
            If bAnswer Then bAnswer = .AddDataField(Trim(vDomicilio))
            If bAnswer Then bAnswer = .AddDataField("T")
            If bAnswer Then bAnswer = .AddDataField(vcuit)
            If bAnswer Then bAnswer = .AddDataField("I")
          '  If bAnswer Then bAnswer = .AddDataField("Lnea de Remitos #1")
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .SendCommand
            
            MsgBox ""
            
            frmRemito.log.AddItem " Datos personas: " + Trim(vDomicilio) + " - " + Trim(vnombre)
            
End With
          
End Sub


Public Sub DatosClientesTA(vnombre As String, _
vcuit As String, _
vtipoCUIT, _
vCondiIVA, _
vDomicilio As String, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2


            sCmd = Chr$(&HB) + Chr$(&H1)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(Trim(vnombre))
            If bAnswer Then bAnswer = .AddDataField(Trim(vDomicilio))
            If bAnswer Then bAnswer = .AddDataField("T")
            If bAnswer Then bAnswer = .AddDataField(vcuit)
            
            If vCondiIVA = "Exento" Then
             If bAnswer Then bAnswer = .AddDataField("E")
            Else
               If bAnswer Then bAnswer = .AddDataField("I")
            End If
                        
          '  If bAnswer Then bAnswer = .AddDataField("Lnea de Remitos #1")
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .SendCommand
            
            MsgBox ""
            
            frmRemito.log.AddItem " Datos personas: " + Trim(vDomicilio) + " - " + Trim(vnombre)
            
End With
          
End Sub



Public Sub DatosClientesTA2(vnombre As String, _
vcuit As String, _
vtipoCUIT, _
vCondiIVA, _
vDomicilio As String, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2

     
                            .ClosePort
                            
                            Call FPDelay
                            
                            .CommPort = LeerXml("Puerto")
                           ' .BaudRate = 3
                            
                            .ProtocolType = protocol_Extended
                            
                            
                            'vmensaje = " Puerto : " + Str(.CommPort) + "  - " + Str(.BaudRate)
                            
                            'MsgBox vmensaje
                            
                            
                            If (.OpenPort) Then
                                Call FPDelay
                            Else
                                MsgBox "2- El controlador fiscal no está conectado. " + Chr(13) + _
                                "Conecte el controlador y vuelva a ingresar a este módulo"
                            End If
    
    

        '---------------------------
        ' Ticket-Factura
        '---------------------------
        
            'Open
            
            ''Open
            'sCmd = Chr$(&HB) + Chr$(&H1)
            'If bAnswer Then bAnswer = Me.EpsonFP.AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H1)
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H1)
            Else
                sCmd = Chr$(&HB) + Chr$(&H1)
            End If
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
                    
                    
                    
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(vnombre)
            If bAnswer Then bAnswer = .AddDataField(vDomicilio)
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField("T")
            If bAnswer Then bAnswer = .AddDataField(vcuit)
             
            If vCondiIVA = "Exento" Then
                If bAnswer Then bAnswer = .AddDataField("E")
            Else
                If bAnswer Then bAnswer = .AddDataField("I")
            End If
            
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField("-")
            
            
            If bAnswer Then bAnswer = .AddDataField("TF" + Str(frmRemito.vNroFacturaNotaC))
            
            
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
End With
          
End Sub




' --------- funciones

Public Sub ImprimirItemTA(vdescripcion As String, _
vCantidad As Double, _
vPrecio As Double, _
vIva As Double, _
vImpuesto As Double, _
Optional vdescuento As Double)

Dim sCmd As String
Dim sCmdExt As String
With frmPrincipal.FiscalEpson2
Dim bAnswer As Boolean
bAnswer = True


     
             sCmd = Chr$(&HB) + Chr$(&H2)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            
            
            'If bAnswer Then bAnswer = .AddDataField(Trim(Left(vdescripcion, 20)))
            
            'If bAnswer Then bAnswer = .AddDataField("Descripci¢n Item")
        
        MsgBox "1"
            If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #1")
            If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #2")
            If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #3")
            If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #4")
            If bAnswer Then bAnswer = .AddDataField("Descripci¢n Item")
        MsgBox "2"
        
            If bAnswer Then bAnswer = .AddDataField("10000")
            If bAnswer Then bAnswer = .AddDataField("10000")
            If bAnswer Then bAnswer = .AddDataField("21000")
            
            
            
          '  If bAnswer Then bAnswer = .AddDataField(Trim(Str(vCantidad * 10000)))
          '  If bAnswer Then bAnswer = .AddDataField(Trim(Str(vPrecio * 10000)))
          '  If bAnswer Then bAnswer = .AddDataField(Trim(Str(vIva * 100)))
            
            
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .SendCommand
            
            frmRemito.log.AddItem " Datos personas: " + (Trim(Left(vdescripcion, 20))) + " " + (Trim(Str(vCantidad * 10000)))
            
            MsgBox ""
               
            ' no hago descuento
     
End With
          
End Sub

Function fTipoDocEpson(vtipodoc As String) As String

Select Case vtipodoc
    Case "Factura"
        fTipoDocEpson = Chr$(&HB)
    Case "Nota Credito"
         fTipoDocEpson = Chr$(&HD)
    Case "Ticket"
         fTipoDocEpson = Chr$(&HA)
End Select

End Function


Public Sub ImprimirItemTA2(vdescripcion As String, _
vCantidad As Double, _
vPrecio As Double, _
vIva As Double, _
vImpuesto As Double, _
Optional vdescuento As Double, Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2
     
           'Item
           ' sCmd = Chr$(&HB) + Chr$(&H2)
           ' If bAnswer Then bAnswer = .AddDataField(sCmd)
           ' sCmdExt = Chr$(&H0) + Chr$(&H0)
           
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H2)
            'sCmd = Chr$(&HB) + Chr$(&H2)
            
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H2)
                Globals.vmensajeGlobal = Globals.vmensajeGlobal + "Items NC" + Chr(13)
            Else
                sCmd = Chr$(&HB) + Chr$(&H2)
            End If
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
                       
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            
            
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #1")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #2")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #3")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #4")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Item")
            
           ' MsgBox "Pasa items " + Left(vdescripcion, 20)
            
            vd1 = ""
            vd2 = ""
            vd3 = ""
            vd4 = ""
            vd5 = ""
                                  
            If bAnswer Then bAnswer = .AddDataField("") ' vd1
            If bAnswer Then bAnswer = .AddDataField("") ' vd2
            If bAnswer Then bAnswer = .AddDataField("") ' vd3
            If bAnswer Then bAnswer = .AddDataField("") ' vd4
            If bAnswer Then bAnswer = .AddDataField(vdescripcion) ' vd5
             
          '  If bAnswer Then bAnswer = .AddDataField("10000")
          '  If bAnswer Then bAnswer = .AddDataField("10000")
          '  If bAnswer Then bAnswer = .AddDataField("2100")
            
            If bAnswer Then bAnswer = .AddDataField(vCantidad * 10000)
            If bAnswer Then bAnswer = .AddDataField(vPrecio * 10000)
            If bAnswer Then bAnswer = .AddDataField(vIva * 100)
            
            
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            

End With
          
End Sub

Public Sub ImprimirItemNC(vdescripcion As String, _
vCantidad As Double, _
vPrecio As Double, _
vIva As Double, _
vImpuesto As Double, _
Optional vdescuento As Double)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2
     
           'Item
            sCmd = Chr$(&HD) + Chr$(&H2)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)

            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            
            
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #1")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #2")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #3")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #4")
           ' If bAnswer Then bAnswer = .AddDataField("Descripci¢n Item")
            
           ' MsgBox "Pasa items " + Left(vdescripcion, 20)
            
            vd1 = ""
            vd2 = ""
            vd3 = ""
            vd4 = ""
            vd5 = ""
                                  
            If bAnswer Then bAnswer = .AddDataField("") ' vd1
            If bAnswer Then bAnswer = .AddDataField("") ' vd2
            If bAnswer Then bAnswer = .AddDataField("") ' vd3
            If bAnswer Then bAnswer = .AddDataField("") ' vd4
            If bAnswer Then bAnswer = .AddDataField(vdescripcion) ' vd5
             
          '  If bAnswer Then bAnswer = .AddDataField("10000")
          '  If bAnswer Then bAnswer = .AddDataField("10000")
          '  If bAnswer Then bAnswer = .AddDataField("2100")
            
            If bAnswer Then bAnswer = .AddDataField(vCantidad * 10000)
            If bAnswer Then bAnswer = .AddDataField(vPrecio * 10000)
            If bAnswer Then bAnswer = .AddDataField(vIva * 100)
            
            
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            

End With
          
End Sub




Private Sub fsepararDescripcion(ByVal vd, ByRef vd1, ByRef vd2, ByRef vd3, ByRef vd4, ByRef vd5)
On Error Resume Next

vd1 = Trim(Mid$(vd, 1, 20))
vd2 = Trim(Mid$(vd, 21, 30))
vd3 = Trim(Mid$(vd, 31, 40))
vd4 = Trim(Mid$(vd, 41, 50))
vd5 = Trim(Mid$(vd, 51, 60))

If Err Then
    vd1 = ""
    vd2 = ""
    vd3 = ""
    vd4 = ""
    vd5 = ""
    Exit Sub
End If
End Sub



' --------- funciones

Public Sub ImprimirItemTNF(vdescripcion As String, _
vCantidad As Double, _
vPrecio As Double, _
vIva As Double, _
vImpuesto As Double, _
Optional vdescuento As Double)

Dim sCmd, vlinea As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True
    
    'MsgBox "Pasa Items NF"

With frmPrincipal.FiscalEpson2
     
                sCmd = Chr$(&HE) + Chr$(&H2)
                If bAnswer Then bAnswer = .AddDataField(sCmd)
                sCmdExt = Chr$(&H0) + Chr$(&H0)
               If bAnswer Then bAnswer = .AddDataField(sCmdExt)
               
                   vlinea = " - " + str_ancho(Format(vCantidad, "##0.00"), 6) + "  " + str_ancho(Left(vdescripcion, 10), 10) + " " + str_ancho(Format(vPrecio, "###,###,##0.00"), 8) + "  " + str_ancho(Format(vPrecio * vCantidad, "###,###,##0.00"), 10)
         
                    If bAnswer Then bAnswer = .AddDataField(vlinea)
               ' If bAnswer Then bAnswer = .AddDataField("Texto Texto Texto Texto Texto Texto")
              '  MsgBox ""

                If bAnswer Then bAnswer = .SendCommand
                Call FPDelay
                If .ReturnCode <> 0 Then ShowMsg
            
     
           ' sCmd = Chr$(&HE) + Chr$(&H2)
           ' If bAnswer Then bAnswer = .AddDataField(sCmd)
           ' sCmdExt = Chr$(&H0) + Chr$(&H0)
           ' If bAnswer Then bAnswer = .AddDataField(sCmdExt)
           ' vlinea = Format(vCantidad, "###,###,##0.00") + "  " + Left(vdescripcion, 15) + "   " + Format(vPrecio, "###,###,##0.00") + "  " + Format(vPrecio * vCantidad, "###,###,##0.00")
           '
           ' 'MsgBox (Trim(Left(vlinea, 20)))
           '
            'If bAnswer Then bAnswer = .AddDataField((Left(vlinea, 25)))
           ' If bAnswer Then bAnswer = .AddDataField("Texto Texto Texto Texto Texto Texto")
           ' If bAnswer Then bAnswer = .SendCommand
           ' If .ReturnCode <> 0 Then ShowMsg
            
End With
          
End Sub



Public Sub ImprimirItemCF(vdescripcion As String, _
vCantidad As Double, _
vPrecio As Double, _
vIva As Double, _
vImpuesto As Double, _
Optional vdescuento As Double, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True

'MsgBox "Entrando a itmes CF"

With frmPrincipal.FiscalEpson2

      'Item ---------------------------------------------------------
            '    sCmd = Chr$(&HA) + Chr$(&H2)
            '    If bAnswer Then bAnswer = .AddDataField(sCmd)
            '    sCmdExt = Chr$(&H0) + Chr$(&H0)
            '    If bAnswer Then bAnswer = .AddDataField(sCmdExt)
                
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H2)
            'sCmd = Chr$(&HA) + Chr$(&H2)
            
                sCmd = Chr$(&HA) + Chr$(&H2)
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H2)
                vmensajeGlobal = vmensajeGlobal + " sCmd = Chr$(&HD) + Chr$(&H2) " + Chr(13)
            Else
                sCmd = Chr$(&HA) + Chr$(&H2)
                vmensajeGlobal = vmensajeGlobal + " sCmd = Chr$(&HA) + Chr$(&H2) " + Chr(13)
            End If
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            
       '     If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #1")
       '     If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #2")
       '     If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #3")
       '     If bAnswer Then bAnswer = .AddDataField("Descripci¢n Extra #4")
       '     If bAnswer Then bAnswer = .AddDataField("Descripci¢n Item")
            
            
            
                 'Call fsepararDescripcion(vdescripcion, vd1, vd2, vd3, vd4, vd5)
                 
                 vd1 = ""
                 vd2 = ""
                 vd3 = ""
                 vd4 = ""
                 vd5 = ""
                 
                 
                 If bAnswer Then bAnswer = .AddDataField("") ' vd1
                 If bAnswer Then bAnswer = .AddDataField("") ' vd2
                 If bAnswer Then bAnswer = .AddDataField("") ' vd3
                 If bAnswer Then bAnswer = .AddDataField("") ' vd4
                 If bAnswer Then bAnswer = .AddDataField(vdescripcion) ' vd5
                 
                
               ' If bAnswer Then bAnswer = .AddDataField("10000")
               ' If bAnswer Then bAnswer = .AddDataField("1000")
               ' If bAnswer Then bAnswer = .AddDataField("2100")
                
          
                If bAnswer Then bAnswer = .AddDataField((vCantidad * 10000))
                If bAnswer Then bAnswer = .AddDataField((vPrecio * 10000))
                If bAnswer Then bAnswer = .AddDataField((vIva * 100))
                
                If bAnswer Then bAnswer = .AddDataField("")
                If bAnswer Then bAnswer = .AddDataField("")
                
                If bAnswer Then bAnswer = .SendCommand
                Call FPDelay
                If .ReturnCode <> 0 Then ShowMsg
        ' -----------------------------------------------------------------
            
End With
          
End Sub


Public Sub AbrirComprobanteFiscal(vtipocomprobabt As String)
 Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True


With frmPrincipal.FiscalEpson2

            If bAnswer Then bAnswer = .AddDataField("I")
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField("-")
           ' If bAnswer Then bAnswer = .AddDataField("L¡nea de Remitos #1")
           ' If bAnswer Then bAnswer = .AddDataField("L¡nea de Remitos #2")
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
End With

End Sub



Public Sub CerrarcomprobateNF(vpago As Double)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True

With frmPrincipal.FiscalEpson2

            sCmd = Chr$(&HE) + Chr$(&H6)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
End With
    
End Sub


Public Sub CerrarcomprobateCFOriginal()

            MsgBox "Pagamento"
            
 With frmPrincipal.FiscalEpson2
'Payment
            sCmd = Chr$(&HA) + Chr$(&H5)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField("")
            If bAnswer Then bAnswer = .AddDataField("EFECTIVO")
            If bAnswer Then bAnswer = .AddDataField("500")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
            'Close
            sCmd = Chr$(&HA) + Chr$(&H6)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(1)
            If bAnswer Then bAnswer = .AddDataField("Cola de reemplazo #1")
            If bAnswer Then bAnswer = .AddDataField(2)
            If bAnswer Then bAnswer = .AddDataField("Cola de reemplazo #2")
            If bAnswer Then bAnswer = .AddDataField(3)
            If bAnswer Then bAnswer = .AddDataField("Cola de reemplazo #3")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
End With

End Sub


Public Sub pruebaT(obj As EpsonFPHostControl)


obj.ClosePort
obj.BaudRate = br9600
obj.CommPort = Com4
obj.ProtocolType = protocol_Extended

MsgBox obj.State

        '---------------------------
        ' Ticket
        '---------------------------
            'Open
            
            MsgBox "Prueba !"
            
            
            sCmd = Chr$(&HA) + Chr$(&H1)
            If bAnswer Then bAnswer = obj.AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = obj.AddDataField(sCmdExt)
            If bAnswer Then bAnswer = obj.SendCommand
            Call FPDelay
            If obj.ReturnCode <> 0 Then ShowMsg
            
            'Itembj
            sCmd = Chr$(&HA) + Chr$(&H2)
            If bAnswer Then bAnswer = obj.AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = obj.AddDataField(sCmdExt)
            
            If bAnswer Then bAnswer = obj.AddDataField("Descripci¢n Extra #1")
            If bAnswer Then bAnswer = obj.AddDataField("Descripci¢n Extra #2")
            If bAnswer Then bAnswer = obj.AddDataField("Descripci¢n Extra #3")
            If bAnswer Then bAnswer = obj.AddDataField("Descripci¢n Extra #4")
            If bAnswer Then bAnswer = obj.AddDataField("Descripci¢n Item")
            If bAnswer Then bAnswer = obj.AddDataField("10000")
            If bAnswer Then bAnswer = obj.AddDataField("1000")
            If bAnswer Then bAnswer = obj.AddDataField("2100")
            If bAnswer Then bAnswer = obj.AddDataField("")
            If bAnswer Then bAnswer = obj.AddDataField("")
            If bAnswer Then bAnswer = obj.SendCommand
            Call FPDelay
            If obj.ReturnCode <> 0 Then ShowMsg
            
            'Payment
            sCmd = Chr$(&HA) + Chr$(&H5)
            If bAnswer Then bAnswer = obj.AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            If bAnswer Then bAnswer = obj.AddDataField(sCmdExt)
            If bAnswer Then bAnswer = obj.AddDataField("")
            If bAnswer Then bAnswer = obj.AddDataField("EFECTIVO")
            If bAnswer Then bAnswer = obj.AddDataField("500")
            If bAnswer Then bAnswer = obj.SendCommand
            Call FPDelay
            If obj.ReturnCode <> 0 Then ShowMsg
            
            'Close
            sCmd = Chr$(&HA) + Chr$(&H6)
            If bAnswer Then bAnswer = obj.AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            If bAnswer Then bAnswer = obj.AddDataField(sCmdExt)
            If bAnswer Then bAnswer = obj.AddDataField(1)
            If bAnswer Then bAnswer = obj.AddDataField("Cola de reemplazo #1")
            If bAnswer Then bAnswer = obj.AddDataField(2)
            If bAnswer Then bAnswer = obj.AddDataField("Cola de reemplazo #2")
            If bAnswer Then bAnswer = obj.AddDataField(3)
            If bAnswer Then bAnswer = obj.AddDataField("Cola de reemplazo #3")
            If bAnswer Then bAnswer = obj.SendCommand
            Call FPDelay
            If obj.ReturnCode <> 0 Then ShowMsg

End Sub


Public Sub CerrarcomprobateCF(vdescuento As Double, _
Optional vTipoComprobante As String)

Dim sCmd As String
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True

With frmPrincipal.FiscalEpson2

     
            'Payment
            'sCmd = Chr$(&HA) + Chr$(&H5)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            Debug.Print fTipoDocEpson(vTipoComprobante) + " -------- " + vTipoComprobante
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H5)
            
            'sCmd = Chr$(&HA) + Chr$(&H5)
            'sCmd = Chr$(&HA) + Chr$(&H5)  ' Ale. Ojo  todo
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H5)
                vmensajeGlobal = vmensajeGlobal + " sCmd = Chr$(&HD) + Chr$(&H5) " + Chr(13)
            Else
                sCmd = Chr$(&HA) + Chr$(&H5)
                vmensajeGlobal = vmensajeGlobal + " sCmd = Chr$(&HA) + Chr$(&H5) " + Chr(13)
            End If
            
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField("")
            
            If bAnswer Then bAnswer = .AddDataField("EFECTIVO")
            If bAnswer Then bAnswer = .AddDataField("0")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
            'Close
            'sCmd = Chr$(&HA) + Chr$(&H6)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H1)
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H6)
            
            'sCmd = Chr$(&HA) + Chr$(&H6)
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H6)
                vmensajeGlobal = vmensajeGlobal + "  sCmd = Chr$(&HD) + Chr$(&H6) " + Chr(13)
            Else
                sCmd = Chr$(&HA) + Chr$(&H6)
                vmensajeGlobal = vmensajeGlobal + "  sCmd = Chr$(&HA) + Chr$(&H6) " + Chr(13)
            End If
            
            
            'sCmd = Chr$(&HA) + Chr$(&H6)
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
             
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(1)
            If bAnswer Then bAnswer = .AddDataField("POLIRUBROS")
            If bAnswer Then bAnswer = .AddDataField(2)
            If bAnswer Then bAnswer = .AddDataField("-")
            If bAnswer Then bAnswer = .AddDataField(3)
            If bAnswer Then bAnswer = .AddDataField("-")
            
            If vTipoComprobante = "Nota Credito" Then
                If bAnswer Then bAnswer = .AddDataField(2)
            End If
            
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
End With
    
End Sub


Public Sub Cerrarcomprobate(vdescuento As Double, _
Optional vTipoComprobante As String)

Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True

With frmPrincipal.FiscalEpson2


            Call FPDelay
            
            If .ReturnCode <> 0 Then ShowMsg
            
            'Discount
            'MsgBox "Pasa Discount"
            'sCmd = Chr$(&HB) + Chr$(&H4)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H4)
           
           If Not vTipoComprobante = "Nota Credito" Then
            
                    If vTipoComprobante = "Nota Credito" Then
                        sCmd = Chr$(&HD) + Chr$(&H4)
                    Else
                        sCmd = Chr$(&HB) + Chr$(&H4)
                    End If
                    
                    If bAnswer Then bAnswer = .AddDataField(sCmd)
                    sCmdExt = Chr$(&H0) + Chr$(&H0)
                    
                    
                    If bAnswer Then bAnswer = .AddDataField(sCmdExt)
                    If bAnswer Then bAnswer = .AddDataField("Descuento Amigo")
                    If bAnswer Then bAnswer = .AddDataField("0")
                    If bAnswer Then bAnswer = .SendCommand
                    Call FPDelay
                    If .ReturnCode <> 0 Then ShowMsg
            End If
            
            'Payment
           ' MsgBox "Pasa Payment"
            'sCmd = Chr$(&HB) + Chr$(&H5)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H5)
            
            
            'sCmd = Chr$(&HB) + Chr$(&H5)
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H5)
            Else
                sCmd = Chr$(&HB) + Chr$(&H5)
            End If
            
            Globals.vmensajeGlobal = Globals.vmensajeGlobal + " Pago " + Chr(13)
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .AddDataField("EFECTIVO")
            If bAnswer Then bAnswer = .AddDataField("0")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
            ' ------------------------------------ Close
            'MsgBox "Pasa close"
            'sCmd = Chr$(&HB) + Chr$(&H6)
            'If bAnswer Then bAnswer = .AddDataField(sCmd)
            'sCmdExt = Chr$(&H0) + Chr$(&H1)
            
            'sCmd = fTipoDocEpson(vTipoComprobante) + Chr$(&H6)
            sCmd = Chr$(&HB) + Chr$(&H6)
            
            If vTipoComprobante = "Nota Credito" Then
                sCmd = Chr$(&HD) + Chr$(&H6)
            Else
                sCmd = Chr$(&HB) + Chr$(&H6)
            End If
            
            
            Globals.vmensajeGlobal = Globals.vmensajeGlobal + " Pago " + Chr(13)
             
            
            'sCmd = Chr$(&HB) + Chr$(&H6)
            
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(1)
            If bAnswer Then bAnswer = .AddDataField("POLIRRUBROS")
            If bAnswer Then bAnswer = .AddDataField(2)
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .AddDataField(3)
            If bAnswer Then bAnswer = .AddDataField(" ")
            
            If vTipoComprobante = "Nota Credito" Then If bAnswer Then bAnswer = .AddDataField(2)
           
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
End With
    
End Sub


Public Sub CerrarcomprobateNC(vdescuento As Double)
Dim sCmdExt As String
Dim bAnswer As Boolean
bAnswer = True

With frmPrincipal.FiscalEpson2

            Call FPDelay
            
            If .ReturnCode <> 0 Then ShowMsg
            
          
            'Payment
            sCmd = Chr$(&HD) + Chr$(&H5)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H0)
            
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .AddDataField("EFECTIVO")
            If bAnswer Then bAnswer = .AddDataField("0")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
            
            ' ------------------------------------ Close
            
            'Close
            sCmd = Chr$(&HD) + Chr$(&H6)
            If bAnswer Then bAnswer = .AddDataField(sCmd)
            sCmdExt = Chr$(&H0) + Chr$(&H1)
            
            If bAnswer Then bAnswer = .AddDataField(sCmdExt)
            If bAnswer Then bAnswer = .AddDataField(1)
            If bAnswer Then bAnswer = .AddDataField("POLIRRUBROS")
            If bAnswer Then bAnswer = .AddDataField(2)
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .AddDataField(3)
            If bAnswer Then bAnswer = .AddDataField(" ")
            If bAnswer Then bAnswer = .SendCommand
            Call FPDelay
            If .ReturnCode <> 0 Then ShowMsg
End With
    
End Sub

