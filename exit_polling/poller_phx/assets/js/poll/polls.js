import React from 'react';
import { Switch, Route } from 'react-router';
import PollDistricts from './polldistricts';
import Poller from './poller';

const Poll = ({ match }) => {
  return (
    <>
      <Switch>
        <Route exact path="/app/polls" component={PollDistricts} />
        <Route exact path="/app/polls/:districtId" component={Poller} />
        <Route exact path="/app/polls/:districtId/:idx" component={Poller} />
      </Switch>
    </>
  );
};

export default Poll;
