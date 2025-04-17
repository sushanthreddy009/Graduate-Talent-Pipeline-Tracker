#!/bin/bash

# 🔐 Input fields
read -p "💻 Enter Graduate ID: " grad_id
read -p "📌 Project Title: " title
read -p "💾 Description: " description
read -p "🧠 Technologies Used: " tech
read -p "⏳ Duration (e.g., 3 months): " duration
read -p "📅 Completion Date (YYYY-MM-DD): " date


# ✅ INSERT into DB
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
INSERT INTO projects (grad_id, title, description, technologies, duration, completion_date)
VALUES ('$grad_id', '$title', '$description', '$tech', '$duration', '$date');
EOF

# ✅ Check success/failure
if [ $? -eq 0 ]; then
  echo "✅ Project added successfully!"
else
  echo "❌ Failed to add project. Please check graduate ID or input format."
fi
