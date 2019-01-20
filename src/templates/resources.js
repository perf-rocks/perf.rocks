import React from 'react';
import { graphql } from 'gatsby';
import Layout from '../components/Layout';

const Tag = ({ data }) => {
  const edge = data.tags.edges[0];
  const resources =
    edge.node.data.Resources &&
    edge.node.data.Resources.map(resource => resource.data);

  return (
    <Layout>
      <main>
        <ul>
          {resources &&
            resources.map((resource, i) => (
              <li key={i}>
                <a href={resource.url}>{resource.Title}</a>
              </li>
            ))}
        </ul>
      </main>
    </Layout>
  );
};

export default Tag;

export const pageQuery = graphql`
  query($tag: String) {
    tags: allAirtable(
      filter: { table: { eq: "Tags" }, data: { Name: { eq: $tag } } }
    ) {
      edges {
        node {
          data {
            Name
            Group
            Resources {
              data {
                Title
                url
                Type {
                  data {
                    Name
                  }
                }
              }
            }
          }
        }
      }
    }
  }
`;
