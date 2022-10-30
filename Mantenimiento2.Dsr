VERSION 5.00
Begin {C0E45035-5775-11D0-B388-00A0C9055D8E} Mantenimiento2 
   ClientHeight    =   9390
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   13275
   _ExtentX        =   23416
   _ExtentY        =   16563
   FolderFlags     =   1
   TypeLibGuid     =   "{88EC681F-762D-4EAF-8328-8536F7038BAD}"
   TypeInfoGuid    =   "{0ED8D0E1-3798-41FA-A2D4-C9061219AB97}"
   TypeInfoCookie  =   0
   Version         =   4
   NumConnections  =   1
   BeginProperty Connection1 
      ConnectionName  =   "Conexiones"
      ConnDispId      =   1001
      SourceOfData    =   3
      ConnectionSource=   "Provider=MSDASQL.1;Persist Security Info=False;Data Source=wgestionpons"
      Expanded        =   -1  'True
      QuoteChar       =   96
      SeparatorChar   =   46
   EndProperty
   NumRecordsets   =   1
   BeginProperty Recordset1 
      CommandName     =   "SaldosClientes"
      CommDispId      =   1002
      RsDispId        =   1011
      CommandText     =   $"Mantenimiento2.dsx":0000
      ActiveConnectionName=   "Conexiones"
      CommandType     =   1
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   9
      BeginProperty Field1 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Codigo"
         Caption         =   "Codigo"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   255
         Scale           =   0
         Type            =   200
         Name            =   "Nombre"
         Caption         =   "Nombre"
      EndProperty
      BeginProperty Field3 
         Precision       =   0
         Size            =   150
         Scale           =   0
         Type            =   200
         Name            =   "Localidad"
         Caption         =   "Localidad"
      EndProperty
      BeginProperty Field4 
         Precision       =   0
         Size            =   6
         Scale           =   0
         Type            =   133
         Name            =   "FechaD"
         Caption         =   "FechaD"
      EndProperty
      BeginProperty Field5 
         Precision       =   0
         Size            =   6
         Scale           =   0
         Type            =   133
         Name            =   "FechaC"
         Caption         =   "FechaC"
      EndProperty
      BeginProperty Field6 
         Precision       =   0
         Size            =   50
         Scale           =   0
         Type            =   200
         Name            =   "Telefono"
         Caption         =   "Telefono"
      EndProperty
      BeginProperty Field7 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "TotalDebito"
         Caption         =   "TotalDebito"
      EndProperty
      BeginProperty Field8 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "TotalCredito"
         Caption         =   "TotalCredito"
      EndProperty
      BeginProperty Field9 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "SSaldo"
         Caption         =   "SSaldo"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
End
Attribute VB_Name = "Mantenimiento2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub DataEnvironment_Initialize()


'MsgBox (Me.Conexiones.ConnectionString)


Me.Conexiones.ConnectionString = pathDBMySQL



End Sub
