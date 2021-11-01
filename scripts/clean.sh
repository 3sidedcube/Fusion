#!/bin/bash

# Directory of the script
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Carthage directory
CARTHAGE_DIR="Carthage"

# Delete the carthage directory
rm -rf "${SCRIPT_DIR}/../${CARTHAGE_DIR}"
