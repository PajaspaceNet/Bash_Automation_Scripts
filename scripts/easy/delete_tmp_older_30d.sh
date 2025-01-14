#!/bin/bash
find /path/to/directory -type f -name "*.tmp" -mtime +30 -exec rm -f {} \;
