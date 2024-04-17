eval "$(cat ./packages/scripts/color.sh)"

green "add-workspace" && add_echo_text " Start!!"

echo "${echo_text}" && reset_echo_text

## File Name
echo "$0"

## Check Arguments
if [ $# != 2 ]
then
    red "Error:" && add_echo_text " Input" && yellow " group_name" && add_echo_text " And" && yellow " repository_name\n"
    blue "group_name:" && yellow " apps" && add_echo_text " OR" && yellow " packages"

    echo $echo_text && reset_echo_text
    exit 100
fi

if [ $1 != "apps" ] && [ $1 != "packages" ]
then
    red "Error:" && add_echo_text " Input Wrong" && yellow " group_name.\n"
    blue "Can Input:" && yellow " apps" && add_echo_text " OR" && yellow " packages"

    echo $echo_text && reset_echo_text
    exit 100
fi

## Declare Variant
root=$PWD
group_name=$1
repository_name=$2

path="./${group_name}/${repository_name}"
workspace_name="@${group_name}/${repository_name}"
escape_workspace_name="@${group_name}\/${repository_name}"

if [ -d $path ]
then
    red "Error:" && blue " workspace" && add_echo_text " is already exists." && yellow " ${workspace_name}.\n"

    echo $echo_text && reset_echo_text
    exit
fi

## Create Directory
mkdir -p $path

## Move to App
cd $path

## Init App
yarn init

yarn add -D @packages/tsconfig @packages/eslint-config-custom @typescript-eslint/eslint-plugin@^6.0.0 @typescript-eslint/parser@^6.0.0 eslint@^8.2.0 eslint-config-airbnb@^19.0.4 eslint-config-airbnb-base@^15.0.0 eslint-config-airbnb-typescript@^17.1.0 eslint-config-prettier@^9.1.0 eslint-import-resolver-typescript@^3.6.1 eslint-plugin-import@^2.25.3 eslint-plugin-jsx-a11y@^6.5.1 eslint-plugin-react@^7.28.0 eslint-plugin-react-hooks@^4.3.0

## Move to Root
cd $root

sed -i "s/$2/${escape_workspace_name}/" $path/package.json

sed -n "/${escape_workspace_name}/p" $path/package.json

yarn

green "add-workspace" && red " ${workspace_name}" && add_echo_text " End!!"

echo "${echo_text}" && reset_echo_text

echo ===== Workspace List =====

yarn workspaces list

echo ==========================