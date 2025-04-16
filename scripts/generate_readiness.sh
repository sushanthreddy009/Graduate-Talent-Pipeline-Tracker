#!/bin/bash

echo "📈 Generating Placement Readiness Report..."

read -p "🎓 Enter Graduate ID: " grad_id

DB_USER="root"
DB_PASS="@Sushanth6302"
DB_NAME="mthree_tracker"

# Fetch total rating & count
total_rating=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT IFNULL(SUM(rating),0) FROM performance_reviews WHERE grad_id=$grad_id;")
review_count=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT COUNT(*) FROM performance_reviews WHERE grad_id=$grad_id;")

# Calculate average rating
if [ "$review_count" -ne 0 ]; then
  avg_rating=$(( total_rating / review_count ))
else
  avg_rating=0
fi

# Fetch activeness rating (rounded)
activeness=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT IFNULL(AVG(activeness_rating),0) FROM engagement WHERE grad_id=$grad_id;")
avg_activeness=${activeness%.*} # Remove decimals

# Certifications count
certs=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT COUNT(*) FROM certifications WHERE grad_id=$grad_id;")

# Projects count
projects=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT COUNT(*) FROM projects WHERE grad_id=$grad_id;")

# Positive feedbacks
positive_feedbacks=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT COUNT(*) FROM performance_reviews WHERE grad_id=$grad_id AND sentiment_tag='positive';")

# Final Readiness Score = Sum of all
readiness_score=$(( avg_rating + avg_activeness + certs + projects + positive_feedbacks ))

# Verdict Logic
if [ "$readiness_score" -ge 8 ]; then
    verdict="✅ Highly Recommended"
elif [ "$readiness_score" -ge 5 ]; then
    verdict="🟡 Can be Trained"
else
    verdict="⚠️ Needs Improvement & Mentorship"
fi

# Output Report
echo "-----------------------------------------------"
echo "🎓 Graduate ID: $grad_id"
echo "📊 Avg Rating: $avg_rating"
echo "🧠 Avg Activeness: $avg_activeness"
echo "🏅 Certifications: $certs"
echo "💻 Projects: $projects"
echo "💬 Positive Feedbacks: $positive_feedbacks"
echo "🔥 Readiness Score: $readiness_score"
echo "📌 Verdict: $verdict"
echo "-----------------------------------------------"

# Save to DB
mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "INSERT INTO readiness_scores (grad_id, score, recommendation, generated_on) VALUES ($grad_id, $readiness_score, '${verdict//\'/\\\'}', CURDATE());"

echo "✅ Readiness score saved successfully for Graduate ID $grad_id!"
