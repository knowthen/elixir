import React, {useReducer, useEffect} from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter as Router, Route} from 'react-router-dom';
import {Switch} from 'react-router';
import Polls from './polls';
import Results from './results';

const App = () => {
  return (
    <Switch>
      <Route path="/app/results" component={Results} />
      <Route path="/app/polls" component={Polls} />
    </Switch>
  );
};

ReactDOM.render(
  <Router>
    <App />
  </Router>,
  document.getElementById('app'),
);
