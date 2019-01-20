import React from 'react';
import Navigation from '../Navigation';
import { styled } from 'linaria/react';
import '../../styles/global.css';

const Layout = ({ children }) => {
  return (
    <LayoutWrapper>
      <LayoutSidebar>
        <Navigation />
      </LayoutSidebar>

      <LayoutMain>{children}</LayoutMain>
    </LayoutWrapper>
  );
};

const LayoutWrapper = styled.div`
  display: grid;
  grid-template-columns: minmax(200px, 25vw) 1fr;
`;
const LayoutSidebar = styled.div`
  background-color: #fff;
  padding: 40px;
`;
const LayoutMain = styled.main`
  padding: 40px;
`;

export default Layout;
