# 🎓 Graduate Talent Pipeline Tracker (CLI-Based)

Welcome to the **mthree Graduate Talent Pipeline Tracker**, a powerful and fully interactive **CLI-based system** designed to streamline the process of **onboarding, tracking, and evaluating graduates** during their journey through training and beyond.

> ⚡ Built with Bash and MySQL | 💻 Runs on Linux, Git Bash (Windows), or EC2 | ✨ Real-world structure | 🧠 Highly customizable

---

## 📚 Table of Contents

- [📦 Project Structure](#-project-structure)
- [🚀 Features](#-features)
- [📂 Module Overviews](#-module-overviews)
  - [1. Add Graduate](#1-add-graduate)
  - [2. View Graduates](#2-view-graduates)
  - [3. Add Certification](#3-add-certification)
  - [4. Add Project](#4-add-project)
  - [5. Performance Review](#5-performance-review)
  - [6. Weekly Engagement Entry](#6-weekly-engagement-entry)
  - [7. Generate Readiness Report](#7-generate-readiness-report)
  - [8. CLI Assessment for Hiring](#8-cli-assessment-for-hiring)
- [📊 Sample Report Output](#-sample-report-output)
- [🛠 Prerequisites](#-prerequisites)
- [📦 Installation & Setup](#-installation--setup)
- [🎮 Running the Application](#-running-the-application)
- [📁 Folder Structure](#-folder-structure)
- [📌 Future Enhancements](#-future-enhancements)
- [🤝 Team](#-team)
- [📄 License](#-license)

## 📂 Project Structure

```

📦mthree_pipeline_tracker/

├── admin-portal/
│   ├── login.sh
│   └── dashboard.sh

├── student-portal/
│   ├── login.sh
│   └── cli_assessment.sh
│   ├── reports/

├── scripts/
│   ├── add_graduate.sh
│   ├── view_graduates.sh
│   ├── add_certification.sh
│   ├── add_project.sh
│   ├── performance_review.sh
│   ├── weekly_engagement.sh
│   └── generate_readiness.sh

├── logs/
└── README.md

```

## 🚀 Features

✅ Fully CLI-based user interface  
✅ Uses **MySQL** to store, query, and manage training data  
✅ Supports **real-time performance review and certification tracking**  
✅ Weekly engagement entries and report generation  
✅ Automatic readiness report in `.txt` format  
✅ **Pre-training assessment** to shortlist candidates  
✅ Modular scripts for every operation  
✅ Color-coded terminal outputs for better UX  
✅ Structured codebase with clean folder organization

---

## 📂 Module Overviews

### 1. 🧑‍🎓 Add Graduate
Adds a new graduate with personal and joining details into the system.

📄 **Script**: `scripts/add_graduate.sh`

---

### 2. 📋 View Graduates
Displays a list of all registered graduates with their basic info.

📄 **Script**: `scripts/view_graduates.sh`

---

### 3. 📜 Add Certification
Tracks certifications completed by each graduate during the training phase.

📄 **Script**: `scripts/add_certification.sh`

---

### 4. 💼 Add Project
Logs projects assigned to a graduate, including title, tech stack, and status.

📄 **Script**: `scripts/add_project.sh`

---

### 5. 📈 Performance Review
Allows the instructor to give scores and feedback for key performance metrics such as:
- Activeness
- Doubt-solving ability
- Attendance
- Weekly participation

📄 **Script**: `scripts/performance_review.sh`

---

### 6. 📅 Weekly Engagement Entry
Lets trainers/instructors enter weekly insights or remarks on student engagement.

📄 **Script**: `scripts/weekly_engagement.sh`

---

### 7. 📑 Generate Readiness Report
Generates a **structured report** with:
- Graduate info
- Projects
- Certifications
- Performance scores
- Weekly comments

📄 **Script**: `scripts/generate_readiness.sh`  
📁 **Output**: `reports/grad_{id}_report.txt`

> ℹ️ Redirect output to a file:

bash scripts/generate_readiness.sh > reports/grad_1_report.txt

### 8. 🧪 CLI Assessment for Hiring

efore training, each candidate must pass a Linux & MySQL assessment.

📁 Path: interview-assessment/cli-test/cli_assessment.sh

✅ Topics Covered:
Basic Linux commands

MySQL command-line questions

Real-world scenarios (e.g. crontab, permissions)

📝 Results are auto-graded and logged into logs/test_results.log
📊 Grading system: EXCELLENT, GOOD, or NEEDS IMPROVEMENT

🎯 Use case: Only shortlisted candidates move to training phase


### 🛠 Prerequisites
✅ MySQL server

✅ Git Bash (Windows) or Bash Shell (Linux/Mac)

✅ mysql CLI tool configured with credentials

🐧 For Linux users: optionally install tput for colored terminal (usually pre-installed)

📦 Installation & Setup

1. Clone the repository:
git clone https://github.com/yourusername/mthree_pipeline_tracker.git

2.Navigate to the project:
cd mthree_pipeline_tracker/database/mthree_pipeline_tracker

3. Setup the MySQL database (optional SQL dump can be added):

mysql -u root -p < schema.sql

🎮 Running the Application
Run the dashboard to use the system:
bash dashboard.sh

you will see like:
![image](https://github.com/user-attachments/assets/07f4fa8d-136b-4e28-8952-260da71c06f7)

🤝 Team
👨‍💻 Team 1 – Project: CLI-Based Graduate Talent Pipeline Tracker for mthree

Sushanth

Nandan

Sreemathi

Srihari


