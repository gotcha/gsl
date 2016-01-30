#!/bin/bash

BUILD_DIR=${GSL_BUILD_DIR-/gsl}
cd "$BUILD_DIR" || exit 1
gsl "$@"
