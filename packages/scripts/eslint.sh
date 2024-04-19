#!/bin/bash

echo $PWD
. "../../packages/scripts/color.sh"
. "../../packages/scripts/select.sh"

eslint_options=("javascript" "typescript" "react-ts")
select_option "${eslint_options[@]}" "Select_ESLint"
eslint_type=$select_result

ESLINT_RC_FILE=".eslintrc.js"


start_cli="yarn add -D"
custom_eslint="@packages/eslint-config-custom"
eslint_prettier="eslint-config-prettier@^9.1.0"

airbnb_base="eslint@^8.2.0 eslint-config-airbnb-base@^15.0.0 eslint-plugin-import@^2.25.3"
airbnb_typescript="eslint-config-airbnb-typescript@^17.1.0 eslint-import-resolver-typescript@^3.6.1 @typescript-eslint/eslint-plugin@^6.0.0 @typescript-eslint/parser@^6.0.0"
airbnb="eslint-config-airbnb@^19.0.4 eslint-plugin-jsx-a11y@^6.5.1 eslint-plugin-react@^7.28.0 eslint-plugin-react-hooks@^4.3.0"

javascript_deps="${start_cli} ${custom_eslint} ${airbnb_base} ${eslint_prettier}"
typescript_deps="${javascript_deps} ${airbnb_typescript}"
react_ts_deps="${typescript_deps} ${airbnb}"

if [ $eslint_type == "javascript" ]; then
   ESLINT_RC_CONTENT=$(cat <<EOF
module.exports = {
    root: true,
    extends: ['@packages/eslint-config-custom'],
}
EOF
)
   $javascript_deps 
elif [ $eslint_type == "typescript" ]; then
   ESLINT_RC_CONTENT=$(cat <<EOF
module.exports = {
    root: true,
    extends: ['@packages/eslint-config-custom/typescript'],
}
EOF
)
    $typescript_deps
elif [ $eslint_type == "react-ts" ]; then
   ESLINT_RC_CONTENT=$(cat <<EOF
module.exports = {
    root: true,
    extends: ['@packages/eslint-config-custom/react'],
}
EOF
)
    $react_ts_deps
fi

# .eslintrc.js 파일 생성
echo "$ESLINT_RC_CONTENT" > "$ESLINT_RC_FILE"

echo "Created $ESLINT_RC_FILE successfully."