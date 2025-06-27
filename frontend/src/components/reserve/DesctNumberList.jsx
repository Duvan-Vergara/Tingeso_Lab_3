import { useEffect, useState, useCallback } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import desctNumberService from '../../services/desctnumber.service';
import { useSnackbar } from '../GlobalSnackbar';
import GenericList from '../GenericList';

function DesctNumberList() {
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
    const desct = descts.find((d) => d.id === id);
    navigate('/desctnumber/edit', { state: desct });
  };

  const handleDelete = async (id) => {
    try {
      await desctNumberService.deleteDesctNumber(id);
      setDescts(descts.filter((desct) => desct.id !== id));
      showSnackbar({ msg: 'Descuento eliminado correctamente.' });
    } catch (error) {
      showSnackbar({ msg: 'Error al eliminar el descuento.' });
    }
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

export default DesctNumberList;
