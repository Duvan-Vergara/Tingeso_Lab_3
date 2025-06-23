import { useState } from 'react';
import { useSnackbar } from './GlobalSnackbar';

function useListOperations(service, loadItems) {
  const [confirmOpen, setConfirmOpen] = useState(false);
  const [itemToDelete, setItemToDelete] = useState(null);
  const { showSnackbar } = useSnackbar();

  const handleDeleteOpen = (id) => {
    setItemToDelete(id);
    setConfirmOpen(true);
  };

  const handleCancelDelete = () => {
    setConfirmOpen(false);
    setItemToDelete(null);
  };

  const handleConfirmDelete = () => {
    service
      .deleteById(itemToDelete)
      .then(() => {
        showSnackbar({ msg: 'Elemento eliminado correctamente.' });
        loadItems();
      })
      .catch(() => {
        showSnackbar({ msg: 'Error al eliminar el elemento.' });
      });
    setConfirmOpen(false);
    setItemToDelete(null);
  };

  return {
    confirmOpen,
    handleDeleteOpen,
    handleCancelDelete,
    handleConfirmDelete,
  };
}

export default useListOperations;
