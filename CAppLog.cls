VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAppLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'******************************************************************************************************
'   This class, written by James Boyd, is a logger/error handler that does many things:
'       1.) Displays errors to users when they occur
'       2.) Records the activities of the application as various subroutines get executed
'       3.) When a run-time error happens, it can fire off an e-mail to the developer, replete with
'           routine name, error description, and even a dump of the app's execution stack at that point
'       4.) It can also maintain a text file which has the application's execution stack history
'
'   There are two ways of using this error handling/logging class:
'       1.) Use it just for error trapping
'       2.) Use it also for logging the execution path of an application
'
'   To use this class, declare a -global- variable of type CAppLog in a general module in your application.
'   For the sake of discussion, let's assume this global variable is named goAppLog.
'   When your application starts up, be sure to create this object by doing the following:
'
'   Set goAppLog = New CAppLog
'   goAppLog.AuthorEmailAddress = "YourEmailAddress@YourDomain.Com"
'
'   Note that it is crucial you tell CAppLog your e-mail address as the author's e-mail address. CAppLog
'   will automatically create a log file based on your app's name in the app's directory path. However,
'   if you want to have it be somewhere else or have a different filename, then you can set it up using
'   the LogFileName property.
'
'   Error-handling is critical to your application, and should be used everywhere, with discernment. For
'   example, in -very- simple one or two line subroutines where the possibility of a run-time error is
'   astronomically low, then putting in error-handling code is probably overkill and will only clutter up
'   your code. However, even in these simple subroutines, you may still use this object to log activity.
'
'   If you desire to enable error handling in a subroutine, be sure to have an "On Error Goto ..." statement
'   when your subroutine starts up, as well as a VB label at the end of the subroutine where this object
'   is fired off. Here's an example:
'
'   Sub YourRoutine
'   On Error Goto Log
'   goAppLog.Log alForm, "frmMyForm", "Sub YourRoutine", 0, "Enter"
'       --Some Code--
'   Log:
'       goAppLog.Log alForm, "frmMyForm", "Sub YourRoutine", 0 Or Err, Error$
'   End Sub
'
'   Notice that in the preceding example, the CAppLog will be fired every time upon exiting the subroutine.
'   If there is no error, then an error number of -0- will be logged, and the Error$ will be a blank string
'   that will be recorded as "Exit" in the error log history error description. If a run-time error really
'   did occur, then this same line of code will also elegantly handle that as well, passing both the error
'   number and the error description to CAppLog for logging, user display, or even e-mailing.

'   Also notice that the CAppLog also gets called when the subroutine starts. This is a neat way to capture
'   the beginning and ending points of a subroutine for later performance analysis. If this is not desired,
'   then you do not have to have CAppLog fire off in the beginning of a subroutine.
'
'   NOTE: In certain highly iterative routines (e.g. sorting routines, etc.) it is -never- desirable to have
'   CAppLog log activity, but only trap actual run-time errors. Since just calling CAppLog for capturing
'   starting and ending milestones is an overhead (not to mention logging it out to a physical text file),
'   it is easy to see how this can be exponentially cumbersome to a highly iterative or recursive function.
'   For these types of subroutines, use the following piece of code as a guideline:
'
'   Function FastRoutine
'   On Error Goto Log
'          --Some Code--
'   Log:
'       If Err>0 then goAppLog.Log alForm, "frmMyForm", "Sub YourRoutine", Err, Error$
'   End Sub
'
'   Notice that no logging of starting/exiting is done. Rather, the only time CAppLog would ever be called
'   is when a run-time error happens. This ensures that this routine works as fast as possible without
'   any distractions.

Option Explicit

'A couple of Windows API declarations necessary for the Email_Error subroutine
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long

'The various types of code in a VB project. If you can think of more, then just add it to this list.
Public Enum alModuleType
    alForm
    alModule
    alClass
    alReport
End Enum

'Internal private variables used for properties, etc.
Private msAuthorEmailAddress As String
Private msHistoryLog As String
Private msLogFilename As String
Private miLastErrNumber As Long
Private msLastErrDescription As String
Private mbLogToFile As Boolean
Private iFileHandle As Long
'Read/Write property of the author's e-mail address. Important!
Public Property Get AuthorEmailAddress() As String
    AuthorEmailAddress = msAuthorEmailAddress
End Property
Public Property Let AuthorEmailAddress(sAuthorEmailAddress As String)
    msAuthorEmailAddress = sAuthorEmailAddress
End Property
'Read/Write property telling CAppLog if activities/errors should be logged
'to a file
Public Property Get LogToFile() As Boolean
    LogToFile = mbLogToFile
End Property
Public Property Let LogToFile(ByVal bLogToFile As Boolean)
    mbLogToFile = bLogToFile
