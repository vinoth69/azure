[CmdletBinding()]
param
(
    # Enter Subscription Id for deployment.
    [Parameter(Mandatory = $true)]
    [string]
    $accname,

    # Azure AD Tenant Id.
    [Parameter(Mandatory = $true)]
    [string]
    $pwd,
	
    # Azure AD Tenant Id.
    [Parameter(Mandatory = $true)]
    [string]
    $tenantid
)

$azureAccountName = $accname
$azurePassword = ConvertTo-SecureString $pwd -AsPlainText -Force
$psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
#Login-AzureRmAccount -C -Credential $psCred

Add-AzureRmAccount -Credential $psCred -TenantId $tenantid -ServicePrincipal

New-AzureRmResourceGroupDeployment -ResourceGroupName ExampleResourceGroup -TemplateFile storageaccount.json
