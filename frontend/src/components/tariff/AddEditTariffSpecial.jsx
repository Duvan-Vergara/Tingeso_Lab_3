import { useState, useEffect } from 'react';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import FormControl from '@mui/material/FormControl';
import { useNavigate, useLocation } from 'react-router-dom';
import CustomTextField from '../CustomTextField';
import tariffSpecialService from '../../services/tariffspecial.service';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditTariffSpecial() {
  const [weekendDiscountPercentage, setWeekendDiscountPercentage] = useState('');
  const [holidayIncreasePercentage, setHolidayIncreasePercentage] = useState('');
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  useEffect(() => {
    if (location.state && location.state.undo) {
      setWeekendDiscountPercentage(location.state.weekendDiscountPercentage || '');
      setHolidayIncreasePercentage(location.state.holidayIncreasePercentage || '');
    } else {
      tariffSpecialService
        .getTariffSpecial()
        .then((response) => {
          const tariff = response.data;
          if (tariff) {
            setWeekendDiscountPercentage(tariff.weekendDiscountPercentage.toString());
            setHolidayIncreasePercentage(tariff.holidayIncreasePercentage.toString());
          }
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar la tarifa especial.' });
        });
    }
  }, [location.state, showSnackbar]);

  const saveTariffSpecial = (e) => {
    e.preventDefault();

    if (
      weekendDiscountPercentage === ''
      || holidayIncreasePercentage === ''
      || Number.isNaN(Number(weekendDiscountPercentage))
      || Number.isNaN(Number(holidayIncreasePercentage))
    ) {
      showSnackbar({ msg: 'Por favor, completa todos los campos correctamente.' });
      return;
    }

    const tariff = {
      weekendDiscountPercentage: Number(weekendDiscountPercentage),
      holidayIncreasePercentage: Number(holidayIncreasePercentage),
    };

    submitWithUndo(
      tariff,
      (data) => {
        // Guardar en backend solo si no se deshace
        tariffSpecialService
          .updateTariffSpecial(data)
          .then(() => {
            navigate('/tariff/special/list');
          })
          .catch(() => {
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar actualizar la tarifa especial.',
            });
          });
      },
      (data) => {
        // Restaurar el formulario si se deshace
        setWeekendDiscountPercentage(data.weekendDiscountPercentage.toString());
        setHolidayIncreasePercentage(data.holidayIncreasePercentage.toString());
      },
      'Tarifa especial actualizada correctamente. Puedes deshacer en 5 segundos.',
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
      onSubmit={saveTariffSpecial}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        Editar Tarifa Especial
      </h3>
      <FormControl fullWidth>
        <CustomTextField
          label="Descuento Fin de Semana (%)"
          type="number"
          value={weekendDiscountPercentage}
          onChange={(e) => setWeekendDiscountPercentage(e.target.value)}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          label="Aumento Festivo (%)"
          type="number"
          value={holidayIncreasePercentage}
          onChange={(e) => setHolidayIncreasePercentage(e.target.value)}
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
          onClick={() => navigate('/tariff/special/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditTariffSpecial;
