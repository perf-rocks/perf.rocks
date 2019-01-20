const slugify = require('slugify');
const path = require('path');

exports.createPages = ({ graphql, actions }) => {
  const { createPage } = actions;

  return new Promise((resolve, reject) => {
    graphql(`
      {
        tags: allAirtable(filter: { table: { eq: "Tags" } }) {
          edges {
            node {
              data {
                Name
              }
            }
          }
        }
      }
    `).then(result => {
      result.data.tags.edges.forEach(({ node }) => {
        const tag = node.data.Name;
        const slug = slugify(tag, {
          replacement: '-',
          lower: true
        });

        createPage({
          path: `topic/${slug}`,
          component: path.resolve('src/templates/resources.js'),
          context: {
            tag
          }
        });
      });

      resolve();
    });
  });
};
