import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import Button from '@mui/material/Button';
import PropTypes from 'prop-types';

function ConfirmDialog({
  open,
  title,
  message,
  onCancel,
  onConfirm,
  confirmText,
  cancelText,
}) {
  return (
    <Dialog open={open} onClose={onCancel}>
      <DialogTitle>{title}</DialogTitle>
      <DialogContent>
        <DialogContentText>
          {message}
        </DialogContentText>
      </DialogContent>
      <DialogActions>
        <Button
          onClick={onCancel}
          variant="outlined"
          sx={{
            color: 'var(--primary-color)',
            borderColor: 'var(--primary-color)',
            minWidth: '120px',
            fontSize: '1rem',
            padding: '0.5rem 1.5rem',
          }}
        >
          {cancelText}
        </Button>
        <Button
          onClick={onConfirm}
          variant="contained"
          sx={{
            backgroundColor: 'var(--primary-color)',
            color: 'var(--text-color)',
            minWidth: '120px',
            fontSize: '1rem',
            padding: '0.5rem 1.5rem',
            '&:hover': { backgroundColor: 'var(--hover-color)' },
          }}
        >
          {confirmText}
        </Button>
      </DialogActions>
    </Dialog>
  );
}

ConfirmDialog.propTypes = {
  open: PropTypes.bool.isRequired,
  title: PropTypes.string,
  message: PropTypes.string,
  onCancel: PropTypes.func.isRequired,
  onConfirm: PropTypes.func.isRequired,
  confirmText: PropTypes.string,
  cancelText: PropTypes.string,
};

ConfirmDialog.defaultProps = {
  title: 'Confimar Accion',
  message: 'Está seguro de que desea continuar?',
  confirmText: 'Confirmar',
  cancelText: 'Cancelar',
};

export default ConfirmDialog;
