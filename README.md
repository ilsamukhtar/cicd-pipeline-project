# 🚀 Production-Ready CI/CD Pipeline on AWS

![CI/CD](https://img.shields.io/badge/CI%2FCD-Jenkins%20%7C%20GitHub%20Actions-blue)
![Docker](https://img.shields.io/badge/Container-Docker-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS%20eu--north--1-FF9900?logo=amazonaws&logoColor=white)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus%20%7C%20Grafana-E6522C?logo=prometheus&logoColor=white)
![Python](https://img.shields.io/badge/App-Python%20Flask-3776AB?logo=python&logoColor=white)

> **Developed by:** Ilsa Mukhtar
> **GitHub:** [github.com/ilsamukhtar](https://github.com/ilsamukhtar)
> **LinkedIn:** [linkedin.com/in/ilsa-mukhtar](https://linkedin.com/in/ilsa-mukhtar)
> **DockerHub:** [hub.docker.com/u/ilsamukhtar](https://hub.docker.com/u/ilsamukhtar)

---

## 📌 Project Overview

A **production-grade, end-to-end CI/CD pipeline** for a Python Flask application —
built with real-world DevOps tools and industry best practices.

| Stage | Tool Used |
|---|---|
| 👩‍💻 Application | Python Flask |
| 🧪 Testing | Pytest |
| 🐳 Containerization | Docker |
| ☸️ Orchestration | Kubernetes |
| 🔧 CI/CD | Jenkins + GitHub Actions |
| 🏗️ Infrastructure | Terraform (AWS) |
| ☁️ Cloud | AWS — Region: eu-north-1 |
| 📊 Monitoring | Prometheus + Grafana |

---

## 🏗️ Architecture

```mermaid
flowchart TD
    A([👩‍💻 Developer Push\ngit push → GitHub]) --> B
    B([⚙️ GitHub Actions + Jenkins CI\nWebhook triggers pipeline]) --> C
    C([🧪 Run Tests — Pytest\napp/tests/test_app.py]) --> D
    D([🐳 Docker Build\ndocker build → Dockerfile]) --> E
    E([📤 Push to DockerHub\nilsamukhtar/flask-cicd-app]) --> F
    F([🏗️ Terraform — AWS eu-north-1\nVPC + EC2 + Security Group]) --> G
    G([☸️ Deploy to Kubernetes\n2 replicas — NodePort service]) --> H
    G --> NS([📁 namespace.yaml\nflask-app])
    G --> DP([📄 deployment.yaml\n2 replicas])
    G --> SV([📄 service.yaml\nNodePort 30007])
    H([✅ Flask App Running\nPort 5000 — /health endpoint]) --> I
    I([📊 Prometheus + Grafana\nMetrics scrape → Dashboard])

    style A fill:#7F77DD,stroke:#534AB7,color:#fff
    style B fill:#378ADD,stroke:#185FA5,color:#fff
    style C fill:#1D9E75,stroke:#0F6E56,color:#fff
    style D fill:#378ADD,stroke:#185FA5,color:#fff
    style E fill:#378ADD,stroke:#185FA5,color:#fff
    style F fill:#BA7517,stroke:#854F0B,color:#fff
    style G fill:#1D9E75,stroke:#0F6E56,color:#fff
    style NS fill:#5DCAA5,stroke:#1D9E75,color:#fff
    style DP fill:#5DCAA5,stroke:#1D9E75,color:#fff
    style SV fill:#5DCAA5,stroke:#1D9E75,color:#fff
    style H fill:#639922,stroke:#3B6D11,color:#fff
    style I fill:#D85A30,stroke:#993C1D,color:#fff
```

---

## 📁 Project Structure

```
cicd-pipeline-project/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── tests/
│       └── test_app.py
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── monitoring/
│   ├── prometheus-config.yaml
│   └── grafana-dashboard.json
└── README.md
```

---

## 🚀 Quick Start

### Step 1 — Clone Repository
```bash
git clone https://github.com/ilsamukhtar/cicd-pipeline-project.git
cd cicd-pipeline-project
```

### Step 2 — Run Locally with Docker
```bash
docker-compose up -d
curl http://localhost:5000
curl http://localhost:5000/health
```

### Step 3 — Run Tests
```bash
pip install -r app/requirements.txt
cd app
python -m pytest tests/ -v
```

### Step 4 — Build & Push Docker Image
```bash
docker build -t ilsamukhtar/flask-cicd-app:latest .
docker push ilsamukhtar/flask-cicd-app:latest
```

### Step 5 — Deploy to Kubernetes (Minikube)
```bash
minikube start
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl get pods -n flask-app
minikube service flask-cicd-service -n flask-app
```

### Step 6 — Provision AWS Infrastructure
```bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
terraform output
# Kaam khatam hone ke baad:
terraform destroy -auto-approve
```

### Step 7 — Setup Monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --set grafana.adminPassword=admin123
kubectl port-forward svc/prometheus-grafana 3000:80 -n monitoring
```

> Grafana: `http://localhost:3000` | User: `admin` | Pass: `admin123`

---

## 🔐 GitHub Secrets Setup

GitHub → Repository → Settings → Secrets → Actions:

| Secret Name | Value |
|---|---|
| `DOCKERHUB_USERNAME` | `ilsamukhtar` |
| `DOCKERHUB_TOKEN` | DockerHub Access Token |

---

## 👩‍💻 Author

**Ilsa Mukhtar** — DevOps & Cloud Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-ilsa--mukhtar-0A66C2?logo=linkedin&logoColor=white)](https://linkedin.com/in/ilsa-mukhtar)
[![GitHub](https://img.shields.io/badge/GitHub-ilsamukhtar-181717?logo=github&logoColor=white)](https://github.com/ilsamukhtar)
[![DockerHub](https://img.shields.io/badge/DockerHub-ilsamukhtar-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/u/ilsamukhtar)
[![Email](https://img.shields.io/badge/Email-ilsamukhtar3%40gmail.com-EA4335?logo=gmail&logoColor=white)](mailto:ilsamukhtar3@gmail.com)

---

## 📜 License

MIT License — feel free to use and modify.
