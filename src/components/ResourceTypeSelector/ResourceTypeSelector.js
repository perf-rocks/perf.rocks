import React from 'react';

const ResourceTypeSelector = ({ types, selectedType, onChangeType }) => (
  <header>
    <ul>
      {types.map(type => {
        const [key, value] = type;

        return (
          <li key={key}>
            <label>
              <input
                type="radio"
                name={key}
                onClick={e => onChangeType(e.target.name)}
                checked={value === selectedType}
              />
              {value}
            </label>
          </li>
        );
      })}
    </ul>
  </header>
);

export default ResourceTypeSelector;
