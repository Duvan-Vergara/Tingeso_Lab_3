import { useState, useEffect, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import tariffService from '../../services/tariff.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function TariffList() {
  const [tariffs, setTariffs] = useState([]);
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
      valueFormatter: (value) => value.toLocaleString('es-CL'),
    },
    { field: 'total_duration', headerName: 'Duración Total (minutos)', width: 180 },
  ];

  // Acciones personalizadas para cada fila
  const customActions = [
    {
      label: 'Precio Base',
      color: 'accent',
      onClick: (row) => handleBasePrice(row.id),
    },
  ];

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
      customActions={customActions}
    />
  );
}

export default TariffList;
