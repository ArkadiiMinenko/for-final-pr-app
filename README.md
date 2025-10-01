# 🚀 Final Project – GitOps CI/CD on AWS EKS with ArgoCD

![GitHub Actions](https://github.com/ArkadiiMinenko/for-final-pr-app/actions/workflows/docker-publish.yml/badge.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/ArkadiiMinenko/for-final-pr-app)
![Docker Pulls](https://img.shields.io/docker/pulls/sterben007/devops-app)

---

## 🎯 Task
Build a fully automated deployment pipeline for a simple Python application:
- Create a backend server in Docker
- Set up GitHub Actions to build and publish the image
- Provision an AWS EKS cluster with Terraform
- Add ingress controller and cert-manager for HTTPS
- Install and configure ArgoCD
- Organize a GitOps workflow: any code change → automatic redeploy to EKS

---

## 🔨 What has been done

**Backend server**
- Python HTTP server on port `8080`, responds with `200 OK` on `/`
- Returns Pod IP to verify Kubernetes deployment

**Docker**
- Lightweight `python:3.11-slim` base image
- Runs as non-root user
- Healthcheck included

**CI/CD (GitHub Actions)**
- On push to `main` → build Docker image
- Push image to Docker Hub (`sterben007/devops-app`)
- Update `deployment.yaml` with new tag
- Commit manifest change back to Git (GitOps)

**Infrastructure (Terraform)**
- AWS EKS cluster with one node group (1 worker)
- Installed `nginx-ingress` controller
- Installed `cert-manager` (Let’s Encrypt TLS)
- Installed `ArgoCD` (via Helm chart)

**Kubernetes manifests**
- Deployment, Service, and Ingress for the Python app
- Ingress annotated for cert-manager (`letsencrypt-prod`)

**ArgoCD**
- Configured to monitor repo (`app/` path)
- Auto-sync and self-heal enabled
- UI accessible with TLS

---

## 🌍 DNS & Access
During the project execution, the following DNS endpoints were configured and accessible with valid TLS:

- App → https://app.arkadii.devops7.test-danit.com  
- ArgoCD → https://argocd.arkadii.devops7.test-danit.com  

⚠️ Currently the cluster is destroyed (Terraform `destroy` completed).  
Proof of work is available in the `srceens/` folder:  
- Application available via DNS (with HTTPS)  
- ArgoCD UI (Synced & Healthy)  
- Docker Hub new image tags  
- GitHub Actions runs  
- `kubectl get all` output from EKS

---

## 🧩 Problems solved
- **Automation** – no manual deployments, full CI/CD
- **Transparency** – Git is the single source of truth
- **Recoverability** – ArgoCD self-heal restores drift
- **Security** – TLS via Let’s Encrypt, secrets in GitHub Secrets
- **Scalability** – ready for replicas, autoscaling, and more services

---

## ✅ Result
- Python app was successfully deployed to EKS and served via HTTPS at `app.arkadii.devops7.test-danit.com`
- ArgoCD UI was accessible at `argocd.arkadii.devops7.test-danit.com`
- All infrastructure as code (Terraform + K8s manifests)
- Fully automated CI/CD pipeline with GitHub Actions and Docker Hub
- Full project flow verified with screenshots in `srceens/` folder

---

👉 This project demonstrates a complete **GitOps flow**: from a GitHub commit → Docker image → ArgoCD sync → app running in EKS with HTTPS, verified with DNS and TLS.