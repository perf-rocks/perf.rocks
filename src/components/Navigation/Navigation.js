import React from 'react';
import { StaticQuery, Link } from 'gatsby';
import slugify from 'slugify';

const Navigation = () => (
  <StaticQuery
    query={graphql`
      query NavigationQuery {
        site {
          siteMetadata {
            title
            description
          }
        }

        tags: allAirtable(filter: { table: { eq: "Tags" } }) {
          edges {
            node {
              data {
                Name
                Group
              }
            }
          }
        }
      }
    `}
    render={data => {
      const edges = data.tags.edges;
      const tags = edges.map(edge => edge.node.data);

      const groups = Array.from(
        new Set(edges.map(edge => edge.node.data.Group))
      ).sort();

      const slug = t =>
        slugify(t, {
          replacement: '-',
          lower: true
        });

      return (
        <div className="Navigation">
          <header>
            <h1>
              <Link to="/">{data.site.siteMetadata.title}</Link>
            </h1>
          </header>
          <nav>
            {groups.map((group, i) => {
              return (
                <React.Fragment>
                  <strong>{group.slice(3)}</strong>
                  <ul>
                    {tags
                      .filter(tag => tag.Group === group)
                      .map((tag, i) => {
                        const t = tag.Name;
                        return (
                          <li key={i}>
                            <Link to={`/topic/${slug(t)}`}>{t}</Link>
                          </li>
                        );
                      })}
                  </ul>
                </React.Fragment>
              );
            })}
          </nav>
        </div>
      );
    }}
  />
);

export default Navigation;
