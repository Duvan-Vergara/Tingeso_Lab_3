import { useRef } from "react";

export const useUndo = (showSnackbar) => {
  const pendingDataRef = useRef(null);
  const undoTimeoutRef = useRef(null);

  const setPendingData = (data) => {
    pendingDataRef.current = data;
  };

  const handleUndo = (restoreCallback) => {
    clearTimeout(undoTimeoutRef.current);
    if (pendingDataRef.current) {
      restoreCallback(pendingDataRef.current);
    }
  };

  const startUndoTimer = (onSave, restoreCallback, msg= "Accion realizada correctamente. Puedes deshacer en 5 segundos." ,timeout = 5000) => {
    undoTimeoutRef.current = setTimeout(() => {
      onSave();
    }, timeout);

    showSnackbar({
      msg,
      onUndo: () => handleUndo(restoreCallback),
    });
  };

  return { setPendingData, startUndoTimer };
};