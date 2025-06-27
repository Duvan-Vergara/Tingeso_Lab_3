import { useState } from 'react';
import Box from '@mui/material/Box';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import CustomTextField from '../CustomTextField';
import axios from '../../http-common';

const diasSemana = [
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes',
  'Sábado',
  'Domingo',
];

function Rack() {
  const [anio, setAnio] = useState(new Date().getFullYear());
  const [mes, setMes] = useState(new Date().getMonth() + 1);
  const [dia, setDia] = useState(new Date().getDate());
  const [rack, setRack] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleConsultar = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError('');
    try {
      const response = await axios.post('/api/racksemanal/obtener', {
        anio,
        mes,
        dia,
      });
      setRack(response.data);
    } catch (err) {
      setRack([]);
      setError('Error al consultar el rack semanal. Intenta nuevamente.');
    }
    setLoading(false);
  };

  return (
    <Box
      sx={{
        maxWidth: 900,
        margin: '2rem auto',
        background: 'rgba(30,30,47,0.9)',
        borderRadius: 2,
        p: 3,
      }}
    >
      <h2 style={{ color: 'var(--text-optional-color)', textAlign: 'center' }}>
        Rack Semanal de Reservas
      </h2>
      <form
        onSubmit={handleConsultar}
        style={{
          display: 'flex',
          gap: '1rem',
          marginBottom: '1rem',
          justifyContent: 'center',
        }}
      >
        <CustomTextField
          label="Año"
          type="number"
          value={anio}
          onChange={(e) => setAnio(Number(e.target.value))}
          required
        />
        <CustomTextField
          label="Mes"
          type="number"
          value={mes}
          onChange={(e) => setMes(Number(e.target.value))}
          inputProps={{ min: 1, max: 12 }}
          required
        />
        <CustomTextField
          label="Día"
          type="number"
          value={dia}
          onChange={(e) => setDia(Number(e.target.value))}
          inputProps={{ min: 1, max: 31 }}
          required
        />
        <button
          type="submit"
          disabled={loading}
          style={{ minWidth: 120 }}
        >
          {loading ? 'Consultando...' : 'Consultar'}
        </button>
      </form>
      {error && (
        <div style={{ color: 'var(--accent-color)', textAlign: 'center', marginBottom: '1rem' }}>
          {error}
        </div>
      )}
      <TableContainer
        component={Paper}
        sx={{ boxShadow: 3, backgroundColor: 'var(--background-color)' }}
      >
        <Table>
          <TableHead>
            <TableRow>
              {diasSemana.map((nombreDia) => (
                <TableCell
                  key={nombreDia}
                  sx={{
                    color: 'var(--primary-color)',
                    fontWeight: 'bold',
                    textAlign: 'center',
                    backgroundColor: 'var(--optional-color)',
                  }}
                >
                  {nombreDia}
                </TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            <TableRow>
              {loading ? (
                diasSemana.map((nombreDia) => (
                  <TableCell key={nombreDia} sx={{ textAlign: 'center', color: '#888' }}>
                    <span style={{ color: 'var(--accent-color)' }}>Cargando...</span>
                  </TableCell>
                ))
              ) : (
                rack.map((reservas, idx) => (
                  <TableCell
                    key={diasSemana[idx] || `col-${idx}`}
                    sx={{
                      textAlign: 'center',
                      color: reservas.length > 0 ? 'var(--text-color)' : '#888',
                      backgroundColor:
                        reservas.length > 0
                          ? 'var(--secondary-color)'
                          : 'transparent',
                    }}
                  >
                    {reservas.length > 0
                      ? reservas.map((r, i) => (
                        <div
                          key={typeof r === 'string' ? r : `${diasSemana[idx] || idx}-${i}`}
                          style={{ margin: '0.5rem 0' }}
                        >
                          {r}
                        </div>
                      ))
                      : 'Sin reservas'}
                  </TableCell>
                ))
              )}
            </TableRow>
          </TableBody>
        </Table>
      </TableContainer>
    </Box>
  );
}

export default Rack;
