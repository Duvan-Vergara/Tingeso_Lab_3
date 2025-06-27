import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import CustomTextField from '../CustomTextField';
import specialDayService from '../../services/specialday.service';
import { useSnackbar } from '../GlobalSnackbar';

function AddEditSpecialDay() {
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const { showSnackbar } = useSnackbar();

  useEffect(() => {
    if (id) {
      specialDayService
        .getSpecialDayById(id)
        .then((response) => {
          const specialDay = response.data;
          setDate(specialDay.date);
          setDescription(specialDay.description);
        })
        .catch(() => {
          setError('Error al cargar el día especial.');
          showSnackbar({ msg: 'Error al cargar el día especial.', severity: 'error' });
        });
    }
  }, [id, showSnackbar]);

  const saveSpecialDay = (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    // Validación
    if (!date || !description) {
      setError('Por favor, completa todos los campos.');
      showSnackbar({ msg: 'Por favor, completa todos los campos.', severity: 'warning' });
      return;
    }

    const specialDay = { date, description };

    const onSuccess = (msg) => {
      setSuccess(msg);
      showSnackbar({ msg, severity: 'success' });
      setTimeout(() => navigate('/specialdays/list'), 800);
    };
    const onError = (msg) => {
      setError(msg);
      showSnackbar({ msg, severity: 'error' });
    };

    if (id) {
      specialDayService
        .createSpecialDay({ ...specialDay, id })
        .then(() => onSuccess('Día especial actualizado correctamente.'))
        .catch(() => onError('Error al actualizar el día especial.'));
    } else {
      specialDayService
        .createSpecialDay(specialDay)
        .then(() => onSuccess('Día especial creado correctamente.'))
        .catch(() => onError('Error al crear el día especial.'));
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
      {(error || success) && (
        <div
          style={{
            color: error ? 'var(--accent-color)' : 'var(--text-optional-color)',
            marginBottom: '1rem',
            fontWeight: 'bold',
          }}
        >
          {error || success}
        </div>
      )}
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
