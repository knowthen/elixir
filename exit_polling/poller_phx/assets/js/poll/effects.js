import { Socket } from 'phoenix';
import * as R from 'ramda';
import axios from './axios';
import {
  setDistrictsMsg,
  pollMsg,
  voteUpdateMsg,
  districtUpdateMsg,
} from './pollresultupdate';

// TODO: Implement rest endpoint /api/districts
export const fetchDistricts = async () => {
  const request = await axios.get('/api/districts');
  return request.data;
};

// TODO: Implement rest endpoint /api/district/<districtId>
export const fetchDistrict = async districtId => {
  const request = await axios.get(`/api/districts/${districtId}`);
  return request.data;
};

// TODO: Implement rest endpoint /api/district/<districtId>/questions
// TODO: Implement rest endpoint /api/questions/<questionId>/choices
export const fetchQuestions = async districtId => {
  const questions = (await axios.get(`/api/districts/${districtId}/questions`))
    .data;
  const choicesPromise = R.map(
    question => axios.get(`/api/questions/${question.id}/choices`),
    questions,
  );
  const allChoices = (await Promise.all(choicesPromise))
    .map(result => result.data)
    .flat();
  const questionsWithChoices = R.map(question => {
    const choices = R.filter(
      choice => choice.questionId == question.id,
      allChoices,
    );
    return { ...question, choices };
  }, questions);
  return questionsWithChoices;
};

export const vote = async (districtId, choiceId) => {
  const url = `/api/districts/${districtId}/choices/${choiceId}`;
  await axios.put(url);
};

// TODO: Implement phoenix channel for realime updates
export const pollResultEffects = (districtId, dispatch) => () => {
  fetchDistrict(districtId).then(district =>
    dispatch(districtUpdateMsg(district)),
  );
  // TODO: connect phoenix channel
};
