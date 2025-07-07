import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
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
  const [minveces, setMinveces] = useState('');
  const [maxveces, setMaxveces] = useState('');
  const [porcentajedesct, setPorcentajedesct] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setMinveces(location.state.minveces || '');
      setMaxveces(location.state.maxveces || '');
      setPorcentajedesct(location.state.porcentajedesct || '');
    } else if (id) {
      desctFrecService
        .getDesctFrecById(id)
        .then((desct) => {
          setMinveces(desct.data.minveces || '');
          setMaxveces(desct.data.maxveces || '');
          setPorcentajedesct(desct.data.porcentajedesct || '');
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar el descuento.' });
        });
    } else {
      setMinveces('');
      setMaxveces('');
      setPorcentajedesct('');
    }
  }, [id, location.state, showSnackbar]);

  const saveDesct = (e) => {
    e.preventDefault();

    if (
      minveces === '' || maxveces === '' || porcentajedesct === '' || Number(minveces) < 0
      || Number(maxveces) < 0 || Number(porcentajedesct) < 0
    ) {
      showSnackbar({ msg: 'Por favor, completa todos los campos correctamente.' });
      return;
    }

    const desct = {
      minveces: Number(minveces),
      maxveces: Number(maxveces),
      porcentajedesct: Number(porcentajedesct),
    };

    submitWithUndo(
      desct,
      (data) => {

        const savePromise = id
          ? desctFrecService.createDesctFrecu({ ...data, id })
          : desctFrecService.createDesctFrecu(data);
        savePromise
          .then(() => {
            navigate('/desctfrec/list');
          })
          .catch(() => {
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar guardar el descuento.',
            });
          });
      },
      (data) => {

        setMinveces(data.minveces || '');
        setMaxveces(data.maxveces || '');
        setPorcentajedesct(data.porcentajedesct || '');
      },
      id
        ? 'Descuento actualizado correctamente. Puedes deshacer en 5 segundos.'
        : 'Descuento creado correctamente. Puedes deshacer en 5 segundos.',
    );
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
        {id ? 'Editar Descuento' : 'Nuevo Descuento'}
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
