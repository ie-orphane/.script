# .script

## installation

```bash
cd
git clone https://github.com/ie-orphane/.script.git
```

## setup

```shell
#  -----  .script  -----
DOT_SOURCE=$HOME/.script
if [[ -d $DOT_SOURCE ]]; then
 [[ -f $DOT_SOURCE/.profile ]] && source $DOT_SOURCE/.profile || echo ".error: profile not found !"
 export PATH="$PATH:$DOT_SOURCE/commands"
 CURRENT_PROJECT=current_project
fi
```
