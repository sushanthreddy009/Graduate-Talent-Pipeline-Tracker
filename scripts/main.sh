#!/bin/bash

while true; do
  echo "-----------------------------------------"
  echo "🎓 Graduate Talent Pipeline Tracker"
  echo "-----------------------------------------"
  echo "1. Add Graduate"
  echo "2. View Graduates"
  echo "3. Add Certification"
  echo "4. Add Project"
  echo "5. Performance Review"
  echo "6. Weekly Engagement Entry"
  echo "7. Generate Readiness Report"
  echo "8. Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1) bash ./scripts/add_graduate.sh ;;
    2) bash ./scripts/view_graduates.sh ;;
    3) bash ./scripts/add_certification.sh ;;
    4) bash ./scripts/add_project.sh ;;
    5) bash ./scripts/performance_review.sh ;;
    6) bash ./scripts/weekly_engagement.sh ;;
    7) bash ./scripts/generate_readiness.sh ;;
    8) echo "Exiting..."; exit ;;
    *) echo "❌ Invalid choice. Try again." ;;
  esac
done
