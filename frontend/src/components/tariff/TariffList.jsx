import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import tariffService from '../../services/tariff.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';
import './TariffList.css'; // Estilos glassmorphism

function TariffList() {
  const [tariffs, setTariffs] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadTariffs = useCallback(async () => {
    try {
      const response = await tariffService.getAllTariffs();
      return response.data || [];
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

  const columns = [
    { field: 'laps', headerName: 'Vueltas', width: 100 },
    {
      field: 'maxMinutes',
      headerName: 'Máx. Minutos',
      width: 120,
      render: (value, item) => {
        return item.maxMinutes || item.max_minutes || 0;
      },
    },
    {
      field: 'regularPrice',
      headerName: 'Precio Regular',
      width: 140,
      render: (value, item) => {
        const price = item.regularPrice || item.regular_price || 0;
        if (price == null || price === undefined || price === '') return '$0';
        const numValue = typeof price === 'string' ? parseFloat(price) : price;
        return !isNaN(numValue) ? `$${numValue.toLocaleString('es-CL')}` : '$0';
      },
    },
    {
      field: 'totalDuration',
      headerName: 'Duración Total (minutos)',
      width: 180,
      render: (value, item) => {
        return item.totalDuration || item.total_duration || 0;
      },
    },
  ];

  return (
    <div className="tariff-list-container glassmorphism-card">
      <GenericList
        title="Lista de Tarifas del Sistema"
        service={tariffService}
        data={tariffs}
        loadItems={loadTariffs}
        onAdd={handleAddTariff}
        onEdit={handleEditTariff}
        columns={columns}
        confirmTitle="¿Eliminar Tarifa?"
        confirmMessage="¿Estás seguro de que deseas eliminar esta tarifa?"
        confirmText="Eliminar"
        cancelText="Cancelar"
        className="data-grid-glassmorphism"
      />
    </div>
  );
}

export default TariffList;
