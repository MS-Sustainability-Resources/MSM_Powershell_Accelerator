# 🌱 Microsoft Sustainability Manager – PowerShell API Accelerator (Target: msdyn_emission)

This PowerShell-based accelerator lets you connect to Microsoft Sustainability Manager and interact with the `msdyn_emission` table in Dataverse — no Postman or app development required.

---

## ✅ What It Does
- Authenticates to Azure AD using client credentials
- Calls `GET /msdyn_emissions` to list emissions records
- Sends a `POST` request to create a new Emission record

---

## ⚙️ Setup Instructions

### 1. Register an Azure App
- In Azure Portal → Azure AD → App registrations:
  - Register an app
  - Add `Dynamics CRM` API permissions (Application type)
  - Grant admin consent
  - Create a client secret

### 2. Update `appsettings.json`
Replace with your environment details:
```json
{
  "client_id": "...",
  "client_secret": "...",
  "tenant_id": "...",
  "crm_base_url": "https://yourorg.crm.dynamics.com"
}
```

### 3. Run the Script
```powershell
.\Test-MSDYNEmission.ps1
```

---

## 📦 Payload Example (`sample-payload.json`)

```json
{
  "msdyn_name": "Electricity Usage – May 2024",
  "msdyn_scope": 100000001,
  "msdyn_reportingdate": "2024-05-31T00:00:00Z",
  "msdyn_co2e": 1250,
  "msdyn_co2eunit@odata.bind": "/msdyn_units(<unit-guid>)",
  "msdyn_facilityid@odata.bind": "/msdyn_facilities(<facility-guid>)"
}
```

## 🎯 Value

- ✅ Fast, secure testing of emissions data flows
- ✅ Aligned with Microsoft’s core sustainability data model
- ✅ Reusable for demos, onboarding, or integration testing

---

## 🔐 Secure & Lightweight
- Uses only PowerShell + HTTPS
- No third-party tools needed

