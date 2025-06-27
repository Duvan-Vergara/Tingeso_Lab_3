import { useState } from 'react';
import { useSnackbar } from './GlobalSnackbar';
import useUndo from './useUndo';

function useListOperations(service, loadItems) {
  const [confirmOpen, setConfirmOpen] = useState(false);
  const [itemToDelete, setItemToDelete] = useState(null);
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  const handleDeleteOpen = (id) => {
    setItemToDelete(id);
    setConfirmOpen(true);
  };

  const handleCancelDelete = () => {
    setConfirmOpen(false);
    setItemToDelete(null);
  };

  const handleConfirmDelete = () => {
    submitWithUndo(
      itemToDelete,
      (id) => {
        service
          .deleteById(id)
          .then(() => {
            showSnackbar({ msg: 'Elemento eliminado correctamente.' });
            loadItems();
          })
          .catch(() => {
            showSnackbar({ msg: 'Error al eliminar el elemento.' });
          });
      },
      () => {
        showSnackbar({ msg: 'Eliminación deshecha.' });
      },
      'Elemento marcado para eliminación. Puedes deshacer en 5 segundos.',
    );
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
