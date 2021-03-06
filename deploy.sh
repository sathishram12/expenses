#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Add a commit message"
    return 1
fi

git add .
git commit -m "$1"
git push origin master

# expenses.chodounsky.net
npm run build
cp -a build/. production/
cd production
git add .
git commit -m "$1"
git push origin production
cd ..

# github pages

npm run build
cp -a build/. demo/
cd demo
git add .
git commit -m "$1"
git push origin gh-pages
cd ..