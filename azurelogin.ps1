$azureAccountName ="${bamboo.azure.accountname}"
$azurePassword = ConvertTo-SecureString "${bamboo.azure.accountpassword}" -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
#Login-AzureRmAccount -C -Credential $psCred

Add-AzureRmAccount -Credential $psCred -TenantId ${bamboo.azure.tenantid} -ServicePrincipal

Get-AzureRmADApplication

New-AzureRmResourceGroupDeployment -Name ExampleDeployment_1911yyy -ResourceGroupName ExampleResourceGroup `
  -TemplateFile Webapp.JSON `
  -storageAccountType Standard_GRS
