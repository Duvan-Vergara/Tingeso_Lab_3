import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import userService from '../../services/user.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';
import PaginationComponent from '../PaginationComponent';

function UserList() {
  const [users, setUsers] = useState([]);
  const [isInitialLoading, setIsInitialLoading] = useState(true);
  const [isLoading, setIsLoading] = useState(false);
  // RF5 Performance Optimization: Add pagination support for users
  const [pagination, setPagination] = useState({
    page: 0,
    size: 20, // Larger page size for users as they're viewed less frequently
    totalPages: 0,
    totalElements: 0,
  });
  const [usePagination, setUsePagination] = useState(false); // Toggle pagination when needed
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadUsers = useCallback(async (page = 0, size = 20) => {
    try {
      setIsLoading(true);
      // If pagination is enabled and we have many users, use paginated endpoint
      const response = usePagination ?
        await userService.getAllUsersPaginated(page, size) :
        await userService.getAllUsers();
      // Handle both paginated and non-paginated responses
      const content = response.data?.content || response.data || [];
      const totalElements = response.data?.totalElements || content.length;
      const totalPages = response.data?.totalPages || Math.ceil(totalElements / size);
      // Auto-enable pagination if we have many users
      if (!usePagination && totalElements > 50) {
        setUsePagination(true);
        // Retry with pagination
        const paginatedResponse = await userService.getAllUsersPaginated(page, size);
        const paginatedContent = paginatedResponse.data?.content || paginatedResponse.data || [];
        const paginatedTotal = paginatedResponse.data?.totalElements || paginatedContent.length;
        const paginatedTotalPages = paginatedResponse.data?.totalPages || Math.ceil(paginatedTotal / size);
        setPagination({
          page,
          size,
          totalPages: paginatedTotalPages,
          totalElements: paginatedTotal,
        });

        return paginatedContent;
      }

      setPagination({
        page,
        size,
        totalPages,
        totalElements,
      });

      return content;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar los usuarios.' });
      return [];
    } finally {
      setIsLoading(false);
    }
  }, [showSnackbar, usePagination]);

  useEffect(() => {
    const fetchUsers = async () => {
      setIsInitialLoading(true);
      try {
        const usersData = await loadUsers(pagination.page, pagination.size);
        setUsers(usersData);
      } finally {
        setIsInitialLoading(false);
      }
    };
    fetchUsers();
  }, [loadUsers, pagination.page, pagination.size]);

  const handlePageChange = async (newPage) => {
    const usersData = await loadUsers(newPage, pagination.size);
    setUsers(usersData);
  };

  const handlePageSizeChange = async (newSize) => {
    const usersData = await loadUsers(0, newSize);
    setUsers(usersData);
  };

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

  if (isInitialLoading) {
    return (
      <div style={{ textAlign: 'center', padding: '2rem' }}>
        <span>Cargando usuarios...</span>
      </div>
    );
  }

  return (
    <div>
      <GenericList
        title="Lista de Usuarios"
        service={userService}
        data={users}
        loadItems={() => loadUsers(pagination.page, pagination.size)}
        onAdd={handleAddUser}
        onEdit={handleEditUser}
        columns={columns}
        confirmTitle="¿Eliminar Usuario?"
        confirmMessage="¿Estás seguro de que deseas eliminar este usuario?"
        confirmText="Eliminar"
        cancelText="Cancelar"
      />

      {usePagination && pagination.totalPages > 1 && (
        <PaginationComponent
          currentPage={pagination.page}
          totalPages={pagination.totalPages}
          totalElements={pagination.totalElements}
          pageSize={pagination.size}
          onPageChange={handlePageChange}
          onPageSizeChange={handlePageSizeChange}
        />
      )}

      {isLoading && (
        <div style={{
          position: 'relative',
          opacity: 0.7,
          pointerEvents: 'none',
          textAlign: 'center',
          padding: '1rem',
          background: 'rgba(255,255,255,0.8)',
          borderRadius: '4px',
          margin: '1rem 0',
        }}>
          <span>Cargando página...</span>
        </div>
      )}
    </div>
  );
}

export default UserList;
