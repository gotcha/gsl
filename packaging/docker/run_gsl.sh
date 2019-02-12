#!/bin/bash

# $GSL_BUILD_DIR points to directory holding sources
BUILD_DIR=${GSL_BUILD_DIR-/gsl}
cd "$BUILD_DIR" || exit 1
gsl "$@"
