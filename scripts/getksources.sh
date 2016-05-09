#!/bin/bash

#
# The script downloads kernel sources 
#

if [ -f ./commons.sh ]; then
    source commons.sh
else
    echo "Go in right directory before continue"
    exit 1
fi


make_dir "${KERNEL_DIR}"
# Downloading kernel sources
git clone --depth 1 --single-branch -b "${KERNEL_MAINLINE_BRANCH}" "${KERNEL_MAINLINE_URL}" "${KERNEL_DIR}"

make_dir "${IGOR_PATCHES_DIR}"
# Downloading patches
git clone --depth 1 "${IGOR_PATCHES_URL}" "${IGOR_PATCHES_DIR}"


