import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import CustomTextField from '../CustomTextField';
import tariffService from '../../services/tariff.service';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditTariff() {
  const [laps, setLaps] = useState('');
  const [maxMinutes, setMaxMinutes] = useState('');
  const [regularPrice, setRegularPrice] = useState('');
  const [totalDuration, setTotalDuration] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setLaps(location.state.laps || '');
      setMaxMinutes(location.state.max_minutes || '');
      setRegularPrice(location.state.regular_price || '');
      setTotalDuration(location.state.total_duration || '');
    } else if (id) {
      tariffService
        .getTariffById(id)
        .then((response) => {
          const tariff = response.data;
          setLaps(tariff.laps.toString());
          setMaxMinutes(tariff.max_minutes.toString());
          setRegularPrice(tariff.regular_price.toString());
          setTotalDuration(tariff.total_duration.toString());
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar la tarifa.' });
        });
    } else {
      setLaps('');
      setMaxMinutes('');
      setRegularPrice('');
      setTotalDuration('');
    }
  }, [id, location.state, showSnackbar]);

  const saveTariff = (e) => {
    e.preventDefault();

    if (
      !laps
      || !maxMinutes
      || !regularPrice
      || !totalDuration
      || Number.isNaN(Number(laps))
      || Number.isNaN(Number(maxMinutes))
      || Number.isNaN(Number(regularPrice))
      || Number.isNaN(Number(totalDuration))
      || Number(laps) <= 0
      || Number(maxMinutes) <= 0
      || Number(regularPrice) < 0
      || Number(totalDuration) < 0
    ) {
      showSnackbar({ msg: 'Por favor, completa todos los campos correctamente.' });
      return;
    }

    const tariff = {
      laps: Number(laps),
      max_minutes: Number(maxMinutes),
      regular_price: Number(regularPrice),
      total_duration: Number(totalDuration),
    };

    submitWithUndo(
      tariff,
      (data) => {
        // Guardar en backend solo si no se deshace
        const savePromise = id
          ? tariffService.saveTariff({ ...data, id })
          : tariffService.saveTariff(data);
        savePromise
          .then(() => {
            navigate('/tariff/list');
          })
          .catch(() => {
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar guardar la tarifa.',
            });
          });
      },
      (data) => {
        // Restaurar el formulario si se deshace
        setLaps(data.laps.toString());
        setMaxMinutes(data.max_minutes.toString());
        setRegularPrice(data.regular_price.toString());
        setTotalDuration(data.total_duration.toString());
      },
      id
        ? 'Tarifa actualizada correctamente. Puedes deshacer en 5 segundos.'
        : 'Tarifa creada correctamente. Puedes deshacer en 5 segundos.',
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
      onSubmit={saveTariff}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        {id ? 'Editar Tarifa' : 'Nueva Tarifa'}
      </h3>
      <FormControl fullWidth>
        <CustomTextField
          label="Vueltas"
          type="number"
          value={laps}
          onChange={(e) => setLaps(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Máx. Minutos"
          type="number"
          value={maxMinutes}
          onChange={(e) => setMaxMinutes(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Precio Regular"
          type="number"
          value={regularPrice}
          onChange={(e) => setRegularPrice(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Duración Total (minutos)"
          type="number"
          value={totalDuration}
          onChange={(e) => setTotalDuration(e.target.value)}
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
          onClick={() => navigate('/tariff/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditTariff;
