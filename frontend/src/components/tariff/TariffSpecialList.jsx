import { useEffect, useState } from 'react';
import Button from '@mui/material/Button';
import EditIcon from '@mui/icons-material/Edit';
import { useNavigate } from 'react-router-dom';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import { useSnackbar } from '../GlobalSnackbar';
import tariffSpecialService from '../../services/tariffspecial.service';
import AnimatedTitle from '../AnimatedTitle';

function TariffSpecialList() {
  const [tariff, setTariff] = useState(null);
  const { showSnackbar } = useSnackbar();

  const navigate = useNavigate();

  useEffect(() => {
    tariffSpecialService
      .getTariffSpecial()
      .then((response) => {
        setTariff(response.data);
      })
      .catch(() => {
        showSnackbar({ msg: 'Error al cargar la tarifa especial.' });
      });
  });

  const handleEdit = () => {
    navigate('/tariff/special/edit');
  };

  return (
    <TableContainer
      component={Paper}
      sx={{ backgroundColor: 'rgba(30, 30, 47, 0.9)' }}
    >
      <div style={{ textAlign: 'center', marginBottom: '1rem', paddingTop: '1rem' }}>
        <AnimatedTitle
          variant="h4"
          component="h3"
          animationType="pulse"
          sx={{
            fontSize: '1.5rem',
            color: 'var(--text-optional-color)',
          }}
        >
          Tarifa Especial
        </AnimatedTitle>
      </div>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell sx={{ color: 'var(--text-color)', fontWeight: 'bold' }}>
              Descuento Fin de Semana (%)
            </TableCell>
            <TableCell sx={{ color: 'var(--text-color)', fontWeight: 'bold' }}>
              Aumento Festivo (%)
            </TableCell>
            <TableCell
              align="center"
              sx={{ color: 'var(--text-color)', fontWeight: 'bold' }}
            >
              Operaciones
            </TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {tariff && (
            <TableRow
              className="hover-highlight"
              sx={{
                cursor: 'pointer',
                transition: 'all 0.3s ease',
                '&:hover': {
                  transform: 'translateX(4px)',
                  backgroundColor: 'rgba(76, 175, 80, 0.1)',
                  boxShadow: '0 4px 12px rgba(76, 175, 80, 0.3)',
                  '& .MuiTableCell-root': {
                    color: '#4CAF50',
                    fontWeight: '500',
                  },
                },
              }}
            >
              <TableCell sx={{ color: 'var(--text-color)', transition: 'all 0.3s ease' }}>
                {tariff.weekendDiscountPercentage}
              </TableCell>
              <TableCell sx={{ color: 'var(--text-color)', transition: 'all 0.3s ease' }}>
                {tariff.holidayIncreasePercentage}
              </TableCell>
              <TableCell align="center">
                <Button
                  variant="contained"
                  sx={{
                    backgroundColor: 'var(--primary-color)',
                    color: 'var(--text-color)',
                    '&:hover': { backgroundColor: 'var(--hover-color)' },
                  }}
                  size="small"
                  onClick={handleEdit}
                  startIcon={<EditIcon />}
                >
                  Editar
                </Button>
              </TableCell>
            </TableRow>
          )}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

export default TariffSpecialList;
