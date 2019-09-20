import React from 'react';
import Districts from './districts';

const PollDistricts = ({ match }) => {
  return (
    <>
      <h1>Poll Districts</h1>
      <Districts linkTo="/app/polls" />
    </>
  );
};

export default PollDistricts;
