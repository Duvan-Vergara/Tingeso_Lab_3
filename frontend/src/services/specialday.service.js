import httpClient from '../http-common';

const API_URL = '/api/specialtariffs/specialdays/';

const getAllSpecialDays = () => httpClient.get(API_URL);

const createSpecialDay = (specialDay) => httpClient.post(API_URL, specialDay);

const getSpecialDayById = (id) => httpClient.get(`${API_URL}${id}`);

const deleteSpecialDayById = (id) => httpClient.delete(`${API_URL}${id}`);

export default {
  getAllSpecialDays,
  createSpecialDay,
  getSpecialDayById,
  deleteById: deleteSpecialDayById,
};
