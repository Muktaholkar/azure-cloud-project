# 🌤️ Azure Cloud Project — by [@Muktaholkar](https://github.com/Muktaholkar)

This is a complete **Azure Cloud Starter Project**, designed to help you learn and deploy real cloud services using **Microsoft Azure**.  
It includes a sample frontend, backend (Azure Functions), and Infrastructure as Code (Bicep) — all deployable automatically via **GitHub Actions**.

> ⚡ No .zip download required — everything runs directly from your GitHub repository.

---

## 🚀 Project Overview

This project demonstrates how to combine key Azure components:

- 🌐 **Azure Static Web Apps** — Frontend hosting  
- ⚙️ **Azure Functions** — Serverless backend API  
- 🗃️ **Azure Cosmos DB (Serverless)** — Cloud database  
- 🧱 **Azure Bicep** — Infrastructure as Code  
- 🔁 **GitHub Actions** — Automated CI/CD pipeline  

> Ideal for cloud learning, Azure certification prep, or portfolio-building.

---

## 🏗️ Architecture

[User Browser]
↓
Azure Static Web App (Frontend)
↓
Azure Function API → Cosmos DB (Serverless)
↓
Monitoring via Application Insights

yaml
Copy code

---

## 📁 Repository Structure

azure-cloud-project/
├── app/ # Frontend (HTML / React / Vite etc.)
│ └── index.html
├── api/ # Azure Functions backend
│ ├── HttpExample/
│ │ ├── function.json
│ │ └── index.ts
│ └── package.json
├── infra/ # Infrastructure as Code (Bicep)
│ └── main.bicep
├── .github/workflows/ # CI/CD pipeline
│ └── deploy.yml
├── .gitignore
├── LICENSE
└── README.md

yaml
Copy code

---

## 🧰 Prerequisites

Before starting, make sure you have the following installed:

| Tool | Description | Install Command |
|------|--------------|----------------|
| **Azure CLI** | Manage Azure resources | `winget install -e --id Microsoft.AzureCLI` |
| **Node.js (LTS)** | Run JavaScript / TypeScript | `winget install OpenJS.NodeJS.LTS` |
| **Azure Functions Core Tools** | Run Functions locally | `npm i -g azure-functions-core-tools@4` |
| **Bicep CLI** | Infrastructure as Code | `az bicep upgrade` |
| **GitHub Account** | Store & deploy your code | [github.com/Muktaholkar](https://github.com/Muktaholkar) |

---

## 🔑 Azure Setup

1. **Login to Azure**
   ```bash
   az login
Select your free subscription

bash
Copy code
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
Create a Resource Group

bash
Copy code
az group create -n rg-azure-cloud-project -l centralindia
Deploy infrastructure

bash
Copy code
az deployment group create \
  -g rg-azure-cloud-project \
  -f infra/main.bicep \
  -p projectName=azureproject env=dev location=centralindia
✅ This creates:

Azure Static Web App (Free tier)

Azure Cosmos DB (Serverless)

Application Insights

💻 Local Development
Run the Backend (Azure Functions)
bash
Copy code
cd api
npm install
func start
Visit: http://localhost:7071/api/hello

Run the Frontend
bash
Copy code
cd app
npx serve .
Visit: http://localhost:3000

Or run both with Static Web Apps CLI:

bash
Copy code
npm i -g @azure/static-web-apps-cli
swa start app --api api
🔁 Continuous Deployment (CI/CD)
GitHub Actions automatically deploy your project when you push to the main branch.

🔧 Setup Required Secrets
In your repo:
Settings → Secrets and variables → Actions

Add these secrets:

AZURE_SUBSCRIPTION_ID

AZURE_RESOURCE_GROUP → rg-azure-cloud-project

AZURE_STATIC_WEB_APPS_API_TOKEN

(optional) AZURE_CLIENT_ID, AZURE_TENANT_ID

Workflow: .github/workflows/deploy.yml

This pipeline:

Builds your frontend (app/)

Builds your API (api/)

Validates & deploys infra (infra/main.bicep)

Deploys to Azure Static Web Apps

🧩 Configuration
Azure Function Environment Variables
Set these under Application Settings in Azure:

COSMOS_DB_CONNSTR

COSMOS_DB_NAME

COSMOS_CONTAINER

Frontend Routing
If you need custom routes or authentication, create app/routes.json.

🧪 Testing
Add tests using your preferred tools:

Frontend: Jest or Vitest

API: Mocha / Chai

Run tests:

bash
Copy code
npm test
💰 Cost Management
This setup uses free or serverless tiers, suitable for learning or demos.

Static Web App — Free

Cosmos DB — Serverless + Free Tier (1,000 RU/s)

App Insights — Pay-per-use (optional)

To clean up:

bash
Copy code
az group delete -n rg-azure-cloud-project --yes --no-wait
🗺️ Roadmap Ideas
 Add Authentication (Azure Entra ID)

 Connect API to Cosmos DB (CRUD operations)

 Add App Insights monitoring & alerts

 Add staging environment (env=stg)

 Add Playwright / Postman API tests

🧭 Learning Focus
This repo helps you:

Learn Azure cloud deployment (Static Web + Functions + Cosmos DB)

Practice Infrastructure as Code (Bicep)

Understand serverless architecture

Build a portfolio-ready Azure project

📄 License
This project is licensed under the MIT License — see the LICENSE file for details.

🌍 Repository Links
🔗 GitHub Repo → https://github.com/Muktaholkar/azure-cloud-project

☁️ Azure Portal → https://portal.azure.com

🧱 Bicep Reference → https://learn.microsoft.com/azure/azure-resource-manager/bicep/
