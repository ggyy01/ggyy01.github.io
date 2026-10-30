#!/usr/bin/env bash
# 本地构建并预览（盒子上的 Ruby 装在 /opt/mamba/envs/jekyll）
set -e
cd "$(dirname "$0")"
export PATH=/opt/mamba/envs/jekyll/bin:$PATH
bundle config set --local path vendor/bundle >/dev/null
bundle install --quiet
if [ "$1" = "build" ]; then
  bundle exec jekyll build
else
  bundle exec jekyll serve --host 127.0.0.1 --port 4000 --livereload
fi