End Property
'Read/Write property of the filename of the history log file
Public Property Get LogFilename() As String
    LogFilename = msLogFilename
End Property
Public Property Let LogFilename(sLogFilename As String)
    msLogFilename = sLogFilename
End Property
'This is the default log filename if no name has been set up
Public Property Get DefaultLogFilename() As String
    DefaultLogFilename = App.Path & "\" & App.Title & ".LOG"
End Property
'Read-only property of the history log (execution stack)
Public Property Get HistoryLog() As String
    HistoryLog = msHistoryLog
End Property
Private Property Let HistoryLog(sHistoryLog As String)
    msHistoryLog = sHistoryLog
End Property
'Read-only property of the last error number that occurred. This
'is useful because once the Err.Number property is accessed and another
'subroutine is ran, it gets cleared.
Public Property Get LastErrNumber() As Long
    LastErrNumber = miLastErrNumber
End Property
Private Property Let LastErrNumber(iLastErrNumber As Long)
    miLastErrNumber = iLastErrNumber
End Property
'Read-only property of the last error message that occurred. This
'is useful because once the Err.Description property is accessed and another
'subroutine is ran, it gets cleared.
Public Property Get LastErrDescription() As String
    LastErrDescription = msLastErrDescription
End Property
Private Property Let LastErrDescription(sLastErrDescription As String)
    msLastErrDescription = sLastErrDescription
End Property
Public Function Log(ByVal ModuleType As alModuleType, _
                    ByVal ModuleName As String, _
                    ByVal RoutineName As String, _
                    Optional ErrNumber As Long = 0, _
                    Optional ErrDescription As String = "", _
                    Optional DisplayMessage As Boolean = True, _
                    Optional SendEmail As Boolean = True)
'The primary method of this class, this is called whenever an activity/milestone needs to be recorded, or when
'a VB run-time error happens
                    
On Error GoTo ErrHandler
    
    Dim sSeverity As String
    Dim sModuleType As String
    Dim sLogEntryLine As String
    Dim sSubject As String
    Dim sMessageBody As String
    Dim sMsgboxTitle As String
    Dim sMsgboxPrompt As String
    
    Select Case ModuleType
        Case alForm: sModuleType = "Form"
        Case alModule: sModuleType = "Module"
        Case alClass: sModuleType = "Class"
        Case alReport: sModuleType = "Report"
    End Select
    
    'Indicate our severity level
    If ErrNumber <> 0 Then
        sSeverity = "Run-Time Error"
    Else
        sSeverity = "Action"
    End If
    
    'Assume that this function was fired off at the end of a routine if there was no obvious error
    If ErrNumber = 0 And ErrDescription = "" Then ErrDescription = "Exit"
    
    'Construct our log entry line with these pieces
    sLogEntryLine = ""
    sLogEntryLine = sLogEntryLine & sModuleType & vbTab
    sLogEntryLine = sLogEntryLine & ModuleName & vbTab
    sLogEntryLine = sLogEntryLine & RoutineName & vbTab
    sLogEntryLine = sLogEntryLine & sSeverity & vbTab
    sLogEntryLine = sLogEntryLine & Format(Now, "mm/dd/yy hh:nn:ss") & "." & Right(Format(Timer, "000.000"), 3) & vbTab
    sLogEntryLine = sLogEntryLine & ErrNumber & vbTab
    sLogEntryLine = sLogEntryLine & ErrDescription
        
    'Add this line to our log history. This will probably write it out to a file as well
    HistoryLog = HistoryLog & sLogEntryLine & vbCrLf
    
    'Write this log entry out to our file
    If LogToFile Then WriteLogEntry sLogEntryLine
    
    'Optionally display our message
    If DisplayMessage And ErrNumber <> 0 Then
        'Construct our message box title and prompt
        sMsgboxTitle = App.Title & " Error"
        If ErrNumber <> 0 Then
            sMsgboxPrompt = "A critical run-time error has occurred in "
        Else
            sMsgboxPrompt = "A logged activity has been generated in "
        End If
        sMsgboxPrompt = sMsgboxPrompt & sModuleType & " " & ModuleName & " " & RoutineName & vbCrLf & vbCrLf
        sMsgboxPrompt = sMsgboxPrompt & "Error #" & Trim(ErrNumber) & ": " & "'" & ErrDescription & "'"
        'Display it to the user
        MsgBox Prompt:=sMsgboxPrompt, Title:=sMsgboxTitle, Buttons:=vbOKOnly + IIf(ErrNumber = 0, vbInformation, vbCritical)
    End If
    
    'If this is a run-time error, then ask the user if they would like this e-mailed to us
    If SendEmail And ErrNumber <> 0 Then
        If MsgBox("Would you like to e-mail this error to the application developer?", vbYesNo) = vbYes Then
            MsgBox "Your e-mail application will now open with all fields automatically filled in." & vbCrLf & _
                   "Feel free to edit the message portion of the e-mail, and add any further comments describing what happened." & vbCrLf & _
                   "When finished, please click on the [Send] button. --Thank You"
            
            'Construct our e-mail subject line and message, incl. the app history log
            sSubject = App.Title & " Fatal Error..." & sModuleType & " " & ModuleName & " " & RoutineName & " Error #" & ErrNumber
            sMessageBody = "Description: " & ErrDescription & vbCrLf _
                         & "When Occurred: " & Format(Now, "mm/dd/yy hh:nn:ss") & vbCrLf _
                         & "App Version: " & App.Major & "." & App.Minor & "." & App.Revision & vbCrLf & vbCrLf _
                         & "ENTER YOUR COMPANY NAME HERE: " & vbCrLf _
                         & "ENTER YOUR NAME HERE: " & vbCrLf _
                         & "DESCRIBE WHAT LED UP TO THE ERROR: " & vbCrLf & vbCrLf _
                         & "APP HISTORY LOG DUMP:" & vbCrLf & HistoryLog
            'Send it off!
            Email_Error ToEmailAddresses:=AuthorEmailAddress, _
                        Subject:=sSubject, _
                        MessageBody:=sMessageBody
        End If
    End If
    
    'Store this ErrNumber ErrDescription until the next time
    LastErrNumber = ErrNumber
    LastErrDescription = ErrDescription
    
