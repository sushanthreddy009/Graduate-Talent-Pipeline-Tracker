#!/bin/bash

# ================== CONFIG =====================
TOTAL_SCORE=0
MAX_SCORE=13  # Total correct questions
LOG_FILE="logs/test_results.log"
mkdir -p logs
declare -A ANSWERS
# ===============================================

bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)

echo -e "${bold}${cyan}\n=== LINUX & MYSQL CLI ASSESSMENT ===${normal}"
read -p "Candidate Name: " candidate
echo -e "${yellow}Answer the following questions. Type carefully.${normal}\n"

# =============== LINUX QUESTIONS ===============
ask_linux() {
    echo -e "\n${bold}${blue}LINUX Q$1:${normal} $2"
    read -p "Your answer: " ans
    ANSWERS["linux_$1"]=$ans
    [[ "$ans" == "$3" ]] && ((TOTAL_SCORE++))
}

ask_linux 1 "List all files including hidden ones in current directory." "ls -a"
ask_linux 2 "Show current working directory." "pwd"
ask_linux 3 "Check disk usage in human-readable format." "df -h"
ask_linux 4 "Search for 'error' in a file.txt (case-insensitive)." "grep -i error file.txt"
ask_linux 5 "Display the last 10 lines of /var/log/syslog." "tail /var/log/syslog"
ask_linux 6 "List all running processes." "ps aux"
ask_linux 7 "Show active network interfaces." "ip a"

# ================ MYSQL QUESTIONS ==============
ask_mysql() {
    echo -e "\n${bold}${blue}MYSQL Q$1:${normal} $2"
    echo -e "$3"
    read -p "Your answer (a/b/c/d): " ans
    ANSWERS["mysql_$1"]=$ans
    [[ "$ans" == "$4" ]] && ((TOTAL_SCORE++))
}

ask_mysql 1 "Which command shows all available databases?" \
"a) SHOW TABLES\nb) SHOW DATABASES\nc) SELECT * FROM DATABASES\nd) DESCRIBE DATABASES" "b"

ask_mysql 2 "Which clause is used to sort results?" \
"a) ORDER BY\nb) SORT\nc) GROUP BY\nd) WHERE" "a"

ask_mysql 3 "Which SQL statement is used to remove a table?" \
"a) DELETE TABLE\nb) REMOVE TABLE\nc) DROP TABLE\nd) TRUNCATE TABLE" "c"

ask_mysql 4 "What does 'SELECT COUNT(*) FROM users;' return?" \
"a) Number of users\nb) All users\nc) Names of users\nd) First user only" "a"

# ============= SCENARIO-BASED QUESTIONS =============
ask_scenario() {
    echo -e "\n${bold}${blue}SCENARIO Q$1:${normal} $2"
    read -p "Your answer: " ans
    ANSWERS["scenario_$1"]=$ans
    [[ "$ans" == "$3" ]] && ((TOTAL_SCORE++))
}

ask_scenario 1 "You want to schedule a job to run every day at 2am. Which file do you edit?" "/etc/crontab"
ask_scenario 2 "You get 'Permission denied' when running a script. How do you fix it?" "chmod +x script.sh"

# ============== SUBMISSION CONFIRMATION ==============
echo -e "\n${bold}${yellow}Are you sure you want to submit the test? (yes/no)${normal}"
read -p "Submit? " confirm

if [[ "$confirm" != "yes" ]]; then
    echo -e "${red}Test not submitted. Restart the script when ready.${normal}"
    exit 1
fi

# ================= RESULTS ===================
echo -e "\n${bold}${cyan}=== TEST RESULTS ===${normal}"
echo "Candidate: $candidate"
echo "Score: $TOTAL_SCORE / $MAX_SCORE"
PERCENTAGE=$(( TOTAL_SCORE * 100 / MAX_SCORE ))
echo "Percentage: $PERCENTAGE%"

if [ $PERCENTAGE -ge 85 ]; then
    echo -e "Grade: ${green}EXCELLENT${normal}"
elif [ $PERCENTAGE -ge 60 ]; then
    echo -e "Grade: ${yellow}GOOD${normal}"
else
    echo -e "Grade: ${red}NEEDS IMPROVEMENT${normal}"
fi

# ================= RESULTS ===================
echo -e "\n${bold}${cyan}=== TEST RESULTS ===${normal}"
echo "Candidate: $candidate"
echo "Score: $TOTAL_SCORE / $MAX_SCORE"
PERCENTAGE=$(( TOTAL_SCORE * 100 / MAX_SCORE ))
echo "Percentage: $PERCENTAGE%"

if [ $PERCENTAGE -ge 85 ]; then
    echo -e "Grade: ${green}EXCELLENT${normal}"
elif [ $PERCENTAGE -ge 60 ]; then
    echo -e "Grade: ${yellow}GOOD${normal}"
else
    echo -e "Grade: ${red}NEEDS IMPROVEMENT${normal}"
fi

# ============== CORRECT ANSWERS ===============
echo -e "\n${bold}${blue}=== CORRECT ANSWERS REVIEW ===${normal}"
echo -e "${green}LINUX:${normal}"
echo "1) ls -a"
echo "2) pwd"
echo "3) df -h"
echo "4) grep -i error file.txt"
echo "5) tail /var/log/syslog"
echo "6) ps aux"
echo "7) ip a"

echo -e "${green}\nMYSQL:${normal}"
echo "1) b"
echo "2) a"
echo "3) c"
echo "4) a"

echo -e "${green}\nSCENARIO:${normal}"
echo "1) /etc/crontab"
echo "2) chmod +x script.sh"

# ================ LOGGING ====================
{
    echo "Date: $(date)"
    echo "Candidate: $candidate"
    echo "Score: $TOTAL_SCORE/$MAX_SCORE"
    echo "Percentage: $PERCENTAGE%"
    echo "Answers:"
    for k in "${!ANSWERS[@]}"; do echo "$k: ${ANSWERS[$k]}"; done
    echo "---"
} >> "$LOG_FILE"

echo -e "\n${bold}${cyan}Thank you! Your test has been submitted.${normal}"
