#!/usr/bin/env bash

set -euo pipefail

BOLD=""
UNDERLINE=""
STANDOUT=""
NORMAL=""
BLACK=""
RED=""
GREEN=""
YELLOW=""
BLUE=""
MAGENTA=""
CYAN=""
WHITE=""

function setcolors {
  ncolors=$(tput colors)

  if test -n "$ncolors" && test $ncolors -ge 8; then
    BOLD="$(tput bold)"
    UNDERLINE="$(tput smul)"
    STANDOUT="$(tput smso)"
    NORMAL="$(tput sgr0)"
    BLACK="$(tput setaf 0)"
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    MAGENTA="$(tput setaf 5)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 7)"
  fi
}

if test -t 1; then setcolors; fi


function eecho {
  echo "$@" >&2
}

function substep {
  if (( $# >= 2 )); then
    level="$1"; shift
  else
    level="1"
  fi

  if (( level <= 0 )); then
    # Top-level step
    eecho "${BOLD}${GREEN}==>${NORMAL}${BOLD} $@${NORMAL}"
  else
    # Substep
    for i in $(seq 0 "$level"); do
      echo -n ' '
    done
    eecho "${BOLD}${BLUE}->${NORMAL}${BOLD} $@${NORMAL}"
  fi
}

function step {
  substep 0 "$@"
}

function warning {
  eecho "${BOLD}${YELLOW}==> WARNING:${NORMAL}${BOLD} $@${NORMAL}"
}

function error {
  eecho "${BOLD}${RED}==> ERROR:${NORMAL}${BOLD} $@${NORMAL}"
}


function subinfo {
  if (( $# >= 2 )); then
    level="$1"; shift
  else
    level="1"
  fi

  for i in $(seq -3 "$level"); do
    echo -n ' '
  done
  eecho "${NORMAL}$@${NORMAL}"
}

function info {
  subinfo 0 "$@"
}
