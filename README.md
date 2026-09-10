# Global Hybrid Cloud Network & Secure Migration Fabric

## 1. Executive Summary & Business Scenario
An enterprise-grade, open-source hybrid cloud architecture simulating an online sports betting platform expansion into a regulated market. This repository bridges a secure private virtualization/database tier with a public cloud AWS/Azure landing zone using 100% open-source tooling, automated via Ansible and Terraform, and version-controlled without binary bloat.

## 2. Open-Source Technology Mapping
* VMware vSphere / ESXi        --> Linux KVM / QEMU & Docker Containerization
* vSAN / Nimble Storage        --> Local Docker Volumes & File-based Storage
* VMware NSX-T Overlay         --> Docker Bridge/Overlay Networks & Open vSwitch
* Cisco ASAv Firewall          --> Linux iptables / nftables & VyOS Routing
* AWS / Azure Infrastructure   --> LocalStack & Python-based Cloud Simulation (Boto3)
* Veeam Backup & Recovery      --> Automated Python/Tarball Encrypted Backup Vaults
* Automation & IaC             --> Ansible & Python Core Automation Scripts

## 3. Architecture Overview Across 4 Phases
- **Phase 1 (Private Tier):** Containerized PostgreSQL database (`private-db`) with automated schema provisioning.
- **Phase 2 (Migration & Network):** Secure Python migration scripts (`scripts/migrate_ledger.py`) and network topology simulations (`scripts/cloud_fabric.py`).
- **Phase 3 (Public Cloud Landing Zone):** Modular Terraform configurations establishing AWS VPCs, public/private subnets, and hybrid routing gateways (`terraform/`).
- **Phase 4 (Hardening & Automation):** Automated Ansible playbooks (`ansible/configure_servers.yml`) enforcing security compliance, UFW firewall rules, and high-throughput kernel tuning.

## 4. Quick Start & Deployment Guide

### Step 1: Provision Private Database & Schema
```bash
docker compose up -d
ansible-playbook -i ansible/hosts.ini ansible/setup_db.yml

```

### Step 2: Run Cloud Simulation & Migration Export

```bash
python3 scripts/cloud_fabric.py
python3 scripts/migrate_ledger.py

```

### Step 3: Execute Infrastructure Hardening Playbook

```bash
ansible-playbook -i ansible/hosts.ini ansible/configure_servers.yml

```

## 5. Project Documentation Reference

* **Architecture Overview:** See `project_architecture_overview.txt`
* **Master Engineering Journal & Interview Guide:** See `complete_project_master_journal.txt`

