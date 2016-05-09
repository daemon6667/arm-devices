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

function apply_patch() {
    patch_path=$1
    pushd "${KERNEL_DIR}" &>/dev/null
    patch -p1 --dry-run < "${patch_path}"
    if [ $? -ne 0 ]; then
        log_warn "Patch $patch_path has not beed accepted"
    else
        patch -p1 < "${patch_path}"
    fi
    popd &>/dev/null
}

function patching_kernel_sources() {
    list_patches=$(ls ${PATCHES_ROOT_DIR}/${BOARD_TYPE}/*.patch)
    for pth in $list_patches; do
        apply_patch $pth
    done
}

patching_kernel_sources

