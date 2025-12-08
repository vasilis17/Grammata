#!/usr/bin/env bash
# Build or watch SASS into styles/style.css
# Requires `sass` (Dart Sass) to be installed and in PATH.

set -e

case "$1" in
  watch)
    echo "Watching sass/ -> styles/style.css (compressed for prod, or expanded during dev)..."
    sass --watch sass:styles --no-source-map --style=expanded
    ;;
  build)
    echo "Building all SASS files from sass/ to styles/ (compressed output for production)..."
    sass sass:styles --no-source-map --style=compressed
    ;;
  *)
    echo "Usage: $0 {build|watch}"
    echo "Examples:"
    echo "  $0 build   # compile once (compressed)"
    echo "  $0 watch   # watch for changes (expanded)"
    exit 1
    ;;
esac
