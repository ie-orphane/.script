ROOT=~/.script

alias lahya="echo \"9aleb 3liha :)\""


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
CURRENT_PROJECT=ft_printf

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
    -u | --usb)
        cd $USB_PATH
        ;;
    -p | --pool)
        cd $USB_PATH/1337/Pool
        ;;
    -c | --cursus)
        cd $USB_PATH/1337/Cursus
        ;;
    -cp | --current-project)
        cd $USB_PATH/1337/Cursus/$CURRENT_PROJECT
        ;;
    *)
        echo "[Error] invalid option $1"
        ;;
    esac
}


# ------- shell profile -------
PROFILE=$ROOT/.profile

alias profile="code $PROFILE || vim $PROFILE || echo \"[ERROR] opening profile failed !\""
alias update="source $PROFILE && echo \"[Success] profile updated.\" || echo \"[Error] updating profile failed !\""


echo "Operating System: $OS ($OSTYPE)\n"
