import React from 'react';
import { graphql } from 'gatsby';
import '../styles/global.css';

const Index = ({ data }) => {
  const siteMetadata = data.site.siteMetadata;
  const resources = data.resources.edges.map(edge => edge.node.data);
  const topics = data.topics.edges.map(edge => edge.node.data.Name);

  return (
    <div>
      <h1>{siteMetadata.title}</h1>
      <p>{siteMetadata.description}</p>

      <nav>
        <h2>Topics</h2>
        <ul>
          {topics.map((topic, i) => {
            return <li key={i}>{topic}</li>;
          })}
        </ul>
      </nav>

      <main>
        <h2>Resources</h2>
        <ul>
          {resources.map((resource, i) => {
            return (
              <li key={i}>
                <a href={resource.url}>{resource.Title}</a>
              </li>
            );
          })}
        </ul>
      </main>
    </div>
  );
};

export const query = graphql`
  query Index {
    site {
      siteMetadata {
        title
        description
      }
    }
    topics: allAirtable(filter: { table: { eq: "Tags" } }) {
      edges {
        node {
          data {
            Name
          }
        }
      }
    }
    resources: allAirtable(filter: { table: { eq: "Resources" } }) {
      edges {
        node {
          data {
            Title
            url
            Topic {
              data {
                Name
              }
            }
          }
        }
      }
    }
  }
`;

export default Index;
