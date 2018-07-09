$azureAccountName ="$accname"
$azurePassword = ConvertTo-SecureString "$pwd" -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
#Login-AzureRmAccount -C -Credential $psCred

Add-AzureRmAccount -Credential $psCred -TenantId $tenantid -ServicePrincipal
