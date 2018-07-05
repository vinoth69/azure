$azureAccountName ="${bamboo.azure.accountname}"
$azurePassword = ConvertTo-SecureString "${bamboo.azure.accountpassword}" -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
#Login-AzureRmAccount -C -Credential $psCred

Add-AzureRmAccount -Credential $psCred -TenantId ${bamboo.azure.tenantid} -ServicePrincipal

Get-AzureRmADApplication

New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleResourceGroup `
  -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-storage-account-create/azuredeploy.json `
  -storageAccountType Standard_GRS
