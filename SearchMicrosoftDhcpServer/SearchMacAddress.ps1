$choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Y","&N")
while ( $true ) {
$MACtoFind = Read-Host -Prompt "Input the MAC address you want to search for"
$DHCPServers = Get-DHCPServerInDC | 
                select IPAddress, DNSName 

ForEach ($DHCPServer in $DHCPServers) 
  {
    try 
    {
        Get-DhcpServerv4Scope -ComputerName $DHCPServer.DNSName | 
         select ScopeID |
         ForEach-Object {Get-DHCPServerv4Lease -ScopeId $_.ScopeId -ComputerName $DHCPServer.DNSName -AllLeases  | 
         where {$_.ClientID -like $MACtoFind } | Select-Object ScopeId,IPAddress,HostName,ClientID,AddressState }

    }
    catch 
    { 
        write-host "Caught an exception:" -ForegroundColor Red
        write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
        write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Re
        write-host "Exception reason: $($_.Exception.NativeErrorCode)" -ForegroundColor Red
    }
  }
  $choice = $Host.UI.PromptForChoice("Do you want to search for another MAC Address?","",$choices,0)
  if ( $choice -ne 0 ) {
    break
  }
}
