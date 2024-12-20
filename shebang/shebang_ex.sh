#!/usr/bin/env bash
set -ex

# Please note that we will see this line printed again since we are using -x flag
echo "Start of script"

# Also we can see what is stored in the variable
variable="something"
variable=$variable" else"

# But here we don't see the variable name but the value stored in it
echo "Var: $variable"
