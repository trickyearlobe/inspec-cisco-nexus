#!/usr/bin/env sh

# abort on errors
set -e

# build the docs
npm run build

# navigate into the build output directory
pushd src/.vuepress/dist

# Commit what's in dist
git init
git add -A
git commit -m 'deploy'

# Force push to github pages
git push -f git@github.com:trickyearlobe/inspec-cisco-nexus.git main:gh-pages

popd
