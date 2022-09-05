# Boilerplate
This template should help get you started developing with Vue 2 in Vite.  
It is a boilerplate create by the command "npm init@vue2".

* note: # are for style and have no meaning.

### Project Setup - before the first run
npm install

### run for development purposes
npm run dev

# upload to github - run all the commands in the terminal (` + ctrl)
1. create new repository in github with all the files (node_modules can be ignored)
2. change vite.config.js - replace <REPO_NAME> with the name of the repository in github
3. ***in the terminal***  npm run build
4. ***in the terminal***  git add dist -f
5. ***in the terminal***  git commit -m 'adding dist subtree'
##### make sure you are in the master branch and that the dist folder is not in .gitignore
*** -m means message (documentation: https://git-scm.com/docs/git-commit) ***
6. ***in the terminal***  git subtree push --prefix dist origin gh-pages

7. **IN GITHUB** set gitHub Pages to the branch "gh-pages" instead of "master" when creating a link.










## Not Relevant

Recommended IDE Setup:
[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

Customize configuration:
See [Vite Configuration Reference](https://vitejs.dev/config/).
