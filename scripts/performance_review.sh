#!/bin/bash

echo "🔍 Performance Review"

read -p "🎓 Enter Graduate ID: " grad_id
read -p "🧑<200d>🏫 Enter Reviewer Name: " reviewer
read -p "⭐ Enter Rating (1-5): " rating
read -p "💬 Enter Feedback: " feedback

# Simple Sentiment Tagging Logic
lower_feedback=$(echo "$feedback" | tr '[:upper:]' '[:lower:]')

if echo "$lower_feedback" | grep -qE "excellent|great|good|amazing|impressive|fantastic|brilliant"; then
    sentiment="Positive"
elif echo "$lower_feedback" | grep -qE "poor|bad|struggle|weak|confused|late"; then
    sentiment="Negative"
else
    sentiment="Neutral"
fi

# Get today's date
review_date=$(date +%F)

# Store in MySQL
mysql -u root -p -D mthree_tracker -e "INSERT INTO performance_reviews (grad_id, reviewer_name, rating, feedback, review_date, sentiment_tag) VALUES ('$grad_id', '$reviewer', '$rating', '$feedback', '$review_date', '$sentiment');"

echo "✅ Review submitted for Graduate ID $grad_id with sentiment ➤ $sentiment"
