import { useRef, useEffect } from 'react';

const useUndo = (showSnackbar) => {
  const undoTimeoutRef = useRef(null);
  const pendingDataRef = useRef(null);

  const submitWithUndo = (
    data,
    onSave,
    onRestore,
    msg = 'Acción realizada correctamente. Puedes deshacer en 5 segundos.',
    timeout = 5000,
  ) => {
    pendingDataRef.current = data;
    undoTimeoutRef.current = setTimeout(() => {
      onSave(data);
      pendingDataRef.current = null;
    }, timeout);

    showSnackbar({
      msg,
      onUndo: () => {
        clearTimeout(undoTimeoutRef.current);
        if (pendingDataRef.current) {
          onRestore(pendingDataRef.current);
          pendingDataRef.current = null;
        }
      },
    });
  };

  useEffect(() => () => clearTimeout(undoTimeoutRef.current), []);

  return { submitWithUndo };
};

export default useUndo;
