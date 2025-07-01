import { useState } from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import CustomTextField from '../CustomTextField';
import CardLayout from '../CardLayout';
import LoadingState from '../LoadingState';
import { useAsyncLoading } from '../LoadingBar';
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
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const { executeWithLoading } = useAsyncLoading();

  const handleConsultar = async (e) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);

    executeWithLoading(async () => {
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
      } finally {
        setIsLoading(false);
      }
    });
  };

  return (
    <CardLayout
      title="Rack Semanal de Reservas"
      className="rack-container"
    >
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
          disabled={isLoading}
          style={{ minWidth: 120 }}
        >
          {isLoading ? 'Consultando...' : 'Consultar'}
        </button>
      </form>
      {error && (
        <div style={{ color: 'var(--accent-color)', textAlign: 'center', marginBottom: '1rem' }}>
          {error}
        </div>
      )}

      {isLoading ? (
        <LoadingState message="Consultando rack semanal..." />
      ) : (
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
                {rack.map((reservas, idx) => (
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
                ))}
              </TableRow>
            </TableBody>
          </Table>
        </TableContainer>
      )}
    </CardLayout>
  );
}

export default Rack;
