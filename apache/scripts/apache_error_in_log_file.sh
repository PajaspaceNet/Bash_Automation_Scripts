#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"
ERROR_FILE="/var/log/apache2/error.log"

echo "Last 10 access log entries:"
tail -n 10 "$LOG_FILE"

echo "Last 10 error log entries:"
tail -n 10 "$ERROR_FILE"
