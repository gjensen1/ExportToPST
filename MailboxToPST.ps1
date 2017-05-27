

#Define Variables

#RetrieveType is a switch for change from LessThen date, to GreaterThenOrEqualDate.
$RetrieveType = "First"
#$RetrieveType = "Second"

$RetrieveDate = '05/01/2017'
$ExportPath = "\\localhost\exports"
$UserListFile = "c:\temp\ExportList.txt"





#Get MailBox List 
$UserList = Get-Content $UserListFile

If ($RetrieveType -eq "First"){
    ForEach ($User in $UserList){
        New-MailboxExportRequest -ContentFilter {(Received -lt $RetrieveDate)} -Mailbox $User -FilePath $ExportPath\$User-First.pst
    }
}Else{
    ForEach ($User in $UserList){
        New-MailboxExportRequest -ContentFilter {(Received -ge $RetrieveDate)} -Mailbox $User -FilePath $ExportPath\$User-Second.pst
    }
}
