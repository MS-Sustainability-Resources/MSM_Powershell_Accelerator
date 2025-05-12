# Load config
$config = Get-Content -Raw -Path ".\appsettings.json" | ConvertFrom-Json

$tenantId = $config.tenant_id
$clientId = $config.client_id
$clientSecret = $config.client_secret
$crmUrl = $config.crm_base_url

# Auth endpoint
$tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"

# Get access token
$response = Invoke-RestMethod -Method POST -Uri $tokenUrl -Body @{
    client_id     = $clientId
    client_secret = $clientSecret
    scope         = "$crmUrl/.default"
    grant_type    = "client_credentials"
} -ContentType "application/x-www-form-urlencoded"

$accessToken = $response.access_token

# GET Emissions (optional)
Write-Host "`n--- GET Emissions Records ---"
Invoke-RestMethod -Method GET -Uri "$crmUrl/api/data/v9.2/msdyn_emissions" `
    -Headers @{ Authorization = "Bearer $accessToken" }

# POST Emission Record
Write-Host "`n--- POST New Emission Record ---"
$body = Get-Content -Raw -Path ".\sample-payload.json"

Invoke-RestMethod -Method POST -Uri "$crmUrl/api/data/v9.2/msdyn_emissions" `
    -Headers @{
        Authorization = "Bearer $accessToken"
        "Content-Type" = "application/json"
    } -Body $body
