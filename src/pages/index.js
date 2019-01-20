import React from 'react';
import { graphql } from 'gatsby';
import Layout from '../components/Layout';

const Index = ({ data }) => {
  const resources = data.resources.edges.map(edge => edge.node.data);

  return (
    <Layout>
      <ul>
        {resources.map((resource, i) => {
          return (
            <li key={i}>
              <a href={resource.url}>{resource.Title}</a>
            </li>
          );
        })}
      </ul>
    </Layout>
  );
};

export const query = graphql`
  query Index {
    resources: allAirtable(filter: { table: { eq: "Resources" } }) {
      edges {
        node {
          data {
            Title
            url
          }
        }
      }
    }
  }
`;

export default Index;
