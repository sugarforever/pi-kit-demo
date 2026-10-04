---
name: commit-msg
description: 根据已暂存的改动写一条 Conventional Commits 格式的提交信息。在用户要求写提交信息、准备 git commit 时使用。
---

# 提交信息

1. 运行 `git diff --cached` 读取已暂存的改动。没有暂存内容就提示用户先 `git add`。
2. 按 Conventional Commits 写一条提交信息：
   - 第一行 `<type>: <摘要>`，type 取 feat / fix / refactor / docs / test / chore，摘要用中文，不超过 50 字。
   - 空一行后用 1-3 个要点说明改了什么、为什么改。
3. 只输出提交信息本身，不要执行 `git commit`。
