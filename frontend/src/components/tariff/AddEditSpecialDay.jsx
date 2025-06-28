import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import CustomTextField from '../CustomTextField';
import specialDayService from '../../services/specialday.service';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditSpecialDay() {
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setDate(location.state.date || '');
      setDescription(location.state.description || '');
    } else if (id) {
      specialDayService
        .getSpecialDayById(id)
        .then((response) => {
          const specialDay = response.data;
          setDate(specialDay.date);
          setDescription(specialDay.description);
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar el día especial.' });
        });
    } else {
      setDate('');
      setDescription('');
    }
  }, [id, location.state, showSnackbar]);

  const saveSpecialDay = (e) => {
    e.preventDefault();

    if (!date || !description) {
      showSnackbar({ msg: 'Por favor, completa todos los campos.' });
      return;
    }

    const specialDay = { date, description };

    submitWithUndo(
      specialDay,
      (data) => {
        // Guardar en backend solo si no se deshace
        const savePromise = id
          ? specialDayService.createSpecialDay({ ...data, id })
          : specialDayService.createSpecialDay(data);
        savePromise
          .then(() => {
            navigate('/specialdays/list');
          })
          .catch(() => {
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar guardar el día especial.',
            });
          });
      },
      (data) => {
        // Restaurar el formulario si se deshace
        setDate(data.date || '');
        setDescription(data.description || '');
      },
      id
        ? 'Día especial actualizado correctamente. Puedes deshacer en 5 segundos.'
        : 'Día especial creado correctamente. Puedes deshacer en 5 segundos.',
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
      onSubmit={saveSpecialDay}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        {id ? 'Editar Día Especial' : 'Nuevo Día Especial'}
      </h3>
      <FormControl fullWidth>
        <CustomTextField
          label="Fecha"
          type="date"
          value={date}
          onChange={(e) => setDate(e.target.value)}
          InputLabelProps={{ shrink: true }}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Descripción"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
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
          onClick={() => navigate('/specialdays/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditSpecialDay;
