import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import specialDayService from '../../services/specialday.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function SpecialDayList() {
  const [specialDays, setSpecialDays] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadSpecialDays = useCallback(async () => {
    try {
      const response = await specialDayService.getAllSpecialDays();
      return response.data;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar los días especiales.' });
      return [];
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchSpecialDays = async () => {
      const daysData = await loadSpecialDays();
      setSpecialDays(daysData);
    };
    fetchSpecialDays();
  }, [loadSpecialDays]);

  const handleAddDay = () => {
    navigate('/specialdays/add');
  };

  const handleEditDay = (id) => {
    navigate(`/specialdays/edit/${id}`);
  };

  const columns = [
    { field: 'date', headerName: 'Fecha', width: 120 },
    { field: 'description', headerName: 'Descripción', width: 250 },
  ];

  return (
    <GenericList
      title="Lista de Días Especiales"
      service={specialDayService}
      data={specialDays}
      loadItems={loadSpecialDays}
      onAdd={handleAddDay}
      onEdit={handleEditDay}
      columns={columns}
      confirmTitle="¿Eliminar Día Especial?"
      confirmMessage="¿Estás seguro de que deseas eliminar este día especial?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default SpecialDayList;
