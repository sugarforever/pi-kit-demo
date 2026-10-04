#!/usr/bin/env bash
# 在目标目录里重建视频里的演示状态：
#   tip-calc  一个提交 + 一处已暂存的改动（按人数平摊）
#   my-pi-kit 自己的 Pi Package（/review 提示词模板 + commit-msg Skill）
# 用法：bash scripts/setup-demo.sh [目标目录，默认 ~/pi-demo]
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${1:-$HOME/pi-demo}"

mkdir -p "$DEST"
rm -rf "$DEST/tip-calc" "$DEST/my-pi-kit"
cp -R "$SRC/my-pi-kit" "$DEST/my-pi-kit"

mkdir -p "$DEST/tip-calc"
cp "$SRC/tip-calc/package.json" "$SRC/tip-calc/tip.js" "$DEST/tip-calc/"
cd "$DEST/tip-calc"
git init -q
git add .
git -c user.name=demo -c user.email=demo@example.com commit -qm "init tip calculator"
cp "$SRC/tip-calc/tip.staged.js" tip.js
git add tip.js

echo "演示目录已就绪：$DEST"
echo "  cd $DEST/tip-calc && git diff --cached"
