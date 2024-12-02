SCRIPT_ROOT=$HOME/.script

source $SCRIPT_ROOT/utils/colorful

alias lahya="echo \"9aleb 3liha :)\""
alias script="code $SCRIPT_ROOT || vim $SCRIPT_ROOT || echo \"[ERROR] opening .script failed !\""


# ------- norminette -------
alias hnorm="norminette -R CheckDefine --use-gitignore *.h"

function norm {
	norminette -R CheckForbiddenSourceHeader --use-gitignore ${1:-*.c}
}

function fnorm {
	if [[ "$1" ]]; then
		python3 -m c_formatter_42 $1
		return
	fi

	for file in *.c; do
		if ! [[ $(git check-ignore $file) ]]; then
			python3 -m c_formatter_42 $file
		fi
	done
}


# ------- git -------
alias status="git status --short --branch"
alias revert="git reset --soft HEAD~1"

function push {
	for remote in $(git remote); do
		echo "\n$remote : $(git remote get-url $remote)"
		git push $remote
	done
	echo
}

function log {
	if [[ "$1" =~ ^[0-9]+$ ]]; then
        git log --oneline --graph -n$1
	elif [[ "$1" == "-a" || "$1" == "--all" ]]; then
        git log --oneline --graph
	else
        git log --oneline --graph -n7
	fi
}

function stage {
    if [[ $# -ne 1 ]]; then
        echo "[Error] Missing commit message !"
        return 1
    fi

    git add . && git commit -m $1
}


# -------  coding ------- 
function run {
    cc -Wall -Wextra -Werror $@ -o main && ./main
    rm -f ./main
}


# ------- terminal session -------
os="Unknown"
USB_NAME="KINGSTON"

case "$OSTYPE" in
	"linux-gnu"*)
		os="Linux"
		USB_PATH=/media/$(whoami)
        alias code="flatpak run com.visualstudio.code"
		;;
	"darwin"*)
		os="macOS"
		USB_PATH=/Volumes
        alias code="open $@ -a /Applications/Visual\ Studio\ Code.app"
		;;
	"cygwin"|"msys")
		os="Windows"
		;;
esac

if [[ $USB_PATH ]]; then
	USB_PATH+=/$USB_NAME
fi

function go {
    if [[ $# -eq 0 ]]; then
        cd ~
        return 0
    fi

    case "$1" in
    -)
        cd -
        ;;
    -u | --usb)
        cd $USB_PATH
        ;;
    -s | --script)
        cd $SCRIPT_ROOT
        ;;
    -P | --pool)
        cd $USB_PATH/1337/Pool
        ;;
    -C | --cursus)
        cd $USB_PATH/1337/Cursus
        ;;
    -p | -project)
        if [[ $# -lt 2 ]]; then
            echo "$(Red '[ERROR]') $(White 'directory') is missing !"
            return 1
        fi
        cd $USB_PATH/1337/Cursus/$2
        ;;
    -c | --current-project)
        if [[ -z $CURRENT_PROJECT ]]; then
            echo "$(Red '[ERROR]') current project not found !"
            return 1
        fi
        cd $USB_PATH/1337/Cursus/$CURRENT_PROJECT
        ;;
    -h | --help)
        echo "$(White 'NAME'):\n\tgo - Navigate through directories\n"
        echo "$(White 'USAGE'):\n\tgo [OPTION] [DIRECTORY*]\n"
        echo "$(White 'OPTIONS'):"
        echo "\t-u, --usb\t\tto usb.\t\t\t($(Black $USB_PATH))"
        echo "\t-s, --script\t\tto .script.\t\t($(Black $SCRIPT_ROOT))"
        echo "\t-P, --pool\t\tto pool.\t\t($(Black $USB_PATH/1337/Pool))"
        echo "\t-C, --cursus\t\tto cursus.\t\t($(Black $USB_PATH/1337/Cursus))"
        echo "\t-p, --project <name>\tto a working project.\t($(Black $USB_PATH/1337/Cursus/\${name}))"
        echo "\t-c, --current-project\tto the current project.\t($(Black $USB_PATH/1337/Cursus/$CURRENT_PROJECT))"
        echo "\t-h, --help\t\tdisplay this message !"
        ;;
    *)
        echo "$(Red '[ERROR]') invalid option $(White '$1') !"
        return 1
        ;;
    esac
}


# ------- shell profile -------
PROFILE=$SCRIPT_ROOT/.profile
SOURCE=~/.$(basename "$SHELL")rc

alias profile="code $PROFILE || vim $PROFILE || echo \"[ERROR] opening profile failed !\""

function update {
    to_update=($SOURCE $PROFILE)

    case "$1" in
        source|s)
            to_update=($SOURCE)
        ;;
        profile|p)
            to_update=($PROFILE)
        ;;
    esac

    for item in $to_update; do
        source $item > /dev/null 2>&1 && \
        echo "$(Green 'dot-update:') $(basename "$item") updated." || \
        echo "$(Red 'dot-update:') updating $(basename "$item") failed !"
    done
}


# ------- colorful -------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# ------- session -------
echo "Operating System: $OS ($OSTYPE)\n"
