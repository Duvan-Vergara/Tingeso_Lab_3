import { useState, useEffect, useCallback } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import FormControl from '@mui/material/FormControl';
import MenuItem from '@mui/material/MenuItem';
import TextField from '@mui/material/TextField';
import SaveIcon from '@mui/icons-material/Save';
import Autocomplete from '@mui/material/Autocomplete';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import userService from '../../services/user.service';
import tariffService from '../../services/tariff.service';
import reserveService from '../../services/reserve.service';
import CustomTextField from '../CustomTextField';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';
import './AddEditReserve.css';

function AddEditReserve() {
  const [clientName, setClientName] = useState('');
  const [reserveDay, setReserveDay] = useState('');
  const [tariffId, setTariffId] = useState('');
  const [tariffs, setTariffs] = useState([]);
  const [finalPrice, setFinalPrice] = useState(0.0);
  const [users, setUsers] = useState([]);
  const [selectedUsers, setSelectedUsers] = useState([]);
  const [beginTime, setBeginTime] = useState('');
  const [finish, setFinishTime] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { submitWithUndo } = useUndo(showSnackbar);

  const loadUsers = useCallback(() => {
    console.log('Cargando usuarios...');
    userService
      .getAllUsers()
      .then((response) => {
        console.log('Usuarios cargados:', response.data);
        setUsers(response.data);
      })
      .catch((error) => {
        console.error('Error cargando usuarios:', error);
        showSnackbar({
          msg: 'Error al cargar usuarios.',
          severity: 'error',
        });
      });
  }, [showSnackbar]);

  const loadTariffs = useCallback(() => {
    console.log('Cargando tarifas...');
    tariffService
      .getAllTariffs()
      .then((response) => {
        console.log('Tarifas cargadas:', response.data);
        setTariffs(response.data);
      })
      .catch((error) => {
        console.error('Error cargando tarifas:', error);
        showSnackbar({
          msg: 'Error al cargar tarifas.',
          severity: 'error',
        });
      });
  }, [showSnackbar]);

  useEffect(() => {
    loadTariffs();
    loadUsers();

    if (location.state && location.state.undo) {
      setClientName(location.state.clientName || '');
      setReserveDay(location.state.reserveDay || '');
      setTariffId(location.state.tariffId || '');
      setFinalPrice(location.state.finalPrice || 0.0);
      setSelectedUsers(location.state.selectedUsers || []);
      setBeginTime(location.state.beginTime || '');
      setFinishTime(location.state.finish || '');
    } else if (id) {
      console.log('Cargando reserva existente con ID:', id);
      reserveService
        .getReserveById(id)
        .then((response) => {
          console.log('Reserva cargada desde backend:', response.data);
          const reserve = response.data;
          setClientName(''); // No hay clientName en el backend
          setReserveDay(reserve.reserveday || '');
          setTariffId(reserve.tariffId || '');
          setFinalPrice(reserve.finalPrice || 0.0);
          setSelectedUsers(Array.from(reserve.reservesUsers || [])); // Convertir Set a Array
          setBeginTime(reserve.begin || '');
          setFinishTime(reserve.finish || '');
        })
        .catch((error) => {
          console.error('Error cargando reserva:', error);
          showSnackbar({
            msg: 'Error al cargar la reserva.',
            severity: 'error',
          });
        });
    } else {
      setClientName('');
      setReserveDay('');
      setTariffId('');
      setFinalPrice(0.0);
      setSelectedUsers([]);
      setBeginTime('');
      setFinishTime('');
    }
  }, [id, location.state, showSnackbar, loadTariffs, loadUsers]);

  const saveReserve = (e) => {
    e.preventDefault();

    if (
      !clientName
      || !reserveDay
      || !tariffId
      || !beginTime
      || !finish
      || selectedUsers.length === 0
    ) {
      showSnackbar({
        msg: 'Por favor, completa todos los campos.',
        severity: 'warning',
      });
      return;
    }

    const formData = {
      clientName,
      reserveDay,
      tariffId,
      finalPrice,
      selectedUsers,
      beginTime,
      finish,
    };

    submitWithUndo(
      formData,
      (data) => {
        // Construir el objeto con los nombres de campos exactos que espera el backend
        const reserveData = {
          reserveday: data.reserveDay,
          begin: data.beginTime,
          finish: data.finish,
          reservesUsers: data.selectedUsers, // Enviar objetos completos
          tariffId: parseInt(data.tariffId),
          finalPrice: data.finalPrice,
        };

        console.log('Datos a enviar al backend:', reserveData);
        console.log('Es actualización?', !!id);

        const savePromise = id
          ? reserveService.updateReserve(id, reserveData)
          : reserveService.createReserve(reserveData);

        savePromise
          .then((response) => {
            console.log('Respuesta del servidor:', response.data);
            navigate('/reserve/list');
          })
          .catch((error) => {
            console.error('Error saving reserve:', error);
            console.error('Error response:', error.response?.data);
            console.error('Error status:', error.response?.status);
            showSnackbar({
              msg: 'Ha ocurrido un error al intentar guardar la reserva.',
              severity: 'error',
            });
          });
      },
      (data) => {

        setClientName(data.clientName || '');
        setReserveDay(data.reserveDay || '');
        setTariffId(data.tariffId || '');
        setFinalPrice(data.finalPrice || 0.0);
        setSelectedUsers(data.selectedUsers || []);
        setBeginTime(data.beginTime || '');
        setFinishTime(data.finish || '');
      },
      id
        ? 'Reserva actualizada correctamente. Puedes deshacer en 5 segundos.'
        : 'Reserva creada correctamente. Puedes deshacer en 5 segundos.',
    );
  };

  const recalculatePrice = useCallback(() => {
    if (
      !tariffId
      || selectedUsers.length === 0
      || !reserveDay
      || !beginTime
      || !finish
    ) {
      setFinalPrice(0);
      return;
    }
    
    // Construir el objeto reserve con la estructura que espera el backend
    const reserve = {
      reserveday: reserveDay, // Formato YYYY-MM-DD
      begin: beginTime, // Formato HH:MM
      finish: finish, // Formato HH:MM
      reservesUsers: selectedUsers, // Enviar los objetos completos de usuarios
      tariffId: parseInt(tariffId), // Asegurar que sea un número
    };
    
    console.log('Datos enviados para calcular precio:', reserve);
    
    reserveService
      .calculateFinalPrice(reserve)
      .then((response) => {
        console.log('Precio calculado:', response.data);
        setFinalPrice(response.data);
      })
      .catch((error) => {
        console.error('Error calculating price:', error);
        console.error('Error response:', error.response?.data);
        showSnackbar({
          msg: 'Error al calcular el precio final.',
          severity: 'error',
        });
        setFinalPrice(0);
      });
  }, [tariffId, selectedUsers, reserveDay, beginTime, finish, showSnackbar]);

  useEffect(() => {
    recalculatePrice();
  }, [reserveDay, beginTime, finish, tariffId, selectedUsers, recalculatePrice]);

  useEffect(() => {
    if (selectedUsers.length === 0) {
      setClientName('');
    } else {
      const stillInGroup = selectedUsers.some((u) => u.name === clientName);
      if (!stillInGroup) {
        setClientName(selectedUsers[0].name);
      }
    }
  }, [selectedUsers, clientName]);

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
      onSubmit={saveReserve}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        {' '}
        {id ? 'Editar Reserva' : 'Nueva Reserva'}
      </h3>
      <FormControl fullWidth>
        <CustomTextField
          select
          id="clientName"
          label="Nombre del Cliente"
          value={clientName}
          onChange={(e) => setClientName(e.target.value)}
          required
          disabled={selectedUsers.length === 0}
          helperText={
            selectedUsers.length === 0
              ? 'Agrega al menos un usuario al grupo'
              : ''
          }
          FormHelperTextProps={{
            style: { color: 'var(--text-optional-color)' },
          }}
        >
          {selectedUsers.map((user) => (
            <MenuItem key={user.id} value={user.name}>
              {`${user.name} - ${user.rut}`}
            </MenuItem>
          ))}
        </CustomTextField>
      </FormControl>

      <FormControl fullWidth>
        <CustomTextField
          id="reserveday"
          label="Fecha"
          type="date"
          value={reserveDay}
          onChange={(e) => {
            setReserveDay(e.target.value);
          }}
          InputLabelProps={{
            shrink: true,
          }}
          required
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="begin"
          label="Hora de Inicio"
          type="time"
          value={beginTime}
          onChange={(e) => setBeginTime(e.target.value)}
          InputLabelProps={{
            shrink: true,
          }}
          required
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="finish"
          label="Hora de Finalización"
          type="time"
          value={finish}
          onChange={(e) => setFinishTime(e.target.value)}
          InputLabelProps={{
            shrink: true,
          }}
          required
        />
      </FormControl>

      <FormControl fullWidth>
        <Autocomplete
          id="reserves_users"
          multiple
          options={users}
          getOptionLabel={(user) => `${user.name} - ${user.rut}`}
          filterOptions={(options, { inputValue }) => options.filter(
            (user) => user.name.toLowerCase().includes(inputValue.toLowerCase())
                || user.rut.includes(inputValue),
          )}
          value={selectedUsers}
          onChange={(event, newValue) => setSelectedUsers(newValue)}
          isOptionEqualToValue={(option, value) => option.id === value.id}
          renderInput={(params) => (
            <TextField
              {...params}
              label="Seleccionar Usuarios"
              variant="standard"
              fullWidth
              margin="normal"
              sx={{
                '& .MuiInputBase-root': {
                  backgroundColor: 'var(--optional-color)',
                  color: 'var(--text-optional-color)',
                  '&:hover': {
                    backgroundColor: 'rgba(255, 255, 255, 0.1)',
                  },
                },
                '& .MuiInputLabel-root': {
                  color: 'var(--text-optional-color)',
                },
                '& .MuiInput-underline:before': {
                  borderBottomColor: 'var(--text-optional-color)',
                },
                '& .MuiInput-underline:hover:before': {
                  borderBottomColor: 'var(--accent-color)',
                },
                '& .MuiInput-underline:after': {
                  borderBottomColor: 'var(--primary-color)',
                },
              }}
            />
          )}
          renderOption={(props, option) => (
            <li {...props} style={{ 
              backgroundColor: 'var(--optional-color)',
              color: 'var(--text-optional-color)',
              padding: '8px 16px',
              borderBottom: '1px solid rgba(255, 255, 255, 0.1)',
            }}>
              {`${option.name} - ${option.rut}`}
            </li>
          )}
          componentsProps={{
            paper: {
              sx: {
                backgroundColor: 'var(--optional-color)',
                color: 'var(--text-optional-color)',
                border: '1px solid var(--secondary-color)',
                borderRadius: '8px',
                boxShadow: '0 4px 8px rgba(0, 0, 0, 0.3)',
                '& .MuiAutocomplete-option': {
                  backgroundColor: 'var(--optional-color)',
                  color: 'var(--text-optional-color)',
                  '&:hover': {
                    backgroundColor: 'rgba(255, 255, 255, 0.1)',
                  },
                  '&[aria-selected="true"]': {
                    backgroundColor: 'var(--primary-color)',
                    color: 'var(--text-color)',
                  },
                },
              },
            },
          }}
          sx={{
            '& .MuiAutocomplete-tag': {
              backgroundColor: 'var(--primary-color)',
              color: 'var(--text-color)',
              '& .MuiChip-deleteIcon': {
                color: 'var(--text-color)',
                '&:hover': {
                  color: 'var(--accent-color)',
                },
              },
            },
            '& .MuiAutocomplete-popupIndicator': {
              color: 'var(--text-optional-color)',
            },
            '& .MuiAutocomplete-clearIndicator': {
              color: 'var(--text-optional-color)',
            },
          }}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="tariff"
          label="Tarifa"
          select
          value={tariffId}
          onChange={(e) => setTariffId(e.target.value)}
          required
        >
          {tariffs.map((tariff) => (
            <MenuItem key={tariff.id} value={tariff.id}>
              {`${tariff.laps} vueltas / ${tariff.maxMinutes || tariff.max_minutes || 'N/A'} minutos`}
            </MenuItem>
          ))}
        </CustomTextField>
      </FormControl>

      <FormControl fullWidth>
        <CustomTextField
          id="final_price"
          label="Precio Final"
          value={finalPrice.toLocaleString('es-CL', {
            style: 'currency',
            currency: 'CLP',
          })}
          InputProps={{
            readOnly: true,
          }}
        />
      </FormControl>

      <FormControl>
        <br />
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
          onClick={() => navigate('/reserve/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditReserve;
