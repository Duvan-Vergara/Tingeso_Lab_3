import { useState } from 'react';
import Button from '@mui/material/Button';
import Menu from '@mui/material/Menu';
import MenuItem from '@mui/material/MenuItem';
import Typography from '@mui/material/Typography';
import reportService from '../../services/report.service';
import { useAsyncLoading, useLoading } from '../LoadingBar';

function ReportGenerator() {
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [anchorElStart, setAnchorElStart] = useState(null);
  const [anchorElEnd, setAnchorElEnd] = useState(null);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const { executeWithLoading } = useAsyncLoading();
  const { isLoading } = useLoading();

  const months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  const years = Array.from(
    { length: 10 },
    (_, i) => new Date().getFullYear() - i,
  );

  const handleGenerateTariffReport = async () => {
    setError('');
    setSuccess('');
    if (!startDate || !endDate) {
      setError('Por favor, seleccione las fechas de inicio y fin.');
      return;
    }
    if (new Date(startDate) > new Date(endDate)) {
      setError('La fecha de inicio no puede ser posterior a la fecha de fin.');
      return;
    }

    executeWithLoading(async () => {
      try {
        const response = await reportService.generateTariffReport(startDate, endDate);
        const url = window.URL.createObjectURL(new Blob([response.data]));
        const link = document.createElement('a');
        link.href = url;
        link.setAttribute('download', 'reporte_tarifas.xlsx');
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        setSuccess('Reporte de tarifas generado y descargado correctamente.');
      } catch (err) {
        setError('Error al generar el reporte de tarifas.');
      }
    });
  };

  const handleGenerateGroupSizeReport = async () => {
    setError('');
    setSuccess('');
    if (!startDate || !endDate) {
      setError('Por favor, seleccione las fechas de inicio y fin.');
      return;
    }
    if (new Date(startDate) > new Date(endDate)) {
      setError('La fecha de inicio no puede ser posterior a la fecha de fin.');
      return;
    }

    executeWithLoading(async () => {
      try {
        const response = await reportService.generateGroupSizeReport(startDate, endDate);
        const url = window.URL.createObjectURL(new Blob([response.data]));
        const link = document.createElement('a');
        link.href = url;
        link.setAttribute('download', 'reporte_tamanio_grupo.xlsx');
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        setSuccess('Reporte de tamaño de grupo generado y descargado correctamente.');
      } catch (err) {
        setError('Error al generar el reporte de tamaño de grupo.');
      }
    });
  };

  const handleOpenStartMenu = (event) => {
    setAnchorElStart(event.currentTarget);
  };

  const handleOpenEndMenu = (event) => {
    setAnchorElEnd(event.currentTarget);
  };

  const handleSelectStartDate = (year, month) => {
    setStartDate(`${year}-${String(month + 1).padStart(2, '0')}-01`);
    setAnchorElStart(null);
  };

  const handleSelectEndDate = (year, month) => {
    setEndDate(`${year}-${String(month + 1).padStart(2, '0')}-01`);
    setAnchorElEnd(null);
  };

  return (
    <div style={{ textAlign: 'center', marginTop: '2rem' }}>
      <Typography
        variant="h5"
        style={{ marginBottom: '1rem', color: 'var(--text-optional-color)' }}
      >
        Generar Reporte
      </Typography>

      <div style={{ marginBottom: '1rem' }}>
        <Button
          variant="contained"
          sx={{
            backgroundColor: 'var(--primary-color)',
            color: 'var(--text-color)',
            '&:hover': { backgroundColor: 'var(--accent-color)' },
          }}
          onClick={handleOpenStartMenu}
          style={{ marginRight: '1rem' }}
        >
          Seleccionar Fecha de Inicio
        </Button>
        <Menu
          anchorEl={anchorElStart}
          open={Boolean(anchorElStart)}
          onClose={() => setAnchorElStart(null)}
        >
          {years.map((year) => (
            <div key={year}>
              <Typography variant="subtitle1" style={{ padding: '0.5rem' }}>
                {year}
              </Typography>
              {months.map((month, index) => (
                <MenuItem
                  key={`${year}-${month}`}
                  onClick={() => handleSelectStartDate(year, index)}
                >
                  {month}
                </MenuItem>
              ))}
            </div>
          ))}
        </Menu>

        <Button
          variant="contained"
          sx={{
            backgroundColor: 'var(--secondary-color)',
            color: 'var(--text-color)',
            '&:hover': { backgroundColor: 'var(--accent-color)' },
          }}
          onClick={handleOpenEndMenu}
        >
          Seleccionar Fecha de Fin
        </Button>
        <Menu
          anchorEl={anchorElEnd}
          open={Boolean(anchorElEnd)}
          onClose={() => setAnchorElEnd(null)}
        >
          {years.map((year) => (
            <div key={year}>
              <Typography variant="subtitle1" style={{ padding: '0.5rem' }}>
                {year}
              </Typography>
              {months.map((month, index) => (
                <MenuItem
                  key={`${year}-${month}`}
                  onClick={() => handleSelectEndDate(year, index)}
                >
                  {month}
                </MenuItem>
              ))}
            </div>
          ))}
        </Menu>
      </div>

      <Typography
        variant="body1"
        style={{ marginBottom: '1rem', color: 'var(--text-color)' }}
      >
        Fecha de Inicio:
        {' '}
        {startDate || 'No seleccionada'}
        {' '}
        <br />
        Fecha de Fin:
        {' '}
        {endDate || 'No seleccionada'}
      </Typography>

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

      <div style={{ display: 'flex', justifyContent: 'center', gap: '1rem' }}>
        <button
          type="button"
          onClick={handleGenerateTariffReport}
          disabled={!startDate || !endDate || isLoading}
        >
          {isLoading ? 'Generando...' : 'Generar Reporte de Tarifas'}
        </button>

        <button
          type="button"
          onClick={handleGenerateGroupSizeReport}
          disabled={!startDate || !endDate || isLoading}
        >
          {isLoading ? 'Generando...' : 'Generar Reporte de Tamaño de Grupo'}
        </button>
      </div>
    </div>
  );
}

export default ReportGenerator;
