module.exports = {
    extends: ["airbnb-base", "prettier"],
    parserOptions: {
      babelOptions: {
        presets: [require.resolve("next/babel")],
      },
    },
  };
  