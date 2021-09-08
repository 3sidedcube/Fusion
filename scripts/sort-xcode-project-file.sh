#!/bin/bash
#
# Description:
# Sorts the project.pbxproj file alphabetically.
#
# Usage:
# ./sort-xcode-project-file.sh 
#

# Get directory of script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Name of script to sort files
SORT_SCRIPT_NAME="reorder-xcode-project-file-alphabetically"

# Name of the product
XCODE_PROJECT_FILE_NAME="Fusion.xcodeproj"

# Path to project file
PROJECT_FILE_PATH="${SCRIPT_DIR}/../${XCODE_PROJECT_FILE_NAME}/project.pbxproj"

# Run the script
"${SCRIPT_DIR}/${SORT_SCRIPT_NAME}" "${PROJECT_FILE_PATH}"

