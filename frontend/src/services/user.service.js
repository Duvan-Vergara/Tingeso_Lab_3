import httpClient from '../http-common';

const API_URL = '/api/reserves/users/';

const getAllUsers = () => httpClient.get(API_URL);

const saveUser = (data) => httpClient.post(API_URL, data);

const getUserById = (id) => httpClient.get(`${API_URL}${id}`);

const deleteById = (id) => httpClient.delete(`${API_URL}${id}`);

/**
 * Get paginated users with sorting support
 * @param {number} page - Page number (0-indexed)
 * @param {number} size - Page size (default: 10)
 * @param {string} sortBy - Sort field (default: 'id')
 * @param {string} sortDir - Sort direction: 'asc' or 'desc' (default: 'asc')
 * @returns {Promise} Promise with paginated response
 */
const getAllUsersPaginated = (page = 0, size = 10, sortBy = 'id', sortDir = 'asc') => {
  const params = {
    page,
    size,
    sortBy,
    sortDir,
  };
  return httpClient.get(`${API_URL}paginated`, { params });
};

/**
 * Search users with filters and pagination
 * @param {Object} filters - Search filters
 * @returns {Promise} Promise with filtered results
 */
const searchUsers = (filters = {}) => {
  const {
    page = 0,
    size = 10,
    sortBy = 'id',
    sortDir = 'asc',
    searchTerm = '',
  } = filters;

  const params = {
    page,
    size,
    sortBy,
    sortDir,
  };

  // Add search term if provided
  if (searchTerm) {
    params.searchTerm = searchTerm;
  }

  return httpClient.get(`${API_URL}search`, { params });
};

export default {
  getAllUsers,
  saveUser,
  getUserById,
  deleteById,
  getAllUsersPaginated,
  searchUsers,
};
