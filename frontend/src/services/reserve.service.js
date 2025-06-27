import httpClient from '../http-common';

const API_URL = '/api/reserves/';

const getAllReserves = () => httpClient.get(API_URL);

const getReserveById = (id) => httpClient.get(`${API_URL}${id}`);

const saveReserve = (reserve) => httpClient.post(API_URL, reserve);

const deleteReserveById = (id) => httpClient.delete(`${API_URL}${id}`);

const sendPaymentReceipt = (id) => httpClient.get(`${API_URL}${id}/payment-receipt`);

const sendPaymentReceiptV2 = (id) => httpClient.get(`${API_URL}${id}/payment-receipt-v2`);

const calculateFinalPrice = (reserve) => httpClient.post(`${API_URL}calculate-price`, reserve);

export default {
  getAllReserves,
  getReserveById,
  saveReserve,
  deleteById: deleteReserveById,
  sendPaymentReceipt,
  sendPaymentReceiptV2,
  calculateFinalPrice,
};
