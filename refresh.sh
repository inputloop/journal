#!/bin/sh
# refresh.sh -- copy the source folder over this repository's tree (then review with git status, and commit).
# usage: sh refresh.sh [SRC]     (default SRC: /f/claude/pub)
# Copyright 2026 Corwin Brust <corwin@bru.st> and Contributors.  Authored by Mentat (for Corwin).
# SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
set -eu
here=$(cd "$(dirname "$0")" && pwd); src=${1:-/f/claude/pub}
[ -d "$src" ] || { echo "refresh: no folder $src" >&2; exit 2; }
(cd "$src" && tar cf - --exclude=./.git .) | tar xf - -C "$here"
echo "refresh: copied $src; now: git -C \"$here\" status --short"
