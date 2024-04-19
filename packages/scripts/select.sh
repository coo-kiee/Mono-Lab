export select_result=""

print_options() {
    local arr=("${@:1:$#-1}")
    local selected_index=${@: -1}

    for i in "${!arr[@]}"; do
        if [ $i -eq $selected_index ]; then
            echo "=> ${arr[$i]}"
        else
            echo "  ${arr[$i]}"
        fi
    done
}

select_option() {
    local arr=("${@:1:$#-1}")
    local msg=${@: -1}
    local selected_index=0
    clear

    ## 제목 출력
    green $msg && print_text
    # 선택지 출력
    print_options "${arr[@]}" $selected_index

    # 방향키 입력으로 선택
    while true; do
        read -rsn1 key
        case $key in
            "A") # Up arrow
                ((selected_index--))
                ;;
            "B") # Down arrow
                ((selected_index++))
                ;;
            "") # Enter key
                select_result="${arr[$selected_index]}"
                break
                ;;
        esac

        # 선택지 범위 벗어나는지 확인
        if [ $selected_index -lt 0 ]; then
            selected_index=$((${#arr[@]} - 1))
        elif [ $selected_index -ge ${#arr[@]} ]; then
            selected_index=0
        fi

        # 화면 초기화 후 선택지 출력
        clear
        green $msg && print_text
        print_options "${arr[@]}" $selected_index
    done
}