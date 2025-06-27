import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import userService from '../../services/user.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function UserList() {
  const [users, setUsers] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadUsers = useCallback(async () => {
    try {
      const response = await userService.getAllUsers();
      return response.data;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar los usuarios.' });
      return [];
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchUsers = async () => {
      const usersData = await loadUsers();
      setUsers(usersData);
    };
    fetchUsers();
  }, [loadUsers]);

  const handleAddUser = () => {
    navigate('/user/add');
  };

  const handleEditUser = (id) => {
    navigate(`/user/edit/${id}`);
  };

  const columns = [
    { field: 'rut', headerName: 'Rut', width: 150 },
    { field: 'name', headerName: 'Nombre', width: 150 },
    { field: 'lastName', headerName: 'Apellido', width: 150 },
    { field: 'email', headerName: 'Email', width: 200 },
    { field: 'birthDate', headerName: 'Fecha de Nacimiento', width: 180 },
  ];

  return (
    <GenericList
      title="Lista de Usuarios"
      service={userService}
      data={users}
      loadItems={loadUsers}
      onAdd={handleAddUser}
      onEdit={handleEditUser}
      columns={columns}
      showSnackbar={showSnackbar}
      confirmTitle="¿Eliminar Usuario?"
      confirmMessage="¿Estás seguro de que deseas eliminar este usuario?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default UserList;
