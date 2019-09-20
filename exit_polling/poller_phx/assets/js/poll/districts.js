import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { districtUpdate, districtMsg } from './pollresultupdate';
import { fetchDistricts } from './effects';
import { Fetching } from './fetching';

const fetchData = async setDistricts => {
  setDistricts(await fetchDistricts());
};

const Districts = ({ linkTo }) => {
  const [districts, setDistricts] = useState(null);

  useEffect(() => {
    fetchData(setDistricts);
  }, []);

  if (districts === null) return <Fetching />;

  return (
    <ul className="list ph2">
      {districts &&
        districts.map(district => (
          <li className="f4 mv2" key={district.id}>
            <Link
              to={`${linkTo}/${district.id}`}
              className="link pointer dark-gray"
            >
              {district.name}
            </Link>
          </li>
        ))}
    </ul>
  );
};

export default Districts;
