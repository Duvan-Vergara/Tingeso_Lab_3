import httpClient from '../http-common';

const API_URL = '/api/reserves/users/';

const getAllUsers = () => httpClient.get(API_URL);

const saveUser = (data) => httpClient.post(API_URL, data);

const getUserById = (id) => httpClient.get(`${API_URL}${id}`);

const deleteById = (id) => httpClient.delete(`${API_URL}${id}`);

export default {
  getAllUsers,
  saveUser,
  getUserById,
  deleteById,
};
