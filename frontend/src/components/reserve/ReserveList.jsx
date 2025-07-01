import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import reserveService from '../../services/reserve.service';
import { useSnackbar } from '../GlobalSnackbar';
import { useAsyncLoading } from '../LoadingBar';
import LoadingState from '../LoadingState';
import GenericList from '../GenericList';

function ReserveList() {
  const [reserves, setReserves] = useState([]);
  const [isInitialLoading, setIsInitialLoading] = useState(true);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();
  const { executeWithLoading } = useAsyncLoading();

  const loadReserves = useCallback(async () => {
    try {
      const response = await reserveService.getAllReserves();
      return response.data;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar las reservas.' });
      return [];
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchReserves = async () => {
      setIsInitialLoading(true);
      const reservesData = await executeWithLoading(async () => {
        return await loadReserves();
      });
      setReserves(reservesData);
      setIsInitialLoading(false);
    };
    fetchReserves();
  }, [loadReserves, executeWithLoading]);

  const handleAddReserve = () => {
    navigate('/reserve/add');
  };

  const handleEditReserve = (id) => {
    navigate(`/reserve/edit/${id}`);
  };

  const handleSendPaymentReceipt = (id) => {
    executeWithLoading(async () => {
      try {
        await reserveService.sendPaymentReceipt(id);
        showSnackbar({ msg: 'Comprobante de pago enviado con éxito.' });
      } catch (error) {
        showSnackbar({ msg: 'Error al enviar el comprobante de pago.' });
      }
    });
  };

  const handleSendPaymentReceiptV2 = (id) => {
    executeWithLoading(async () => {
      try {
        await reserveService.sendPaymentReceiptV2(id);
        showSnackbar({ msg: 'Comprobante de pago (v2) enviado con éxito.' });
      } catch (error) {
        showSnackbar({ msg: 'Error al enviar el comprobante de pago (v2).' });
      }
    });
  };

  const columns = [
    { field: 'id', headerName: 'Código', width: 100 },
    {
      field: 'clientName',
      headerName: 'Cliente',
      width: 180,
      render: (value, row) => row.clientName || '',
    },
    {
      field: 'reserveday',
      headerName: 'Fecha',
      width: 120,
      render: (value) => (value ? new Date(value).toLocaleDateString('es-CL') : ''),
    },
    {
      field: 'numPersons',
      headerName: 'Número de Personas',
      width: 160,
      render: (value, row) => (row.reserves_users ? row.reserves_users.length : 0),
      align: 'center',
    },
    {
      field: 'final_price',
      headerName: 'Precio Final',
      width: 140,
      render: (value) => (value ? `$${value}` : ''),
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
    <GenericList
      title="Lista de Reservas"
      service={reserveService}
      data={reserves}
      loadItems={loadReserves}
      onAdd={handleAddReserve}
      onEdit={handleEditReserve}
      columns={columns}
      showSnackbar={showSnackbar}
      extraActions={extraActions}
      confirmTitle="¿Eliminar Reserva?"
      confirmMessage="¿Estás seguro de que deseas eliminar esta reserva?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default ReserveList;
