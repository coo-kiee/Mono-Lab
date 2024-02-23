module.exports = {
  extends: ['plugin:@typescript-eslint/recommended', 'airbnb', 'airbnb-typescript', 'airbnb/hooks', 'prettier'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    sourceType: 'module',
    ecmaVersion: 'latest',
  },
  ignorePatterns: ['build', 'dist', 'public'],
};
