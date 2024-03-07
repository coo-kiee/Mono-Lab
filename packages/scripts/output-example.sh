eval "$(cat ./packages/scripts/color.sh)"

yellow "app: " && add_echo_text "yarn app tsconfig echo\n"
yellow "package: " && add_echo_text "yarn package tsconfig echo\n"
yellow "all: " && add_echo_text "yarn all echo\n"
yellow "all-app: " && add_echo_text "yarn all-app echo\n"
yellow "all-package: " && add_echo_text "yarn all-package echo\n"
yellow "initial: " && add_echo_text "yarn initial @packages/test\n"
yellow "add-workspace: " && add_echo_text "yarn add-workspace packages test\n"
yellow "mod-workspace-name: " && add_echo_text "yarn mod-workspace-name packages test\n"

echo $echo_text && reset_echo_text