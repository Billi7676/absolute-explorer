
import { COIN, TXS } from '../constants';
import config from '../../config';
import fetch from '../../lib/fetch';

const api = `${ config.api.host }:${ config.api.port }${ config.api.prefix }`;

export const getCoin = (dispatch) => {
  return fetch(`${ api }/coin`).then((payload) => {
    dispatch({ payload, type: COIN });
    return payload;
  });
};

export const getTXLatest = (dispatch, query) => {
  return fetch(`${ api }/tx/latest`, query).then((payload) => {
    dispatch({ payload, type: TXS });
    return payload;
  });
};

export default {
  getCoin,
  getTXLatest
};