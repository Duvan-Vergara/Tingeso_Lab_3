import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import tariffService from '../../services/tariff.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function TariffList() {
  const [tariffs, setTariffs] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadTariffs = useCallback(async () => {
    try {
      const response = await tariffService.getAllTariffs();
      return response.data;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar las tarifas.' });
      return [];
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchTariffs = async () => {
      const tariffsData = await loadTariffs();
      setTariffs(tariffsData);
    };
    fetchTariffs();
  }, [loadTariffs]);

  const handleAddTariff = () => {
    navigate('/tariff/add');
  };

  const handleEditTariff = (id) => {
    navigate(`/tariff/edit/${id}`);
  };

  const handleBasePrice = (idTarifa) => {
    const fecha = new Date().toISOString().split('T')[0]; // YYYY-MM-DD
    tariffService
      .getBasePrice(fecha, idTarifa)
      .then((response) => {
        showSnackbar({
          msg: `El precio base para la tarifa ${idTarifa} es: ${response.data.basePrice.toLocaleString('es-CL')}`,
        });
      })
      .catch(() => {
        showSnackbar({
          msg: 'Error al obtener el precio base de la tarifa.',
        });
      });
  };

  const columns = [
    { field: 'laps', headerName: 'Vueltas', width: 100 },
    { field: 'max_minutes', headerName: 'Máx. Minutos', width: 120 },
    {
      field: 'regular_price',
      headerName: 'Precio Regular',
      width: 140,
      render: (value) => value.toLocaleString('es-CL'),
    },
    { field: 'total_duration', headerName: 'Duración Total (minutos)', width: 180 },
  ];

  const extraActions = (row) => (
    <button
      type="button"
      onClick={() => handleBasePrice(row.id)}
      style={{ marginLeft: '0.5rem' }}
    >
      Precio Base
    </button>
  );

  return (
    <GenericList
      title="Lista de Tarifas"
      service={tariffService}
      data={tariffs}
      loadItems={loadTariffs}
      onAdd={handleAddTariff}
      onEdit={handleEditTariff}
      columns={columns}
      showSnackbar={showSnackbar}
      extraActions={extraActions}
      confirmTitle="¿Eliminar Tarifa?"
      confirmMessage="¿Estás seguro de que deseas eliminar esta tarifa?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default TariffList;
