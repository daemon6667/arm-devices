#!/bin/bash
#
# Here described used global variables and functions
#

ROOT_DIR=$(realpath $(dirname $0))/..
KERNEL_MAINLINE_URL=http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
IGOR_PATCHES_URL=https://github.com/igorpecovnik/lib.git
KERNEL_DIR=${ROOT_DIR}/sources/kernel-stable
KERNEL_MAINLINE_BRANCH=linux-4.5.y
IGOR_PATCHES_DIR=${ROOT_DIR}/sources/igor-patches
PATCHES_ROOT_DIR=${IGOR_PATCHES_DIR}/patch/kernel

BOARD_TYPE=sunxi-next



function log_error() { echo "[ ERR ]: $1"; }
function log_warn() { echo "[ WRN ]: $1"; }



function make_dir() {
    dir=$1
    if [ -n "$1" ]; then
        test ! -d "$dir" && mkdir -p "$dir"
    else
        log_error "Destination directory is not mentioned"
        exit 1
    fi
}



