import React, { useReducer, useEffect } from 'react';
import * as R from 'ramda';
import numeral from 'numeral';
import { Fetching } from './fetching';
import { pollResultUpdate } from './pollresultupdate';
import { pollResultEffects } from './effects';
import { partyColor, partyName } from './util';

const initState = {
  poll: null,
  district: null,
  fetching: true,
};

const PollResults = ({ match }) => {
  const { id } = match.params;
  const [state, dispatch] = useReducer(pollResultUpdate, initState);
  useEffect(pollResultEffects(id, dispatch), [id]);
  if (state.fetching) {
    return <Fetching />;
  }
  return (
    <section>
      <h1>Poll results for {state.district.name}</h1>
      <Questions poll={state.poll} />
    </section>
  );
};

const Questions = ({ poll }) =>
  poll ? (
    <div className="flex flex-wrap justify-between pa2">
      {R.map(
        question => (
          <Question key={question.id} question={question} />
        ),
        poll.questions,
      )}
    </div>
  ) : null;

const Question = ({ question }) => {
  return (
    <div className="w-48-ns w-100 pa3 pv3 shadow-2 br1 mb3">
      <h3 className="f4 fw5 ma0 pa0">{question.description}</h3>
      <div className="tr f4 fw6 mv2">Votes</div>
      <Choices choices={question.choices} />
    </div>
  );
};

const Choices = ({ choices }) => {
  return (
    <>
      {R.map(
        choice => (
          <Choice key={choice.id} choice={choice} />
        ),
        choices,
      )}
    </>
  );
};

const Choice = ({ choice }) => {
  const percent = numeral(100 * choice.percent).format('0,0');
  const widthPct = choice.percent < 0.1 ? 10 : choice.percent * 100;
  return (
    <div className="flex mb2 bb b--black-10 pb3">
      <div className="w-80">
        <div className="flex items-baseline mb2">
          <div className="f4 mr2">{choice.description}</div>
          <div className="f6">{partyName(choice.party)}</div>
        </div>
        <div
          className={`h2 ${partyColor(choice.party)} br2 flex items-center`}
          style={{ width: `${widthPct}%` }}
        >
          <div className="f6 w-100 bn br4 white fw6 pl1">{percent}%</div>
        </div>
      </div>
      <div className="flex flex-columns flex-grow-1 f3 f2-ns items-center justify-end">
        {choice.votes}
      </div>
    </div>
  );
};

export default PollResults;
