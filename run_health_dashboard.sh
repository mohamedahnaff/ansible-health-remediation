#!/bin/bash
set -e

PROJECT_DIR="$HOME/ansible-health-remediation"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

cd "$PROJECT_DIR"

echo "Starting Ansible health check..."
ansible-playbook playbooks/site.yml --tags health

echo "Generating HTML dashboard..."
ansible-playbook playbooks/generate_html_dashboard.yml

echo "Backing up reports..."
mkdir -p reports/history

cp reports/health-summary.csv "reports/history/health-summary-$TIMESTAMP.csv"
cp reports/health-dashboard.html "reports/history/health-dashboard-$TIMESTAMP.html"

echo "Done."
echo "Latest CSV: reports/health-summary.csv"
echo "Latest HTML: reports/health-dashboard.html"
echo "History saved under: reports/history/"
