export echo_text=""
red() {
    red="\033[31m"$1"\033[0m"
    echo_text="$echo_text$red"
}

green() {
    green="\033[32m"$1"\033[0m"
    echo_text="$echo_text$green"
}

yellow() {
    yellow="\033[33m"$1"\033[0m"
    echo_text="$echo_text$yellow"
}

blue() {
    blue="\033[34m"$1"\033[0m"
    echo_text="$echo_text$blue"
}

purple() {
    purple="\033[35m"$1"\033[0m"
    echo_text="$echo_text$purple"
}

sky() {
    sky="\033[36m"$1"\033[0m"
    echo_text="$echo_text$sky"
}

add_text() {
    echo_text="$echo_text$1"
}

reset_text() {
    echo_text=""
}

print_text() {
    printf "$echo_text\n"
    reset_text
}