#!/bin/bash

# ✅ Load MySQL credentials from .env file in project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
source "$PROJECT_ROOT/.env"

# 🔐 Inputs
read -p "🎓 Enter Graduate ID: " grad_id
read -p "📜 Certification Name: " cert_name
read -p "🌐 Platform (e.g., Coursera, Udemy): " platform
read -p "📅 Date Completed (YYYY-MM-DD): " date_completed
read -p "✅ Is Verified? (1 = Yes, 0 = No): " is_verified

# ✅ Check if graduate exists
exists=$(mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -se "SELECT COUNT(*) FROM graduates WHERE id='$grad_id';")

if [ "$exists" -eq 0 ]; then
  echo "❌ Graduate ID $grad_id does not exist. Please add the graduate first."
  exit 1
fi

# ✅ Insert if valid
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
INSERT INTO certifications (grad_id, cert_name, platform, date_completed, is_verified)
VALUES ('$grad_id', '$cert_name', '$platform', '$date_completed', '$is_verified');
EOF

# ✅ Confirm
if [ $? -eq 0 ]; then
  echo "✅ Certification added successfully!"
else
  echo "❌ Failed to add certification. Check your input."
fi
