# Search Mac Addres in Microsoft Dhcp Server
This simple Powershell script search the entered MAC address from the authorized computers that run the DHCP server service from Active Directory and shows other lease information such as **Scope ID**, **IP Address**, **Hostname** and **Address State**  for entered MAC Address.


**Note**: No need to enter the full MAC Address. You can enter just three or two octets:

```powershell
Input the MAC address you want to search for: *f6-d4

ScopeId      : 192.168.1.0
IPAddress    : 192.168.1.117
HostName     : Beheshti.Contoso.Local
ClientID     : 60-eb-f2-72-f6-d4
AddressState : Active
```
