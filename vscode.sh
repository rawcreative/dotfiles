#!/bin/bash

vscode=(
    Rubymaniac.vscode-paste-and-indent
    aaron-bond.better-comments
    alefragnani.project-manager
    bmewburn.vscode-intelephense-client
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    dariofuzinato.vue-peek
    daylerees.rainglow
    dbaeumer.vscode-eslint
    dkundel.vscode-new-file
    eg2.vscode-npm-script
    esbenp.prettier-vscode
    felixfbecker.php-intellisense
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    formulahendry.code-runner
    GrapeCity.gc-excelviewer
    hollowtree.vue-snippets
    HookyQR.beautify
    jasonnutter.search-node-modules
    junstyle.php-cs-fixer
    kokororin.vscode-phpfmt
    krisanalfa.tinkerHere
    marlosirapuan.vscode-theme-railscasts-plus
    mechatroner.rainbow-csv
    MehediDracula.php-namespace-resolver
    mikestead.dotenv
    mohsen1.prettify-json
    mrmlnc.vscode-attrs-sorter
    mrmlnc.vscode-duplicate
    mrmlnc.vscode-scss
    ms-python.python
    ms-vscode.sublime-keybindings
    mubaidr.vuejs-extension-pack
    naumovs.color-highlight
    neilbrayfield.php-docblocker
    neilding.language-liquid
    nikitaKunevich.snippet-creator
    octref.vetur
    oysun.vuehelper
    pflannery.vscode-versionlens
    rafa-acioly.laravel-helpers
    robertoachar.vscode-essentials-snippets
    ryannaddy.laravel-artisan
    sdras.vue-vscode-snippets
    seanwash.vue
    sleistner.vscode-fileutils
    TaoKlerks.poor-mans-t-sql-formatter-vscode
    tombonnike.vscode-status-bar-format-toggle
    tungvn.wordpress-snippet
    vincaslt.highlight-matching-tag
    vscode-icons-team.vscode-icons
    william-voyek.vscode-nginx
    wwm.better-align
    xabikos.JavaScriptSnippets
    yzhang.markdown-all-in-one
    Zignd.html-css-class-completion
)


echo "Installing VSCode extensions"
for ext in ${vscode[@]}
do
    code --install-extension $ext
done