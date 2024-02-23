module.exports = {
  extends: ['plugin:@typescript-eslint/recommended', 'airbnb-base', 'airbnb-typescript', 'prettier'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    sourceType: 'module',
    ecmaVersion: 'latest',
  },
  ignorePatterns: ['build', 'dist', 'public'],
};
