import React from 'react';

export const partyName = partyId => {
  switch (partyId) {
    case 1:
      return 'Democrat';
    case 2:
      return 'Republican';
  }
};

export const partyColor = partyId => {
  switch (partyId) {
    case 1:
      return 'bg-navy';
    case 2:
      return 'bg-dark-red';
  }
};

export const Fetching = () => <i className="fas fa-spinner fa-spin blue f3" />;
