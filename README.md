# Jenkins LTS Installation Script (Ubuntu 24.04)

This repository provides a simple shell script to install **Jenkins Long Term Support (LTS)** on **Ubuntu 24.04** using the official Jenkins APT repository and **OpenJDK 21**, as recommended by Jenkins.

---

## 📌 Features

- Installs **OpenJDK 21**
- Adds official **Jenkins LTS repository**
- Installs Jenkins via `apt`
- Enables Jenkins at system startup
- Starts Jenkins automatically
- Displays Jenkins service status
- Prints instructions to retrieve the initial admin password

---

## 🧩 Prerequisites

- Ubuntu **24.04 LTS**
- Root or sudo access
- Minimum system requirements:
  - **256 MB RAM** (4 GB recommended)
  - **1 GB disk space** (10 GB recommended)
- Open ports:
  - **8080** (default Jenkins port)

---

## 📂 Repository Structure

```text
.
├── install_jenkins_lts.sh
└── README.md
