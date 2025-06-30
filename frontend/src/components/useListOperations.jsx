import { useState } from 'react';
import { useSnackbar } from './GlobalSnackbar';
import { useAsyncLoading } from './LoadingBar';
import useUndo from './useUndo';

function useListOperations(service, loadItems) {
  const [confirmOpen, setConfirmOpen] = useState(false);
  const [itemToDelete, setItemToDelete] = useState(null);
  const { showSnackbar } = useSnackbar();
  const { executeWithLoading } = useAsyncLoading();
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
        executeWithLoading(async () => {
          try {
            await service.deleteById(id);
            showSnackbar({ msg: 'Elemento eliminado correctamente.' });
            loadItems();
          } catch (error) {
            showSnackbar({ msg: 'Error al eliminar el elemento.' });
          }
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
