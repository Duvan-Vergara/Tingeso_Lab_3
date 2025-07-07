import { useState, useEffect, useCallback } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import FormControl from '@mui/material/FormControl';
import MenuItem from '@mui/material/MenuItem';
import SaveIcon from '@mui/icons-material/Save';
import Autocomplete from '@mui/material/Autocomplete';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import userService from '../../services/user.service';
import tariffService from '../../services/tariff.service';
import reserveService from '../../services/reserve.service';
import CustomTextField from '../CustomTextField';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

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
    userService
      .getAllUsers()
      .then((response) => {
        setUsers(response.data);
      })
      .catch(() => {
        showSnackbar({
          msg: 'Error al cargar usuarios.',
          severity: 'error',
        });
      });
  }, [showSnackbar]);

  const loadTariffs = useCallback(() => {
    tariffService
      .getAllTariffs()
      .then((response) => {
        setTariffs(response.data);
      })
      .catch(() => {
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
      reserveService
        .getReserveById(id)
        .then((response) => {
          const reserve = response.data;
          setClientName(reserve.clientName || '');
          setReserveDay(reserve.reserveday || '');
          setTariffId(reserve.tariff_id || '');
          setFinalPrice(reserve.final_price || 0.0);
          setSelectedUsers(reserve.reserves_users || []);
          setBeginTime(reserve.begin || '');
          setFinishTime(reserve.finish || '');
        })
        .catch(() => {
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

        const reserveData = {
          clientName: data.clientName,
          reserveday: data.reserveDay,
          tariff_id: data.tariffId,
          final_price: data.finalPrice,
          reserves_users: data.selectedUsers.map((u) => u.id),
          begin: data.beginTime,
          finish: data.finish,
        };

        const savePromise = id
          ? reserveService.updateReserve(id, reserveData)
          : reserveService.createReserve(reserveData);

        savePromise
          .then(() => {
            navigate('/reserve/list');
          })
          .catch(() => {
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
    ) {
      setFinalPrice(0);
      return;
    }
    const reserve = {
      reserveday: reserveDay,
      begin: beginTime,
      finish,
      reserves_users: selectedUsers,
      tariff_id: tariffId,
    };
    reserveService
      .calculateFinalPrice(reserve)
      .then((response) => {
        setFinalPrice(response.data);
      })
      .catch(() => {
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
            <CustomTextField
              InputProps={params.InputProps}
              label="Seleccionar Usuarios"
              variant="standard"
            />
          )}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="tariff"
          label="Tarifa"
          select
          value={tariffId}
          onChange={(e) => setTariffId(e.target.value)}
        >
          {tariffs.map((tariff) => (
            <MenuItem key={tariff.id} value={tariff.id}>
              {`${tariff.laps} vueltas / ${tariff.max_minutes} minutos`}
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
