#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" = "master" ] && [ "$TRAVIS_PULL_REQUEST" = false ] && exit 0

git config --global user.email "ellisvalentiner@gmail.com"
git config --global user.name "Ellis Valentiner"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m "Update the cook book" || true
git push origin gh-pages
