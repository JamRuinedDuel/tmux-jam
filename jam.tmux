#!/usr/bin/env bash

TMUX_JAM_PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_JAM_OPTIONS_FILE="$TMUX_JAM_PLUGIN_DIR/conf/options.conf"
TMUX_JAM_CONTENT_FILE="$TMUX_JAM_PLUGIN_DIR/conf/content.conf"

__cleanup() {
  unset -v TMUX_JAM_OPTIONS_FILE
  unset -v TMUX_JAM_CONTENT_FILE
  unset -v TMUX_JAM_PLUGIN_DIR
  unset -f __load __cleanup
}

__load() {
  tmux source-file "$TMUX_JAM_OPTIONS_FILE"
  tmux source-file "$TMUX_JAM_CONTENT_FILE"
}

__load
__cleanup
