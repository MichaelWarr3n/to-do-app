npm run build

cd dist

git init
git add -A
git commit -m "New Deployment"

git push -f https://github.com/michaelwarr3n/to-do-app.git master:gh-pages

cd ..