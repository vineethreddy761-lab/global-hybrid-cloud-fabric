# Global Hybrid Cloud Network & Secure Migration Fabric

A resilient, self-contained hybrid cloud simulation and secure data migration framework engineered for high-availability sports betting platforms.

---

## 🏗️ Architecture Overview

The framework simulates a secure, multi-tier hybrid architecture bridging on-premises secure databases with cloud networking components:

1. **Private Storage & Database Tier:** 
   - PostgreSQL running in a containerized Docker environment (`private-db`).
   - Automated schema setup and provisioning managed through Ansible playbooks (`ansible/setup_db.yml`).
2. **Cloud Infrastructure Simulation:**
   - Python-based cloud VPC and subnet topology simulation (`scripts/cloud_fabric.py`) ensuring reliable provisioning without binary dependency locks.
3. **Secure Migration Ledger Fabric:**
   - Automated transaction and player balance ledger export (`scripts/migrate_ledger.py`) for secure multi-region synchronization.
4. **Continuous Integration:**
   - Automated GitHub Actions workflow (`.github/workflows/ci.yml`) testing script execution on every push.

---

## 📂 Project Structure

```text
global-hybrid-cloud-fabric/
├── ansible/
│   └── setup_db.yml          # Automated database schema configuration
├── scripts/
│   ├── cloud_fabric.py       # Python cloud VPC and network simulation
│   └── migrate_ledger.py     # Secure ledger export and migration sync
├── .github/
│   └── workflows/
│       └── ci.yml            # CI validation pipeline
├── docker-compose.yml        # Local database service definition
├── .gitignore                # Excludes large binaries and state files
└── README.md                 # Project documentation
