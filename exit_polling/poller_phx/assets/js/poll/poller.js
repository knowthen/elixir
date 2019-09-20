import React, { useState, useEffect } from 'react';
import { Link, withRouter, Redirect } from 'react-router-dom';
import * as R from 'ramda';
import axios from './axios';
import { partyName, partyColor } from './util';
import { Fetching } from './fetching';
import { fetchDistrict, fetchQuestions, vote } from './effects';

const fetchData = async (state, setState, districtId) => {
  const [district, questions] = await Promise.all([
    fetchDistrict(districtId),
    fetchQuestions(districtId),
  ]);
  setState({ district, questions });
};

const Poller = ({ match, history }) => {
  const { districtId } = match.params;
  const idx = parseInt(match.params.idx);
  const [state, setState] = useState(null);
  useEffect(() => {
    fetchData(state, setState, districtId);
  }, []);
  if (!state) return <Fetching />;
  if (idx >= state.questions.length)
    return <Redirect to={`/app/polls/${districtId}`} />;
  return (
    <>
      <h1>Poll for {state.district.name}</h1>
      {idx > -1 ? (
        <Question state={state} idx={idx} history={history} />
      ) : (
        <StartButton districtId={districtId} />
      )}
    </>
  );
};

const Question = ({ state, idx, history }) => {
  const question = state.questions[idx];
  const { district } = state;
  return (
    <section className="mh2">
      <h3 className="f3 fw4">{question.description}</h3>
      <Choices
        choices={question.choices}
        idx={idx}
        districtId={district.id}
        history={history}
      />
      <CancelButton districtId={district.id} />
    </section>
  );
};

const Choices = props => {
  const { choices } = props;
  return (
    <div className="flex justify-between flex-wrap mb3">
      {R.map(
        choice => (
          <Choice key={choice.id} choice={choice} {...props} />
        ),
        choices,
      )}
    </div>
  );
};

const handleChoice = async (history, idx, districtId, choice) => {
  await vote(districtId, choice.id);
  history.push(`/app/polls/${districtId}/${idx + 1}`);
};

const Choice = ({ history, idx, districtId, choice }) => {
  return (
    <a
      className={`w-100 w-40-ns link dim pv3 mb2 dib white ${partyColor(
        choice.partyId,
      )} br1
        pointer`}
      onClick={() => {
        handleChoice(history, idx, districtId, choice);
      }}
    >
      <div className="f3 tc mb2">{choice.description}</div>
      <div className="f5 tc mb2">{partyName(choice.partyId)}</div>
    </a>
  );
};

const StartButton = ({ districtId }) => (
  <Link
    to={`/app/polls/${districtId}/0`}
    className="ml2 link dim pv3 ph4 mb2 dib white bg-blue ba b--blue br1
        pointer"
  >
    Start
  </Link>
);

const CancelButton = ({ districtId }) => (
  <Link
    to={`/app/polls/${districtId}`}
    className="
    link dim pv3 ph4 mb2 dib dark-gray ba b--black-80 br1 pointer"
  >
    Cancel
  </Link>
);

export default withRouter(Poller);
