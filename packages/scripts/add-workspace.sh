#!/bin/bash
. "./packages/scripts/color.sh"
. "./packages/scripts/select.sh"

## Check Arguments
if [ $# -eq 0 ]; then
    red "Error:" && add_text " Input" && yellow " repository_name"
    print_text
    exit 100
elif [ $# -gt 1 ]; then
    red "Error:" && add_text " Input" && yellow " 1 Argument"
    print_text
    exit 100
fi


green "add-workspace" && add_text " Start!!"

echo "${echo_text}" && reset_text

## File Name
echo "$0"

## Select Workspace Group
workspace_group_options=("apps" "packages")
select_option "${workspace_group_options[@]}" "Select_Workspace_Group"

# ## Declare Variant
root=$PWD
repository_name=$1
group_name=$select_result
path="./${group_name}/${repository_name}"
workspace_name="@${group_name}/${repository_name}"
escape_workspace_name="@${group_name}\/${repository_name}"

if [ -d $path ]
then
    red "Error:" && blue " workspace" && add_text " is already exists." && yellow " ${workspace_name}.\n"

    print_text
    exit
fi

## Create Directory
mkdir -p $path

## Move to App
cd $path

delete_directory() {
    red "An error occurred in the script" && print_text
    add_text "Delete Directory: " && yellow "$path"
    print_text

    cd $root
    rm -rf "$path"
    exit
}

trap delete_directory ERR

## Select use Boilerplate
use_boilerplate_options=("Yes" "No")
select_option "${use_boilerplate_options[@]}" "Select_Use_Boilerplate"
use_boilerplate=$select_result

if [ $use_boilerplate == "Yes" ]; then
    green "보일러 플레이트 CLI를 입력하세요: " && print_text
    blue "ex) " && yellow "yarn create next-app . --typescript" && print_text
    read cli

    ## Excute Boilerplate CLI
    $cli
else yarn init
fi

## Delete ESLint Config File
find . -type f -regex ".*eslint.*" -exec rm -f {} +

## Add ESLint Deps & Config File
. "../../packages/scripts/eslint.sh"

## Move to Root
cd $root

## Mod Workspace Name
sed -i "s/$repository_name/${escape_workspace_name}/" $path/package.json

sed -n "/${escape_workspace_name}/p" $path/package.json

green "add-workspace" && red " ${workspace_name}" && add_text " End!!"
print_text

echo ===== Workspace List =====

yarn workspaces list

echo ==========================