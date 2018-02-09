rm -rf _book
gitbook build
cd _book
git init
git add -A
git commit -m 'update book'
git push -f https://github.com/TALFE/wiki.git master:gh-pages

# git push -u origin master