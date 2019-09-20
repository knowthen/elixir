import axios from 'axios';
import humps from 'humps';

axios.defaults.transformResponse = data => {
  if (data && typeof data === 'string') {
    data = JSON.parse(data);
    return humps.camelizeKeys(data);
  }
  return data;
};

export default axios;