ErrHandler:
    If Err > 0 Then MsgBox Error$, , "Class CAppLog Function Log()"
    Exit Function
    Resume
    
End Function

Private Function WriteLogEntry(ByVal LogEntryLine As String)
'Writes the log entry out to the defined text file

On Error GoTo ErrHandler

    'Our file handle will be uninitialized if this is the first time this routine is called
    'Therefore, create our output text log file in our application directory
    'Note: if this log file already exists, it will be replaced
    If iFileHandle = 0 Then
        'Make sure we have a filename to work with!
        If Trim(LogFilename) = "" Then LogFilename = DefaultLogFilename
        iFileHandle = FreeFile
        Open LogFilename For Output As iFileHandle
    End If
                
    'Write out our log entry
    Print #iFileHandle, LogEntryLine
    
ErrHandler:
    If Err > 0 Then MsgBox Error$, , "Class CAppLog Function WriteLogEntry()"

End Function

Private Function Email_Error(ByVal ToEmailAddresses As String, _
                             Optional CCEmailAddresses As String = "", _
                             Optional Subject As String = " ", _
                             Optional MessageBody As String = " ")
'When a run-time error occurs, this routine fires off an e-mail to the author
                     
On Error GoTo ErrHandler

    Const CONST_EMAIL_COMMAND = "MailTo:{ToEmailAddresses}&CC={CCEmailAddresses}&Subject={Subject}&Body={MessageBody}"
    
    Dim RC As Variant
    Dim sCommand As String

    If ToEmailAddresses = "" Then
        MsgBox "No e-mail address has been set up for the developer. Please enter this in the To: line of the e-mail."
    End If
    sCommand = "MailTo:" & ToEmailAddresses
    If CCEmailAddresses <> "" Then sCommand = sCommand & "?CC=" & CCEmailAddresses
    If Subject <> "" Then sCommand = sCommand & "&Subject=" & Subject
    If MessageBody <> "" Then
        'Ampersands, spaces, and line breaks need to be a special character in our 'mailto:' string
        'NOTE: I could not find anything to handle [Tab] characters...so I just use five spaces to
        'represent a [Tab] character. I know you can do better, though! ;-)
        MessageBody = Replace(MessageBody, vbTab, Space(5))
        MessageBody = Replace(MessageBody, " ", "%20")
        MessageBody = Replace(MessageBody, "&", "%26")
        MessageBody = Replace(MessageBody, vbCrLf, "%0D%0A")
        sCommand = sCommand & "&Body=" & MessageBody
    End If
    
    RC = ShellExecute(GetDesktopWindow(), "Open", sCommand, "", App.Path, 1)
    
ErrHandler:
    If Err > 0 Then MsgBox Error$, , "Class CAppLog Function Email_Error()"
    
End Function

Private Sub Class_Initialize()
    
    'Default to file logging
    LogToFile = True
    
    'Default our log filename to our app name in the current app directory
    LogFilename = DefaultLogFilename()
       
    'Clear our existing history log (not necessary, but just for commenting)
    HistoryLog = ""
    
End Sub

Private Sub Class_Terminate()

On Error GoTo ErrHandler

    'Close our text log file
    If iFileHandle <> 0 Then Close #iFileHandle
    
ErrHandler:
    If Err > 0 Then MsgBox Error$, , "Class CAppLog Sub Class_Terminate"
    
End Sub
