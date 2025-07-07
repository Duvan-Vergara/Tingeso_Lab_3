import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import reserveService from '../../services/reserve.service';
import { useSnackbar } from '../GlobalSnackbar';
import LoadingState from '../LoadingState';
import GenericList from '../GenericList';
import PaginationComponent from '../PaginationComponent';

function ReserveList() {
  const [reserves, setReserves] = useState([]);
  const [isInitialLoading, setIsInitialLoading] = useState(true);
  const [isLoading, setIsLoading] = useState(false);
  const [pagination, setPagination] = useState({
    page: 0,
    size: 10,
    totalPages: 0,
    totalElements: 0,
  });
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadReserves = useCallback(async (page = 0, size = 10) => {
    try {
      setIsLoading(true);
      const response = await reserveService.getAllReserves(page, size);

      const content = response.data?.content || response.data || [];
      const totalElements = response.data?.totalElements || content.length;
      const totalPages = response.data?.totalPages || Math.ceil(totalElements / size);
      const currentPage = response.data?.pageable?.pageNumber ?? page;

      setPagination({
        page: currentPage,
        size,
        totalPages,
        totalElements,
      });

      return content;
    } catch (error) {
      // eslint-disable-next-line no-console
      console.error('❌ Error al cargar reservas:', error);
      showSnackbar({ msg: 'Error al cargar las reservas.' });
      return [];
    } finally {
      setIsLoading(false);
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchReserves = async () => {
      setIsInitialLoading(true);
      try {
        const reservesData = await loadReserves(pagination.page, pagination.size);
        setReserves(reservesData);
      } finally {
        setIsInitialLoading(false);
      }
    };
    fetchReserves();
  }, [loadReserves, pagination.page, pagination.size]);

  const handlePageChange = async (newPage) => {
    const reservesData = await loadReserves(newPage, pagination.size);
    setReserves(reservesData);
  };

  const handlePageSizeChange = async (newSize) => {
    const reservesData = await loadReserves(0, newSize);
    setReserves(reservesData);
  };

  const handleAddReserve = () => {
    navigate('/reserve/add');
  };

  const handleEditReserve = (id) => {
    navigate(`/reserve/edit/${id}`);
  };

  const handleSendPaymentReceipt = async (id) => {
    try {
      await reserveService.sendPaymentReceipt(id);
      showSnackbar({ msg: 'Comprobante de pago enviado con éxito.' });
    } catch (error) {
      showSnackbar({ msg: 'Error al enviar el comprobante de pago.' });
    }
  };

  const handleSendPaymentReceiptV2 = async (id) => {
    try {
      await reserveService.sendPaymentReceiptV2(id);
      showSnackbar({ msg: 'Comprobante de pago (v2) enviado con éxito.' });
    } catch (error) {
      showSnackbar({ msg: 'Error al enviar el comprobante de pago (v2).' });
    }
  };

  const columns = [
    { field: 'id', headerName: 'Código', width: 100 },
    {
      field: 'clientName',
      headerName: 'Cliente',
      width: 180,
      render: (value, row) => {
        if (row.reservesUsers && row.reservesUsers.length > 0) {
          const firstUser = row.reservesUsers[0];
          return `${firstUser.name} ${firstUser.lastName}`;
        }
        return 'Sin cliente';
      },
    },
    {
      field: 'reserveday',
      headerName: 'Fecha',
      width: 120,
      render: (value, row) => {
        const dateField = row.reserveday;
        return dateField ? new Date(dateField).toLocaleDateString('es-CL') : 'Sin fecha';
      },
    },
    {
      field: 'timeRange',
      headerName: 'Horario',
      width: 140,
      render: (value, row) => {
        if (row.begin && row.finish) {
          return `${row.begin} - ${row.finish}`;
        }
        return 'Sin horario';
      },
    },
    {
      field: 'numPersons',
      headerName: 'Número de Personas',
      width: 160,
      render: (value, row) => {
        if (row.reservesUsers && Array.isArray(row.reservesUsers)) {
          return row.reservesUsers.length;
        }
        return 0;
      },
      align: 'center',
    },
    {
      field: 'finalPrice',
      headerName: 'Precio Final',
      width: 140,
      render: (value, row) => {
        const price = row.finalPrice || 0;
        return `$${price.toLocaleString('es-CL')}`;
      },
      align: 'center',
    },
  ];

  const extraActions = (row) => (
    <>
      <button
        type="button"
        onClick={() => handleSendPaymentReceipt(row.id)}
        style={{ marginLeft: '0.5rem' }}
      >
        Enviar Comprobante
      </button>
      <button
        type="button"
        onClick={() => handleSendPaymentReceiptV2(row.id)}
        style={{ marginLeft: '0.5rem' }}
      >
        Comprobante V2
      </button>
    </>
  );

  if (isInitialLoading) {
    return (
      <LoadingState
        title="Cargando Reservas"
        message="Obteniendo datos del servidor..."
        size="large"
      />
    );
  }

  return (
    <div>
      <GenericList
        title="Lista de Reservas"
        service={reserveService}
        data={reserves}
        loadItems={() => loadReserves(pagination.page, pagination.size)}
        onAdd={handleAddReserve}
        onEdit={handleEditReserve}
        columns={columns}
        extraActions={extraActions}
        confirmTitle="¿Eliminar Reserva?"
        confirmMessage="¿Estás seguro de que deseas eliminar esta reserva?"
        confirmText="Eliminar"
        cancelText="Cancelar"
        disablePagination={true}
      />
      {pagination.totalPages > 1 && (
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

export default ReserveList;
