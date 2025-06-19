import { createContext, useContext, useState, useRef, useMemo } from "react";
import Snackbar from "@mui/material/Snackbar";
import Alert from "@mui/material/Alert";
import IconButton from "@mui/material/IconButton";
import UndoIcon from "@mui/icons-material/Undo";
import CircularProgress from "@mui/material/CircularProgress";
import ProTypes from "prop-types";

const SnackbarContext = createContext();

export function useSnackbar() {
  return useContext(SnackbarContext);
}

export function SnackbarProvider({ children }) {
  const [open, setOpen] = useState(false);
  const [message, setMessage] = useState("");
  const [ticket, setTicket] = useState("");
  const [undoAction, setUndoAction] = useState(null);
  const [undoProgress, setUndoProgress] = useState(100);
  const timerRef = useRef();

  const showSnackbar = ({ msg, ticketId, onUndo }) => {
    setMessage(msg);
    setTicket(ticketId);
    setUndoAction(() => onUndo);
    setOpen(true);
    setUndoProgress(100);

    let progress = 100;
    timerRef.current = setInterval(() => {
      progress -= 2;
      setUndoProgress(progress);
    }, 100);

    setTimeout(() => {
      setOpen(false);
      clearInterval(timerRef.current);
    }, 5000);
  };

  const handleUndo = () => {
    setOpen(false);
    clearInterval(timerRef.current);
    if (undoAction) undoAction();
  };

  // Memoize the context value to avoid unnecessary re-renders
  const contextValue = useMemo(() => ({ showSnackbar }), [showSnackbar]);

  return (
    <SnackbarContext.Provider value={contextValue}>
      {children}
      <Snackbar open={open} anchorOrigin={{ vertical: "bottom", horizontal: "center" }}>
        <Alert
          severity="success"
          sx={{ width: "100%" }}
          action={
            <>
              <IconButton color="inherit" size="small" onClick={handleUndo}>
                <UndoIcon />
              </IconButton>
              <CircularProgress
                variant="determinate"
                value={undoProgress}
                size={24}
                sx={{ ml: 2, color: "var(--primary-color)" }}
              />
            </>
          }
        >
          {message}
        </Alert>
      </Snackbar>
    </SnackbarContext.Provider>
  );
}

SnackbarProvider.propTypes = {
  children: ProTypes.node.isRequired,
};