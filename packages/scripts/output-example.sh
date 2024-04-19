#!/bin/bash
. "./packages/scripts/color.sh"

yellow "app: " && add_text "yarn app tsconfig echo\n"
yellow "package: " && add_text "yarn package tsconfig echo\n"
yellow "all: " && add_text "yarn all echo\n"
yellow "all-app: " && add_text "yarn all-app echo\n"
yellow "all-package: " && add_text "yarn all-package echo\n"
yellow "add-workspace: " && add_text "yarn add-workspace test\n"

print_text