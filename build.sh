#!/usr/bin/env bash
# Builds dist/gauntlet.md — a single-file version for people who want to try it
# without installing a plugin. Inlines agent prompts and fragments, since
# ${CLAUDE_PLUGIN_ROOT} does not resolve outside plugin context.
set -euo pipefail
cd "$(dirname "$0")/plugins/gauntlet"
OUT=../../dist/gauntlet.md
mkdir -p ../../dist

{
  sed -e 's|^Agent prompts live at .*$|Agent prompts are inlined at the bottom of this file under "## AGENT PROMPTS".|' \
      -e 's|`\${CLAUDE_PLUGIN_ROOT}/agents/`|the AGENT PROMPTS section below|' \
      -e 's|`\${CLAUDE_PLUGIN_ROOT}/agents/<x>\.md`|the matching section under AGENT PROMPTS|' \
      -e 's|`\${CLAUDE_PLUGIN_ROOT}/fragments/round-n-context\.md`|the Round N context fragment below|' \
      -e 's|`\${CLAUDE_PLUGIN_ROOT}/docs/DESIGN\.md`|the project README and docs/DESIGN.md|' \
      commands/design.md

  echo; echo "---"; echo
  echo "# AGENT PROMPTS"
  echo
  echo "Inlined for single-file distribution. Fill every \`[PASTE: ...]\` slot before dispatch."
  echo

  for f in agents/architect.md agents/skeptic.md agents/codebase-expert.md \
           agents/pragmatist.md agents/domain-expert.md; do
    echo; echo "---"; echo
    sed 's|^# |## |' "$f"
  done

  echo; echo "---"; echo
  echo "# FRAGMENTS"
  for f in fragments/*.md; do
    echo; echo "## $(basename "$f" .md)"; echo
    cat "$f"
  done
} > "$OUT"

echo "built $OUT ($(wc -l < "$OUT" | tr -d ' ') lines)"
