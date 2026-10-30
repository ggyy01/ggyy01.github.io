#!/usr/bin/env bash
# 构建并发布到 GitHub Pages（ggyy01/ggyy01.github.io）。
# 用法：GITHUB_TOKEN=<令牌> ./deploy.sh
# 令牌：GitHub Fine-grained token，仅授权 ggyy01.github.io 仓库，Contents 读写权限。
set -e
cd "$(dirname "$0")"
: "${GITHUB_TOKEN:?请先设置 GITHUB_TOKEN}"
REPO=https://github.com/ggyy01/ggyy01.github.io.git
AUTH="Authorization: Basic $(printf 'x-access-token:%s' "$GITHUB_TOKEN" | base64 | tr -d '\n')"
./serve.sh build
TMP=$(mktemp -d)
cp -r _site/. "$TMP"/ && touch "$TMP/.nojekyll"
( cd "$TMP" && git init -q -b main && git config user.name ggyy01 && git config user.email ggyy01@users.noreply.github.com \
  && git add -A && git commit -qm "Deploy $(date +%F)" \
  && git -c http.extraheader="$AUTH" push -q -f "$REPO" main:main )
SRC=$(mktemp -d)
git ls-files -z | xargs -0 cp --parents -t "$SRC"
( cd "$SRC" && git init -q -b source && git config user.name ggyy01 && git config user.email ggyy01@users.noreply.github.com \
  && git add -A && git commit -qm "Source $(date +%F)" \
  && git -c http.extraheader="$AUTH" push -q -f "$REPO" source:source )
echo "已发布，约 1 分钟后生效：https://ggyy01.github.io"
