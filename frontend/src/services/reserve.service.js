import httpClient from '../http-common';

const API_URL = '/api/reserves/';

// RF5 Performance Optimization: Aligned with actual backend endpoints
// Uses only the endpoints that actually exist in ReserveController.java

/**
 * Get paginated reserves using the main endpoint with pagination params
 * @param {number} page - Page number (0-indexed)
 * @param {number} size - Page size (default: 10)
 * @param {string} sortBy - Sort field (default: 'reserveday')
 * @param {string} sortDir - Sort direction: 'asc' or 'desc' (default: 'desc')
 * @returns {Promise} Promise with paginated response
 */
const getAllReserves = (page = 0, size = 10, sortBy = 'reserveday', sortDir = 'desc') => {
  const params = {
    page,
    size,
    sortBy,
    sortDir,
  };
  // Uses the actual backend endpoint: GET /reserves/
  return httpClient.get(API_URL, { params });
};

/**
 * Get reserves by date range using the existing backend endpoint
 * @param {string} startDate - Start date (YYYY-MM-DD)
 * @param {string} endDate - End date (YYYY-MM-DD)
 * @returns {Promise} Promise with date-filtered results
 */
const getReservesByDateRange = (startDate, endDate) => {
  const dateRange = {
    star: startDate,
    end: endDate,
  };
  // Uses the actual backend endpoint: POST /reserves/getAll
  return httpClient.post(`${API_URL}getAll`, dateRange);
};

/**
 * Get reserves by week using the existing backend endpoint
 * @param {number} year - Year
 * @param {number} month - Month
 * @param {number} day - Day
 * @returns {Promise} Promise with weekly reserves
 */
const getReservesByWeek = (year, month, day) => {
  const weekData = {
    anio: year,
    mes: month,
    dia: day,
  };
  // Uses the actual backend endpoint: POST /reserves/week
  return httpClient.post(`${API_URL}week`, weekData);
};

// Core CRUD operations that match the real backend endpoints
const getReserveById = (id) => httpClient.get(`${API_URL}${id}`);

const saveReserve = (reserve) => httpClient.post(API_URL, reserve);

const deleteReserveById = (id) => httpClient.delete(`${API_URL}${id}`);

const sendPaymentReceipt = (id) => httpClient.get(`${API_URL}${id}/payment-receipt`);

const sendPaymentReceiptV2 = (id) => httpClient.get(`${API_URL}${id}/payment-receipt-v2`);

const calculateFinalPrice = (reserve) => httpClient.post(`${API_URL}calculate-price`, reserve);

export default {
  getAllReserves,
  getReservesByDateRange,
  getReservesByWeek,
  getReserveById,
  saveReserve,
  deleteById: deleteReserveById,
  sendPaymentReceipt,
  sendPaymentReceiptV2,
  calculateFinalPrice,
};
