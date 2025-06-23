import { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from 'react-router-dom';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import FormControl from '@mui/material/FormControl';
import SaveIcon from '@mui/icons-material/Save';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import userService from '../../services/user.service';
import CustomTextField from '../CustomTextField';
import { useSnackbar } from '../GlobalSnackbar';
import useUndo from '../useUndo';

function AddEditUser() {
  const [rut, setRut] = useState('');
  const [name, setName] = useState('');
  const [lastName, setLastName] = useState('');
  const [email, setEmail] = useState('');
  const [birthDate, setBirthDate] = useState('');
  const { id } = useParams();
  const navigate = useNavigate();
  const location = useLocation();
  const { showSnackbar } = useSnackbar();
  const { setPendingData } = useUndo(showSnackbar);

  // Restaura datos si viene de un undo
  useEffect(() => {
    if (location.state && location.state.undo) {
      setRut(location.state.rut || '');
      setName(location.state.name || '');
      setLastName(location.state.lastName || '');
      setEmail(location.state.email || '');
      setBirthDate(location.state.birthDate || '');
    } else if (id) {
      userService
        .getUserById(id)
        .then((user) => {
          setRut(user.data.rut);
          setName(user.data.name);
          setLastName(user.data.lastName);
          setEmail(user.data.email);
          setBirthDate(user.data.birthDate);
        })
        .catch(() => {
          showSnackbar({ msg: 'Error al cargar el usuario.', severity: 'error' });
        });
    } else {
      setRut('');
      setName('');
      setLastName('');
      setEmail('');
      setBirthDate('');
    }
  }, [id, location.state, showSnackbar]);

  const saveUser = (e) => {
    e.preventDefault();

    if (!rut || !name || !lastName || !email || !birthDate) {
      showSnackbar({ msg: 'Por favor, completa todos los campos.', severity: 'warning' });
      return;
    }

    const user = {
      rut,
      name,
      lastName,
      email,
      birthDate,
    };
    setPendingData(user);

    if (id) {
      userService
        .saveUser({ ...user, id })
        .then(() => {
          navigate('/user/list', {
            state: {
              undoData: { ...user, id },
              undoMsg: 'Usuario actualizado correctamente. Puedes deshacer en 5 segundos.',
              undoPath: `/user/edit/${id}`,
            },
          });
        })
        .catch(() => {
          showSnackbar({
            msg: 'Ha ocurrido un error al intentar actualizar el usuario.',
            severity: 'error',
          });
        });
    } else {
      userService
        .saveUser(user)
        .then(() => {
          navigate('/user/list', {
            state: {
              undoData: user,
              undoMsg: 'Usuario creado correctamente. Puedes deshacer en 5 segundos.',
              undoPath: '/user/add',
            },
          });
        })
        .catch(() => {
          showSnackbar({
            msg: 'Ha ocurrido un error al intentar crear el usuario.',
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
      onSubmit={saveUser}
    >
      <h3 style={{ color: 'var(--text-optional-color)' }}>
        {' '}
        {id ? 'Editar Usuario' : 'Nueva Usuario'}
        {' '}
      </h3>
      <hr />
      <FormControl fullWidth>
        <CustomTextField
          id="rut"
          label="Rut"
          value={rut}
          onChange={(e) => setRut(e.target.value)}
          helperText="Ej. 12.587.698-8"
          InputLabelProps={{ style: { color: 'var(--text-optional-color)' } }}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="name"
          label="Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          InputLabelProps={{ style: { color: 'var(--text-optional-color)' } }}
        />
      </FormControl>
      <FormControl fullWidth>
        <CustomTextField
          id="lastName"
          label="LastName"
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
          InputLabelProps={{ style: { color: 'var(--text-optional-color)' } }}
        />
      </FormControl>

      <FormControl fullWidth>
        <CustomTextField
          id="email"
          label="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          helperText="Ej. example@gmail.com"
          InputLabelProps={{ style: { color: 'var(--text-optional-color)' } }}
        />
      </FormControl>

      <FormControl fullWidth>
        <CustomTextField
          id="birthDate"
          label="BirthDate"
          type="date"
          value={birthDate}
          onChange={(e) => {
            setBirthDate(e.target.value);
          }}
          InputLabelProps={{ shrink: true }}
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
          onClick={() => navigate('/user/list')}
          startIcon={<ArrowBackIcon />}
        >
          Volver
        </Button>
      </FormControl>
    </Box>
  );
}

export default AddEditUser;
