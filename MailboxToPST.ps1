

#Define Variables

#RetrieveType is a switch for change from LessThen date, to GreaterThenOrEqualDate.
$RetrieveType = "First"
#$RetrieveType = "Second"
$ExportPath = "\\localhost\exports"
$UserListFile = "c:\temp\ExportList.txt"





#Get MailBox List 
$UserList = Get-Content $UserListFile

If ($RetrieveType -eq "First"){
    ForEach ($User in $UserList){
        New-MailboxExportRequest -ContentFilter {(Received -lt '05/01/2017')} -Mailbox $User -FilePath $ExportPath\$User-First.pst
    }
}Else{
    ForEach ($User in $UserList){
        New-MailboxExportRequest -ContentFilter {(Received -ge '05/01/2017')} -Mailbox $User -FilePath $ExportPath\$User-Second.pst
    }
}


<#
Other commands to run manually

Monitor Progress:  Get-MailboxExportRequest | Get-MailboxExportRequestStatistics

Clear Mailbox Requests that are complete:  Get-MailboxExportRequest | where {$_.status -eq "Completed"} | Remove-MailboxExportRequest 

#>

