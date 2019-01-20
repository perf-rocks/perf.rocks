// Required for gatsby-plugin-linaria
// https://github.com/silvenon/gatsby-plugin-linaria#babel-configuration-file
https: module.exports = {
  presets: [
    'babel-preset-gatsby',
    [
      'linaria/babel',
      {
        evaluate: true,
        displayName: process.env.NODE_ENV !== 'production'
      }
    ]
  ]
};
