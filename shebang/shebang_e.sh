#!/usr/bin/env bash
set -e

echo "Start of script"
ls -1a

echo ""
echo "ls command executed successfully, so we see this line"

ls bad
echo "This line will not be printed since the ls command failed and -e flag is set"
