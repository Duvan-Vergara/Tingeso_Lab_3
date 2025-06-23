import { useState, useEffect, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import userService from '../../services/user.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function UserList() {
  const [users, setUsers] = useState([]);
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();

  useEffect(() => {
    if (location.state && location.state.undoMsg && location.state.undoData) {
      showSnackbar({
        msg: location.state.undoMsg,
        onUndo: () => {
          navigate(location.state.undoPath, {
            state: { ...location.state.undoData, undo: true },
          });
        },
      });
      window.history.replaceState({}, document.title);
    }
  }, [location, showSnackbar, navigate]);

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
    />
  );
}

export default UserList;
