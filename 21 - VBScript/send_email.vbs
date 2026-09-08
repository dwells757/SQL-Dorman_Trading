' Check if any arguments were passed
If WScript.Arguments.Count < 1 Then
    WScript.Echo "Error: Please provide an argument."
    WScript.Quit
End If

' Read arguments by their index (starting at 0)
Dim emailSubject
emailSubject  = WScript.Arguments.Item(0)

WScript.Echo "emailSubject: " & emailSubject

' Define the path to your password text file
Dim passwordFilePath
passwordFilePath = "C:\Temp\password.txt"

' Create FileSystemObject to read the file
Dim fso, txtFile, password
Set fso = CreateObject("Scripting.FileSystemObject")

' Check if the file exists before reading
If fso.FileExists(passwordFilePath) Then
    Set txtFile = fso.OpenTextFile(passwordFilePath, 1) ' 1 = ForReading
    
    ' Read the password and trim any accidental spaces or newlines
    password = Trim(txtFile.ReadAll)
    
    txtFile.Close
Else
    WScript.Echo "Error: Password file not found."
    WScript.Quit
End If

' Use the password variable in your script
WScript.Echo "Password loaded successfully."


' Define Configuration Schema Constant
Dim schema
schema = "http://schemas.microsoft.com/cdo/configuration/"

' Create CDO Message and Configuration Objects
Dim objEmail, objConfig
Set objEmail = CreateObject("CDO.Message")
Set objConfig = CreateObject("CDO.Configuration")

' --- SMTP Server Configuration ---
With objConfig.Fields
    ' 2 = Send using a network SMTP server
    .Item(schema & "sendusing") = 2 
    
    ' Your SMTP Server Address (e.g., ://gmail.com, ://yourdomain.com)
    .Item(schema & "smtpserver") = "mail.smtp2go.com"
    
    ' SMTP Port (Typically 25, 465, or 587)
    .Item(schema & "smtpserverport") = 465
    
    ' Connection Timeout in seconds
    .Item(schema & "smtpconnectiontimeout") = 60
    
    ' --- Authentication Settings ---
    ' 1 = Basic/Clear Text Authentication
    .Item(schema & "smtpauthenticate") = 1 
    
    ' Your full email address account username
    .Item(schema & "sendusername") = "alerts@dormantrading.com"
    
    ' Your email account password (or App Password if using Gmail/O365)
    .Item(schema & "sendpassword") = password
    
    ' Use SSL/TLS (True/False)
    .Item(schema & "smtpusessl") = True
    
    ' Save changes to the configuration
    .Update
End With

' Assign configuration to the email item
Set objEmail.Configuration = objConfig

' --- Email Message Formatting ---
objEmail.From     = "alerts@dormantrading.com"
objEmail.To       = "dwhardesty2@hotmail.com; dwhardesty2@gmail.com"
objEmail.Subject  = emailSubject

' Use TextBody for plain text, or HTMLBody for formatted content
objEmail.TextBody = "Hello, this is a plain text message sent via CDO without Outlook!"
' objEmail.HTMLBody = "<h1>Hello</h1><p>This is a <b>formatted HTML</b> email.</p>"

' Optional: Add a file attachment (uncomment the line below to use)
' objEmail.AddAttachment "C:\path\to\your\file.txt"

' --- Send Email with Error Handling ---
On Error Resume Next
objEmail.Send

If Err.Number = 0 Then
    WScript.Echo "Success: Email sent successfully!"
Else
    WScript.Echo "Error " & Err.Number & ": " & Err.Description
    Err.Clear
End If

' Clean up objects from memory
Set objEmail = Nothing
Set objConfig = Nothing
