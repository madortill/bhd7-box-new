# $ErrorActionPreference = "Stop"
set -e
git init
git checkout master
git add -A
git commit -m 'deploy'
git push
npm i
npm run build
git add dist -f
# -m specifies the commit message
git commit -m 'adding dist subtree' 
#The prefix option specifies the folder that we want for our the subtree. 
git subtree push --prefix dist origin gh-pages
git push