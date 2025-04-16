#!/bin/bash

echo "📋 List of Registered Graduates:"
echo "---------------------------------------------"
mysql -u root -p -D mthree_tracker -e "SELECT id AS 'ID', name AS 'Name', email AS 'Email', domain AS 'Domain', cohort AS 'Cohort', college AS 'College', gender AS 'Gender', join_date AS 'Join Date' FROM graduates;"
