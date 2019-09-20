import * as R from 'ramda';

const POLL_RESULT_MSGS = {
  POLL_UPDATE: 'POLL_UPDATE',
  VOTE_UPDATE: 'VOTE_UPDATE',
  DISTRICT_UPDATE: 'DISTRICTS_UPDATE',
};

const POLL_RESULT_DISTRICT_MSGS = {
  DISTRICTS_UPDATE: 'DISTRICTS_UPDATE',
  DISTRICT_UPDATE: 'DISTRICT_UPDATE',
};

export const pollResultUpdate = (state, msg) => {
  switch (msg.type) {
    case POLL_RESULT_MSGS.POLL_UPDATE: {
      const { poll } = msg;
      const updatedPoll = updatePollPct(poll);
      return { ...state, poll: updatedPoll };
    }
    case POLL_RESULT_MSGS.VOTE_UPDATE: {
      const { choiceId, votes } = msg;
      const poll = R.pipe(
        updateVote(choiceId, votes),
        updatePollPct,
      )(state.poll);
      return { ...state, poll };
    }
    case POLL_RESULT_MSGS.DISTRICT_UPDATE: {
      const { district } = msg;
      return { ...state, district, fetching: false };
    }
  }
  return state;
};

export const districtUpdate = (state, msg) => {
  switch (msg.type) {
    case POLL_RESULT_DISTRICT_MSGS.DISTRICTS_UPDATE:
      return { ...state, districts: msg.districts };
    case POLL_RESULT_DISTRICT_MSGS.DISTRICT_UPDATE:
      return { ...state, district: msg.district };
  }
};

const updatePollPct = poll => {
  const questions = R.map(question => {
    const votes = R.pipe(
      R.map(R.prop('votes')),
      R.sum(),
    )(question.choices);
    const choices = R.map(choice => {
      const percent = votes != 0 ? choice.votes / votes : 0;
      return { ...choice, percent };
    }, question.choices);
    const sortedChoices = sortByVotes(choices);
    return { ...question, votes, choices: sortedChoices };
  }, poll.questions);
  return { ...poll, questions };
};

const sortByVotes = R.sortWith([
  R.descend(R.prop('votes')),
  R.ascend(R.prop('party')),
]);

const updateVote = R.curry((choiceId, votes, poll) => {
  const questions = R.map(question => {
    const choices = R.map(choice => {
      if (choice.id === choiceId) {
        return { ...choice, votes };
      } else {
        return choice;
      }
    }, question.choices);
    return { ...question, choices };
  }, poll.questions);
  return { ...poll, questions };
});

export const setDistrictsMsg = districts => ({
  type: POLL_RESULT_DISTRICT_MSGS.DISTRICTS_UPDATE,
  districts,
});

export const districtMsg = district => ({
  type: POLL_RESULT_DISTRICT_MSGS.DISTRICT_UPDATE,
  district,
});

export const voteUpdateMsg = (choiceId, votes) => ({
  type: POLL_RESULT_MSGS.VOTE_UPDATE,
  choiceId,
  votes,
});

export const pollMsg = poll => ({
  type: POLL_RESULT_MSGS.POLL_UPDATE,
  poll,
});

export const districtUpdateMsg = district => ({
  type: POLL_RESULT_MSGS.DISTRICT_UPDATE,
  district,
});
