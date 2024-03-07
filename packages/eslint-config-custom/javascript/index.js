module.exports = {
  extends: ['airbnb-base', 'prettier'],
  parserOptions: {
    sourceType: 'module',
    ecmaVersion: 'latest',
  },
  ignorePatterns: ['build', 'dist', 'public'],
};
