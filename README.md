# Ansible Health Check and Remediation Project

## Purpose
This project checks the health of Linux EC2 target nodes and applies safe remediation actions when issues are found.

## Environment
- Control node: Amazon Linux
- Target node 1: Amazon Linux
- Target node 2: Ubuntu

## Checks performed
- Disk usage
- Memory usage
- Load average
- SSH service status
- Required package installation

## Remediation actions
- Clean old files from /tmp
- Clean package cache
- Ensure SSH service is running and enabled
- Install required packages
- Generate health reports on the control node

## Commands

Test inventory:

ansible-inventory --graph

Test connectivity:

ansible all -m ping

Run health check only:

ansible-playbook playbooks/site.yml --tags health

Run full health check and remediation:

ansible-playbook playbooks/site.yml

View reports:

ls -l reports
cat reports/amazon-target-health-report.txt
cat reports/ubuntu-target-health-report.txt
