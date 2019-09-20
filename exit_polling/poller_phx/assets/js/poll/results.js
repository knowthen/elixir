import React from 'react';
import { Switch, Route } from 'react-router';
import PollResultDistricts from './pollresultdistricts';
import PollResults from './pollresults';

const path = (url = '') => `/app/${url}`;

const Result = ({ match }) => {
  return (
    <>
      <Switch>
        <Route exact path={path('results')} component={PollResultDistricts} />
        <Route exact path={path('results/:id')} component={PollResults} />
      </Switch>
    </>
  );
};

export default Result;
