import httpClient from '../http-common';

const API_URL = '/api/tariffs/';

const getAllTariffs = () => httpClient.get(API_URL);

const saveTariff = (tariff) => httpClient.post(`${API_URL}save`, tariff);

const getTariffById = (id) => httpClient.post(`${API_URL}getid`, { id });

const deleteTariffById = (id) => httpClient.delete(`${API_URL}${id}`);

const getBasePrice = (fecha, idTarifa) => httpClient.post(`${API_URL}baseprice`, {
  fecha, // Debe ser un string en formato 'YYYY-MM-DD'
  idTarifa, // Debe ser un número (long)
});

export default {
  getAllTariffs,
  saveTariff,
  getTariffById,
  deleteById: deleteTariffById,
  getBasePrice,
};
