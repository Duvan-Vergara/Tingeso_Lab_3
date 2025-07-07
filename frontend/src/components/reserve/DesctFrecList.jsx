import { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import desctFrecService from '../../services/desctfrec.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function DesctFrecList() {
  const [descts, setDescts] = useState([]);
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  const loadDescts = useCallback(async () => {
    try {
      const response = await desctFrecService.getAllDesctFrecu();
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
    navigate('/desctfrec/add');
  };

  const handleEdit = (id) => {
    navigate(`/desctfrec/edit/${id}`);
  };

  const columns = [
    { field: 'minveces', headerName: 'Mín. veces', width: 120 },
    { field: 'maxveces', headerName: 'Máx. veces', width: 120 },
    { field: 'porcentajedesct', headerName: 'Porcentaje Descuento (%)', width: 180 },
  ];

  return (
    <GenericList
      title="Descuentos por Frecuencia"
      service={desctFrecService}
      data={descts}
      loadItems={loadDescts}
      onAdd={handleAdd}
      onEdit={handleEdit}
      columns={columns}
      confirmTitle="¿Eliminar Descuento?"
      confirmMessage="¿Estás seguro de que deseas eliminar este descuento?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default DesctFrecList;
