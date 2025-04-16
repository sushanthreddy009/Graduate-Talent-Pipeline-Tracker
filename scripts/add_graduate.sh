#!/bin/bash

read -p "👤 Enter Graduate Name: " name
read -p "📧 Enter Email: " email
read -p "🧠 Enter Domain: " domain
read -p "👥 Enter Cohort: " cohort
read -p "🏫 Enter College: " college
read -p "🚻 Enter Gender (M/F): " gender
read -p "📅 Enter Join Date (YYYY-MM-DD): " join_date

mysql -u root -p -D mthree_tracker -e "INSERT INTO graduates (name, email, domain, cohort, college, gender, join_date) VALUES ('$name', '$email', '$domain', '$cohort', '$college', '$gender', '$join_date');"

echo "✅ Graduate '$name' added successfully!"
