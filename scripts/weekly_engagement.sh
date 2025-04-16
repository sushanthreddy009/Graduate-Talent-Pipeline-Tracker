#!/bin/bash

echo "📅 Weekly Engagement Tracking"

read -p "🎓 Enter Graduate ID: " grad_id
read -p "📅 Week Number (e.g., 1, 2, 3): " week_no
read -p "📊 Attendance Percentage (0-100): " attendance_percent
read -p "❓ Number of Doubts Asked: " doubts_asked
read -p "✅ Number of Doubts Answered: " doubts_answered
read -p "🔥 Activity Level (e.g., Low, Medium, High): " activity_level
read -p "⭐ Activeness Rating (1-5): " activeness_rating

# Insert into MySQL
mysql -u root -p -D mthree_tracker -e "
INSERT INTO engagement (
    grad_id, week_no, attendance_percent, doubts_asked, doubts_answered, activity_level, activeness_rating
) VALUES (
    '$grad_id', '$week_no', '$attendance_percent', '$doubts_asked', '$doubts_answered', '$activity_level', '$activeness_rating'
);"

echo "✅ Engagement report logged for Graduate ID $grad_id (Week $week_no)"
