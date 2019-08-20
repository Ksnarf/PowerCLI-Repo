#This .ps1 will collect the inventory of $cluster within the $vc vCenter & snapshot each device within the generated .csv 

#Update this XML with creds that have both View & Take Snapshot access
$cred = Get-VICredentialStoreItem -file "C:\Temp\RoWESXCred.xml"

#Update this with whatever vCente rou are trying to access. 


$vc = "esv1-g-vc01.contsco.biz"

Connect-VIServer -Server $vc -User $cred.User -Password $cred.Password


#Run to get updated cluster inventory
$cluster = "Genesys-PPE-DEV"
$csvloc = "C:\Temp\ClusterExport.csv" 
Get-Cluster $cluster | Get-VM | Sort Name | Export-Csv $csvloc
#


$server = Import-Csv 
Foreach ($vm in $server) {
    
    $vm.Name = $vmname
    $vm.IP = $vmip
    $vm.


 get-vm $vmname | New-Snapshot -name AutomatedSnapshot -Description "Created on $(Get-Date)" -Quiesce -Memory 

 get-snapshot -vm $vmname

}
  

