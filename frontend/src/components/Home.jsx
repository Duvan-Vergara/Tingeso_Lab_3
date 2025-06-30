import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Container,
  Typography,
  Box,
  Card,
  CardContent,
  CardActions,
  Button,
  Grid,
  Chip,
  Paper,
} from '@mui/material';
import {
  Bookmark as BookmarkIcon,
  People as PeopleIcon,
  Assessment as AssessmentIcon,
  HelpOutline as HelpOutlineIcon,
  CalendarToday as CalendarTodayIcon,
  AttachMoney as AttachMoneyIcon,
} from '@mui/icons-material';

function Home() {
  const navigate = useNavigate();

  const quickActions = [
    {
      title: 'Gestionar Reservas',
      description: 'Crear, editar y administrar reservas de karting',
      icon: <BookmarkIcon />,
      color: '#2196F3',
      path: '/reserve/list',
      shortcut: 'Ctrl + R',
    },
    {
      title: 'Administrar Usuarios',
      description: 'Gestionar información de clientes y usuarios',
      icon: <PeopleIcon />,
      color: '#4CAF50',
      path: '/user/list',
      shortcut: 'Ctrl + U',
    },
    {
      title: 'Configurar Tarifas',
      description: 'Establecer precios y descuentos',
      icon: <AttachMoneyIcon />,
      color: '#FF9800',
      path: '/tariff/list',
      shortcut: 'Ctrl + T',
    },
    {
      title: 'Generar Reportes',
      description: 'Crear informes de ingresos y ocupación',
      icon: <AssessmentIcon />,
      color: '#9C27B0',
      path: '/reports/generate',
      shortcut: 'Ctrl + G',
    },
    {
      title: 'Rack Semanal',
      description: 'Visualizar ocupación por semana',
      icon: <CalendarTodayIcon />,
      color: '#607D8B',
      path: '/rack/semana',
      shortcut: 'Ctrl + K',
    },
    {
      title: 'Preguntas Frecuentes',
      description: 'Guías y tutoriales del sistema',
      icon: <HelpOutlineIcon />,
      color: '#F44336',
      path: '/faq',
      shortcut: 'Ctrl + F',
    },
  ];

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      {/* Header */}
      <Box sx={{ textAlign: 'center', mb: 5 }}>
        <Typography
          variant="h3"
          component="h1"
          gutterBottom
          sx={{ fontWeight: 'bold', color: '#1976d2' }}
        >
          🏎️ KartingRM
        </Typography>
        <Typography
          variant="h5"
          color="text.secondary"
          sx={{ mb: 2 }}
        >
          Negocio líder en la industria del karting
        </Typography>
        <Typography variant="body1" color="text.secondary" sx={{ maxWidth: 800, mx: 'auto' }}>
          SisGR es una aplicación web completa para gestionar reservas, horarios y
          administrar recursos de forma eficiente relacionado al negocio del karting.
        </Typography>
      </Box>

      {/* FAQ Destacado */}
      <Paper
        elevation={3}
        sx={{
          p: 3,
          mb: 4,
          background: 'linear-gradient(135deg, #e3f2fd 0%, #f3e5f5 100%)',
          border: '2px solid #1976d2',
        }}
      >
        <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', mb: 2 }}>
          <HelpOutlineIcon sx={{ color: '#1976d2', mr: 1, fontSize: 30 }} />
          <Typography variant="h5" sx={{ fontWeight: 'bold', color: '#1976d2' }}>
            ¿Primera vez usando el sistema?
          </Typography>
        </Box>
        <Typography variant="body1" textAlign="center" sx={{ mb: 2 }}>
          Consulta nuestras <strong>Preguntas Frecuentes</strong> para aprender a usar todas las funciones
        </Typography>
        <Box sx={{ textAlign: 'center' }}>
          <Button
            variant="contained"
            size="large"
            onClick={() => navigate('/faq')}
            startIcon={<HelpOutlineIcon />}
            sx={{
              backgroundColor: '#1976d2',
              '&:hover': { backgroundColor: '#1565c0' },
              px: 4,
              py: 1.5,
            }}
          >
            Ver Guía Completa
          </Button>
        </Box>
      </Paper>

      {/* Acciones Rápidas */}
      <Typography variant="h4" component="h2" gutterBottom sx={{ fontWeight: 'bold', mb: 3 }}>
        🚀 Acceso Rápido
      </Typography>

      <Grid container spacing={3}>
        {quickActions.map((action, index) => (
          <Grid item xs={12} sm={6} md={4} key={index}>
            <Card
              sx={{
                height: '100%',
                display: 'flex',
                flexDirection: 'column',
                transition: 'transform 0.2s, box-shadow 0.2s',
                '&:hover': {
                  transform: 'translateY(-4px)',
                  boxShadow: 4,
                },
                cursor: 'pointer',
              }}
              onClick={() => navigate(action.path)}
            >
              <CardContent sx={{ flexGrow: 1 }}>
                <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
                  <Box sx={{ color: action.color, mr: 1 }}>{action.icon}</Box>
                  <Typography variant="h6" component="h3" sx={{ fontWeight: 'bold' }}>
                    {action.title}
                  </Typography>
                </Box>
                <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
                  {action.description}
                </Typography>
                {action.shortcut && (
                  <Chip
                    label={action.shortcut}
                    size="small"
                    variant="outlined"
                    sx={{ backgroundColor: `${action.color}15`, color: action.color }}
                  />
                )}
              </CardContent>
              <CardActions>
                <Button
                  size="small"
                  sx={{ color: action.color }}
                  onClick={(e) => {
                    e.stopPropagation();
                    navigate(action.path);
                  }}
                >
                  Acceder
                </Button>
              </CardActions>
            </Card>
          </Grid>
        ))}
      </Grid>

      {/* Información Técnica */}
      <Box sx={{ mt: 5, p: 3, backgroundColor: '#f5f5f5', borderRadius: 2 }}>
        <Typography variant="h6" gutterBottom sx={{ fontWeight: 'bold' }}>
          🛠️ Tecnologías
        </Typography>
        <Typography variant="body2" color="text.secondary">
          Desarrollado con{' '}
          <strong>
            <a href="https://spring.io/projects/spring-boot" target="_blank" rel="noopener noreferrer">
              Spring Boot
            </a>
          </strong>{' '}
          (backend),{' '}
          <strong>
            <a href="https://reactjs.org/" target="_blank" rel="noopener noreferrer">
              React
            </a>
          </strong>{' '}
          (frontend) y{' '}
          <strong>
            <a href="https://www.mysql.com/products/community/" target="_blank" rel="noopener noreferrer">
              MySQL
            </a>
          </strong>{' '}
          (base de datos).
        </Typography>
      </Box>
    </Container>
  );
}

export default Home;
