$ServerList = Import-Csv -Path C:\Temp\servers.csv -Header Name
$array = $null
$array = @()

foreach ($Server in $ServerList) {
    $Address = [System.Net.Dns]::GetHostAddresses($Server.Name)
	$obj = New-Object PSObject
		$obj | Add-Member -MemberType NoteProperty -Name "Computer Name" -Value $Server.Name
		$obj | Add-Member -MemberType NoteProperty -Name "Computer Address" -Value $Address.IPAddressToString
	$array += $obj
	$Address = $null
	}

$array | Export-Csv -Path "C:\Temp\resolved.csv" -NoTypeInformation
