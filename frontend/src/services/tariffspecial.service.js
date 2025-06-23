import httpClient from '../http-common';

const API_URL = '/api/specialtariffs/';

const getTariffSpecial = () => httpClient.get(API_URL);

const createTariffSpecial = (tariff) => httpClient.post(`${API_URL}crear`, tariff);

const updateTariffSpecial = (tariff) => httpClient.post(`${API_URL}actualizar`, tariff);

export default {
  getTariffSpecial,
  createTariffSpecial,
  updateTariffSpecial,
};
