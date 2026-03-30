#!/usr/bin/env bash

set -euo pipefail

OS_NAME="$(sw_vers -productName 2>/dev/null || echo "UnknownOS")"
OS_VERSION="$(sw_vers -productVersion 2>/dev/null || echo "UnknownVersion")"
OS_BUILD="$(sw_vers -buildVersion 2>/dev/null || echo "UnknownBuild")"

SHELL_PATH="${SHELL:-unknown}"
TERMINAL_NAME="${TERM_PROGRAM:-${TERM:-unknown}}"

DOCKER_VERSION="$(docker version --format '{{.Client.Version}}' 2>/dev/null || true)"
DOCKER_VERSION="${DOCKER_VERSION%%$'\n'*}"
if [[ -z "${DOCKER_VERSION}" ]]; then
  DOCKER_VERSION="N/A"
fi
GIT_VERSION_RAW="$(git --version 2>/dev/null || echo 'git version N/A')"
GIT_VERSION="${GIT_VERSION_RAW#git version }"

cat <<EOF
@workstaion/README.md:19-23
- OS: \`${OS_NAME} ${OS_VERSION} (${OS_BUILD})\`
- Shell: \`${SHELL_PATH}\`
- Terminal: \`${TERMINAL_NAME}\`
- Docker Version: \`${DOCKER_VERSION}\`
- Git Version: \`${GIT_VERSION}\`
EOF
