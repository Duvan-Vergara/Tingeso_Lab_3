import { useEffect, useState, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import desctFrecService from '../../services/desctfrec.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function DesctFrecList() {
  const [descts, setDescts] = useState([]);
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
    const desct = descts.find((d) => d.id === id);
    navigate('/desctfrec/edit', { state: desct });
  };

  const handleDelete = async (id) => {
    try {
      await desctFrecService.deleteDesctFrec(id);
      setDescts(descts.filter((desct) => desct.id !== id));
      showSnackbar({ msg: 'Descuento eliminado correctamente.' });
    } catch (error) {
      showSnackbar({ msg: 'Error al eliminar el descuento.' });
    }
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
      onDelete={handleDelete}
      columns={columns}
      showSnackbar={showSnackbar}
      confirmTitle="¿Eliminar Descuento?"
      confirmMessage="¿Estás seguro de que deseas eliminar este descuento?"
      confirmText="Eliminar"
      cancelText="Cancelar"
    />
  );
}

export default DesctFrecList;
