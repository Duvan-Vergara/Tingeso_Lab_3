import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import CustomTextField from '../CustomTextField';
import desctNumberService from '../../services/desctnumber.service';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditDesctNumber() {
  const [minpersonas, setMinpersonas] = useState('');
  const [maxpersonas, setMaxpersonas] = useState('');
  const [porcentajedesct, setPorcentajedesct] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setMinpersonas(location.state.minpersonas || '');
      setMaxpersonas(location.state.maxpersonas || '');
      setPorcentajedesct(location.state.porcentajedesct || '');
    } else if (id) {
      desctNumberService
        .getDesctNumberById(id)
        .then((desct) => {
          setMinpersonas(desct.data.minpersonas || '');
          setMaxpersonas(desct.data.maxpersonas || '');
          setPorcentajedesct(desct.data.porcentajedesct || '');
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar el descuento.' });
        });
    } else {
      setMinpersonas('');
      setMaxpersonas('');
      setPorcentajedesct('');
    }
  }, [id, location.state, showSnackbar]);

  const saveDesct = (e) => {
    e.preventDefault();

    if (
      minpersonas === '' || maxpersonas === '' || porcentajedesct === '' || Number(minpersonas) < 0
      || Number(maxpersonas) < 0 || Number(porcentajedesct) < 0
    ) {
      showSnackbar({ msg: 'Por favor, completa todos los campos correctamente.' });
      return;
    }

    const desct = {
      minpersonas: Number(minpersonas),
      maxpersonas: Number(maxpersonas),
      porcentajedesct: Number(porcentajedesct),
    };

    submitWithUndo(
      desct,
      (data) => {

        const savePromise = id
          ? desctNumberService.createDesctNumber({ ...data, id })
          : desctNumberService.createDesctNumber(data);
        savePromise
          .then(() => {
            navigate('/desctnumber/list');
          })
          .catch(() => {
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar guardar el descuento.',
            });
          });
      },
      (data) => {

        setMinpersonas(data.minpersonas || '');
        setMaxpersonas(data.maxpersonas || '');
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
          label="Mín. Personas"
          type="number"
          value={minpersonas}
          onChange={(e) => setMinpersonas(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Máx. Personas"
          type="number"
          value={maxpersonas}
          onChange={(e) => setMaxpersonas(e.target.value)}
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
          onClick={() => navigate('/desctnumber/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditDesctNumber;
