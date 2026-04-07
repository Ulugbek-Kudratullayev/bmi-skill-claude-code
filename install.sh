#!/bin/bash
# BMI Skill installer for Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/Ulugbek-Kudratullayev/bmi-skill-claude-code/main/install.sh | bash

set -e

REPO="https://raw.githubusercontent.com/Ulugbek-Kudratullayev/bmi-skill-claude-code/main"
DEST="$HOME/.claude/commands"

echo "=== BMI Skill o'rnatish ==="
echo ""

# Create commands directory
mkdir -p "$DEST"

# Download skill
echo "Yuklab olinmoqda..."
if command -v curl &>/dev/null; then
    curl -sL "$REPO/commands/bmi.md" -o "$DEST/bmi.md"
elif command -v wget &>/dev/null; then
    wget -q "$REPO/commands/bmi.md" -O "$DEST/bmi.md"
else
    echo "XATO: curl yoki wget topilmadi!"
    exit 1
fi

echo "BMI skill o'rnatildi: $DEST/bmi.md"
echo ""

# Check Python deps
echo "Python paketlarni tekshirish..."
missing=""
python3 -c "import docx" 2>/dev/null || missing="$missing python-docx"
python3 -c "import matplotlib" 2>/dev/null || missing="$missing matplotlib"
python3 -c "import numpy" 2>/dev/null || missing="$missing numpy"

if [ -n "$missing" ]; then
    echo "Kerakli paketlar topilmadi:$missing"
    echo "O'rnatish: pip install$missing"
else
    echo "Barcha paketlar mavjud!"
fi

echo ""
echo "Tayyor! Claude Code'da /bmi buyrug'ini ishlating."
