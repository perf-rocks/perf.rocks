import React from 'react';
import { graphql } from 'gatsby';
import Layout from '../components/Layout';
import ResourceTypeSelector from '../components/ResourceTypeSelector';

const RESOURCE_TYPES = {
  ALL: 'all',
  ARTICLE: 'article',
  VIDEO: 'video',
  TOOL: 'tool'
};

class Resources extends React.Component {
  constructor(props) {
    super(props);

    this.RESOURCE_TYPES = RESOURCE_TYPES;
    this.state = { resourceTypeFilter: RESOURCE_TYPES.ALL };
    this.handleTypeFilterChange = this.handleTypeFilterChange.bind(this);
  }

  handleTypeFilterChange(value) {
    this.setState({
      resourceTypeFilter: this.RESOURCE_TYPES[value]
    });
  }

  render() {
    const { resourceTypeFilter } = this.state;
    const edge = this.props.data.resources.edges[0];
    const resourcesData = edge.node.data.Resources;

    // @TODO remove
    if (!resourcesData) {
      return (
        <Layout>
          <main>No content</main>
        </Layout>
      );
    }

    const resources = resourcesData
      .map(({ data }) => data)
      .filter(
        ({ Type }) =>
          resourceTypeFilter === RESOURCE_TYPES.ALL ||
          resourceTypeFilter === Type[0].data.Name
      );

    return (
      <Layout>
        <main>
          <ResourceTypeSelector
            types={Object.entries(this.RESOURCE_TYPES)}
            selectedType={this.state.resourceTypeFilter}
            onChangeType={this.handleTypeFilterChange}
          />
          <h1>{this.state.resourceTypeFilter}</h1>
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
  }
}

export default Resources;

export const pageQuery = graphql`
  query($tag: String) {
    resources: allAirtable(
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
