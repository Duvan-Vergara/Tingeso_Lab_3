import { useState, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import CustomTextField from '../CustomTextField';
import desctFrecService from '../../services/desctfrec.service';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditDesctFrec() {
  const location = useLocation();
  const navigate = useNavigate();
  const editing = location.state !== null;

  const [minveces, setMinveces] = useState('');
  const [maxveces, setMaxveces] = useState('');
  const [porcentajedesct, setPorcentajedesct] = useState('');
  const { showSnackbar } = useSnackbar();
  const { setPendingData } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setMinveces(location.state.minveces || '');
      setMaxveces(location.state.maxveces || '');
      setPorcentajedesct(location.state.porcentajedesct || '');
    } else if (editing) {
      setMinveces(location.state.minveces || '');
      setMaxveces(location.state.maxveces || '');
      setPorcentajedesct(location.state.porcentajedesct || '');
    } else {
      setMinveces('');
      setMaxveces('');
      setPorcentajedesct('');
    }
  }, [editing, location.state]);

  const saveDesct = (e) => {
    e.preventDefault();
    // Validación de campos
    if (
      minveces === '' || maxveces === '' || porcentajedesct === '' || Number(minveces) < 0
      || Number(maxveces) < 0 || Number(porcentajedesct) < 0
    ) {
      showSnackbar({ msg: 'Por favor, completa todos los campos correctamente.', severity: 'warning' });
      return;
    }
    const desct = {
      minveces: Number(minveces),
      maxveces: Number(maxveces),
      porcentajedesct: Number(porcentajedesct),
    };
    setPendingData(desct);
    if (editing) {
      desctFrecService
        .createDesctFrecu({ ...desct, id: location.state.id })
        .then(() => {
          navigate('/desctfrec/list', {
            state: {
              undoData: { ...desct, id: location.state.id },
              undoMsg: 'Descuento actualizado correctamente. Puedes deshacer en 5 segundos.',
              undoPath: `/desctfrec/edit/${location.state.id}`,
            },
          });
        })
        .catch(() => {
          showSnackbar({
            msg: 'Ha ocurrido un error al intentar actualizar el descuento.',
            severity: 'error',
          });
        });
    } else {
      desctFrecService
        .createDesctFrecu(desct)
        .then(() => {
          navigate('/desctfrec/list', {
            state: {
              undoData: desct,
              undoMsg: 'Descuento creado correctamente. Puedes deshacer en 5 segundos.',
              undoPath: '/desctfrec/add',
            },
          });
        })
        .catch(() => {
          showSnackbar({
            msg: 'Ha ocurrido un error al intentar crear el descuento.',
            severity: 'error',
          });
        });
    }
  };

  return (
    <Box
      display="flex"
      flexDirection="column"
      alignItems="center"
      justifyContent="center"
      component="form"
      sx={{
        backgroundColor: 'var(--optional-color)',
        padding: '2rem',
        borderRadius: '12px',
        boxShadow: '0 4px 8px rgba(90, 26, 26, 0.5)',
        maxWidth: '600px',
        margin: '2rem auto',
        border: '1px solid var(--secondary-color)',
      }}
      onSubmit={saveDesct}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        {editing ? 'Editar Descuento' : 'Nuevo Descuento'}
      </h3>
      <FormControl fullWidth>
        <CustomTextField
          label="Mín. Veces"
          type="number"
          value={minveces}
          onChange={(e) => setMinveces(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Máx. Veces"
          type="number"
          value={maxveces}
          onChange={(e) => setMaxveces(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Porcentaje Descuento (%)"
          type="number"
          value={porcentajedesct}
          onChange={(e) => setPorcentajedesct(e.target.value)}
        />
      </FormControl>
      <FormControl>
        <Button
          variant="contained"
          sx={{
            backgroundColor: 'var(--primary-color)',
            color: 'var(--text-color)',
            '&:hover': { backgroundColor: 'var(--accent-color)' },
          }}
          type="submit"
          startIcon={<SaveIcon />}
          style={{ marginBottom: '0.5rem' }}
        >
          Guardar
        </Button>
        <Button
          variant="contained"
          sx={{
            backgroundColor: 'var(--secondary-color)',
            color: 'var(--text-color)',
            '&:hover': { backgroundColor: 'var(--accent-color)' },
          }}
          onClick={() => navigate('/desctfrec/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditDesctFrec;
