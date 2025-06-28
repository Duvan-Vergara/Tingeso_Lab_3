import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import desctNumberService from '../../services/desctnumber.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function DesctNumberList() {
  const [descts, setDescts] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadDescts = useCallback(async () => {
    try {
      const response = await desctNumberService.getAllDesctNumbers();
      return response.data;
    } catch (error) {
      showSnackbar({ msg: 'Error al cargar los descuentos.' });
      return [];
    }
  }, [showSnackbar]);

  useEffect(() => {
    const fetchDescts = async () => {
      const desctsData = await loadDescts();
      setDescts(desctsData);
    };
    fetchDescts();
  }, [loadDescts]);

  const handleAdd = () => {
    navigate('/desctnumber/add');
  };

  const handleEdit = (id) => {
    navigate(`/desctnumber/edit/${id}`);
  };

  const columns = [
    { field: 'minpersonas', headerName: 'Mín. Personas', width: 120 },
    { field: 'maxpersonas', headerName: 'Máx. Personas', width: 120 },
    { field: 'porcentajedesct', headerName: 'Porcentaje Descuento (%)', width: 180 },
  ];

  return (
    <GenericList
      title="Descuentos por Número de Personas"
      service={desctNumberService}
      data={descts}
      loadItems={loadDescts}
      onAdd={handleAdd}
      onEdit={handleEdit}
      columns={columns}
      showSnackbar={showSnackbar}
      confirmTitle="¿Eliminar Descuento?"
      confirmMessage="¿Estás seguro de que deseas eliminar este descuento?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default DesctNumberList;
