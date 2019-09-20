import React from 'react';
import Districts from './districts';

const PollResultDistricts = ({ match }) => {
  return (
    <>
      <h1>Poll Results</h1>
      <Districts linkTo="/app/results" />
    </>
  );
};

export default PollResultDistricts;
