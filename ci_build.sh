#!/usr/bin/env bash

#
# This script is used by travis ci to test updates for zproject itself:
# it builds a latest GSL, then zproject, and tests it by regenerating
# a stable consumer project (CZMQ) which is expected to pass well.
# Optionally speeds up the compilation steps using ccache (stashed).
#

set -e

# Set this to enable verbose profiling
[ -n "${CI_TIME-}" ] || CI_TIME=""
case "$CI_TIME" in
    [Yy][Ee][Ss]|[Oo][Nn]|[Tt][Rr][Uu][Ee])
        CI_TIME="time -p " ;;
    [Nn][Oo]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee])
        CI_TIME="" ;;
esac

# Set this to enable verbose tracing
[ -n "${CI_TRACE-}" ] || CI_TRACE="no"
case "$CI_TRACE" in
    [Nn][Oo]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee])
        set +x ;;
    [Yy][Ee][Ss]|[Oo][Nn]|[Tt][Rr][Uu][Ee])
        set -x ;;
esac

case "$BUILD_TYPE" in
"default")
    mkdir tmp
    BUILD_PREFIX="$PWD/tmp"

    CCACHE_PATH="$PATH"
    CCACHE_DIR="${HOME}/.ccache"
    export CCACHE_PATH CCACHE_DIR
    # ccache -s 2>/dev/null || true

    [ -z "$CI_TIME" ] || echo "`date`: Starting build of gsl..."
        ( EXTRA_MAKE_OPTS=""
          cd ./src && \
          CCACHE_BASEDIR=${PWD} && \
          export CCACHE_BASEDIR && \
          $CI_TIME make $EXTRA_MAKE_OPTS -j4 test && \
          DESTDIR="${BUILD_PREFIX}" $CI_TIME make $EXTRA_MAKE_OPTS install \
        ) || exit 1

    [ -z "$CI_TIME" ] || echo "`date`: Builds completed without fatal errors!"

    echo "=== What is the GSL binary linked against (note libpcre in particular)?"
    if [ $TRAVIS_OS_NAME == "linux" ]; then
        ldd src/gsl || true
    elif [ $TRAVIS_OS_NAME == "osx" ]; then
        otool -L src/gsl || true
    else
        echo "Unsupported platform $TRAVIS_OS_NAME"
    fi

    echo "=== Self-test GSL parser"
    (cd src && $CI_TIME make check) || exit $?

    echo "=== How well did ccache help on this platform?"
    ccache -s 2>/dev/null || true
    echo "==="
    ;;
*)
    pushd "./builds/${BUILD_TYPE}" && \
    REPO_DIR="$(dirs -l +1)" $CI_TIME ./ci_build.sh \
    || exit 1
    ;;
esac

echo "=== Are GitIgnores good after making zproject '$BUILD_TYPE'? (should have no output below)"
git status -s || true
echo "==="
