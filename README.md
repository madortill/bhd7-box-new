# Boilerplate
This template should help get you started developing with Vue 2 in Vite.
It is a boilerplate create by the command "npm init@vue2".

* note: # are for style and have no meaning.

1. # Project Setup - before the first run
npm install

2. # run for development purposes
npm run dev

# upload to github - run all the commands in the terminal (` + ctrl)
1.  change vue.config.js - replace REPO_NAME with the name of the repository in github
2. npm run build
3. git add dist
4. git commit -m 'adding dist subtree'
## make sure you are in the master branch and that the dist folder is not in .gitignore
## -m means message (documentation: https://git-scm.com/docs/git-commit)
5. git subtree push --prefix dist origin gh-pages

6. **IN GITHUB** set gitHub Pages to the branch "gh-pages" instead of "master" when creating a link.










## not relevant

Recommended IDE Setup:
[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

Customize configuration:
See [Vite Configuration Reference](https://vitejs.dev/config/).