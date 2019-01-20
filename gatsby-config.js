require('dotenv').config({
  path: `.env`
});

module.exports = {
  siteMetadata: {
    title: `perf.rocks`,
    siteUrl: `https://perf.rocks`,
    description: `Web performance matters. Find resources that help you build lightning fast websites.`
  },
  plugins: [
    'gatsby-plugin-linaria',
    {
      resolve: `gatsby-source-airtable`,
      options: {
        apiKey: process.env.GATSBY_AIRTABLE_API_KEY,
        tables: [
          {
            baseId: process.env.GATSBY_AIRTABLE_BASE_ID,
            tableName: `Resources`,
            tableView: `Published`,
            tableLinks: [`Topic`]
          },
          {
            baseId: process.env.GATSBY_AIRTABLE_BASE_ID,
            tableName: `Tags`
          }
        ]
      }
    }
  ]
};
