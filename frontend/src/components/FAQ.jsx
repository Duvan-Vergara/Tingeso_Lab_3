import React, { useState } from 'react';
import {
  Accordion,
  AccordionSummary,
  AccordionDetails,
  Typography,
  Box,
  Container,
  Chip,
  Link,
  Divider,
} from '@mui/material';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import HelpOutlineIcon from '@mui/icons-material/HelpOutline';
import BookmarkIcon from '@mui/icons-material/Bookmark';
import PeopleIcon from '@mui/icons-material/People';
import AssessmentIcon from '@mui/icons-material/Assessment';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import { useNavigate } from 'react-router-dom';
import AnimatedTitle from './AnimatedTitle';

function FAQ() {
  const [expanded, setExpanded] = useState(false);
  const navigate = useNavigate();

  const handleChange = (panel) => (event, isExpanded) => {
    setExpanded(isExpanded ? panel : false);
  };

  const handleNavigate = (path) => {
    navigate(path);
  };

  const faqData = [
    {
      id: 'reservas',
      category: 'Reservas',
      icon: <BookmarkIcon />,
      color: '#2196F3',
      questions: [
        {
          id: 'crear-reserva',
          question: '¿Cómo creo una nueva reserva?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                Para crear una nueva reserva, sigue estos pasos:
              </Typography>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>
                  Ve a{' '}
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/reserve/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Lista de Reservas
                  </Link>{' '}
                  o usa el atajo de teclado <Chip label="Ctrl + R" size="small" variant="outlined" />
                </li>
                <li>Presiona el botón <strong>&quot;Añadir&quot;</strong></li>
                <li>Completa todos los campos requeridos (Cliente, Fecha, Número de personas, etc.)</li>
                <li>Presiona <strong>&quot;Guardar&quot;</strong></li>
                <li>Tendrás <strong>5 segundos</strong> para deshacer la acción si cometiste algún error</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                💡 Consejo: Verifica que la fecha seleccionada esté disponible antes de guardar.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'editar-reserva',
          question: '¿Cómo edito una reserva existente?',
          answer: (
            <Box>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>
                  Accede a la{' '}
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/reserve/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Lista de Reservas
                  </Link>
                </li>
                <li>Busca la reserva que deseas modificar</li>
                <li>Presiona el botón <strong>&quot;Editar&quot;</strong> en la fila correspondiente</li>
                <li>Modifica los campos necesarios</li>
                <li>Guarda los cambios</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                ⚠️ Importante: Los cambios en reservas confirmadas pueden afectar otros aspectos del sistema.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'eliminar-reserva',
          question: '¿Cómo elimino una reserva?',
          answer: (
            <Box>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>En la Lista de Reservas, localiza la reserva a eliminar</li>
                <li>Presiona el botón <strong>&quot;Eliminar&quot;</strong></li>
                <li>Confirma la eliminación en el diálogo que aparece</li>
                <li>La reserva será marcada para eliminación y tendrás <strong>5 segundos</strong> para deshacer</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#ff9800' }}>
                ⚠️ Advertencia: Esta acción no se puede deshacer después de los 5 segundos.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'rack-semanal',
          question: '¿Cómo consulto el rack semanal?',
          answer: (
            <Box>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>
                  Ve a{' '}
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/rack/semana')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Rack Semanal
                  </Link>
                </li>
                <li>Selecciona el año, mes y día de inicio</li>
                <li>Presiona <strong>&quot;Consultar&quot;</strong></li>
                <li>Se mostrará la ocupación de la semana completa</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                📊 El rack muestra la distribución de reservas por día de la semana.
              </Typography>
            </Box>
          ),
        },
      ],
    },
    {
      id: 'usuarios',
      category: 'Usuarios',
      icon: <PeopleIcon />,
      color: '#4CAF50',
      questions: [
        {
          id: 'crear-usuario',
          question: '¿Cómo registro un nuevo usuario?',
          answer: (
            <Box>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>
                  Accede a{' '}
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/user/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Lista de Usuarios
                  </Link>{' '}
                  o usa <Chip label="Ctrl + U" size="small" variant="outlined" />
                </li>
                <li>Presiona <strong>&quot;Añadir&quot;</strong></li>
                <li>Completa todos los campos: RUT, Nombre, Apellido, Email, Fecha de nacimiento</li>
                <li>Presiona <strong>&quot;Guardar&quot;</strong></li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                📝 Nota: El RUT debe ser válido y único en el sistema.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'gestionar-usuarios',
          question: '¿Cómo gestiono los usuarios existentes?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                En la Lista de Usuarios puedes:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li><strong>Editar:</strong> Modificar información de usuarios existentes</li>
                <li><strong>Eliminar:</strong> Remover usuarios del sistema (con opción de deshacer)</li>
                <li><strong>Buscar:</strong> Filtrar usuarios por diferentes criterios</li>
              </Typography>
            </Box>
          ),
        },
      ],
    },
    {
      id: 'tarifas',
      category: 'Tarifas y Descuentos',
      icon: <AttachMoneyIcon />,
      color: '#FF9800',
      questions: [
        {
          id: 'gestionar-tarifas',
          question: '¿Cómo gestiono las tarifas?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                El sistema de tarifas incluye:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li>
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/tariff/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Tarifas Básicas
                  </Link>
                  : Precios base por día de la semana
                </li>
                <li>
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/tariff/special/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Tarifas Especiales
                  </Link>
                  : Precios para días específicos
                </li>
                <li>
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/specialdays/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Días Especiales
                  </Link>
                  : Configuración de fechas con tarifas especiales
                </li>
              </Typography>
            </Box>
          ),
        },
        {
          id: 'descuentos',
          question: '¿Cómo funcionan los descuentos?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                El sistema ofrece dos tipos de descuentos:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li>
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/desctnumber/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Descuento por Número
                  </Link>
                  : Basado en la cantidad de personas
                </li>
                <li>
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/desctfrec/list')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Descuento por Frecuencia
                  </Link>
                  : Para clientes recurrentes
                </li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                💰 Los descuentos se aplican automáticamente según las reglas configuradas.
              </Typography>
            </Box>
          ),
        },
      ],
    },
    {
      id: 'reportes',
      category: 'Reportes',
      icon: <AssessmentIcon />,
      color: '#9C27B0',
      questions: [
        {
          id: 'generar-reportes',
          question: '¿Cómo genero reportes?',
          answer: (
            <Box>
              <Typography variant="body2" component="ol" sx={{ paddingLeft: 2 }}>
                <li>
                  Ve a{' '}
                  <Link
                    component="button"
                    variant="body2"
                    onClick={() => handleNavigate('/reports/generate')}
                    sx={{ color: '#1976d2', textDecoration: 'underline', cursor: 'pointer' }}
                  >
                    Generador de Reportes
                  </Link>
                </li>
                <li>Selecciona las fechas de inicio y fin</li>
                <li>Elige el tipo de reporte:</li>
                <Typography variant="body2" component="ul" sx={{ paddingLeft: 2, mt: 1 }}>
                  <li><strong>Reporte de Tarifas:</strong> Análisis de ingresos por tarifas</li>
                  <li><strong>Reporte de Tamaño de Grupo:</strong> Estadísticas de ocupación</li>
                </Typography>
                <li>Presiona el botón correspondiente para generar y descargar</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                📊 Los reportes se generan en formato Excel (.xlsx) y se descargan automáticamente.
              </Typography>
            </Box>
          ),
        },
      ],
    },
    {
      id: 'sistema',
      category: 'Sistema General',
      icon: <HelpOutlineIcon />,
      color: '#607D8B',
      questions: [
        {
          id: 'atajos-teclado',
          question: '¿Qué atajos de teclado están disponibles?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                Atajos de teclado disponibles:
              </Typography>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + R" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Lista de Reservas</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + U" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Lista de Usuarios</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + T" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Lista de Tarifas</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + H" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Página Principal</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + G" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Generar Reportes</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1, mb: 2 }}>
                <Chip label="Ctrl + K" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Rack Semanal</Typography>
              </Box>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1 }}>
                <Chip label="Ctrl + F" variant="outlined" color="primary" />
                <Typography variant="body2" sx={{ alignSelf: 'center' }}>Preguntas Frecuentes</Typography>
              </Box>
            </Box>
          ),
        },
        {
          id: 'funcion-deshacer',
          question: '¿Cómo funciona la opción de deshacer?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                El sistema incluye una función de deshacer para operaciones críticas:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li>Después de crear, editar o eliminar elementos, aparece una notificación</li>
                <li>Tienes <strong>5 segundos</strong> para presionar &quot;Deshacer&quot;</li>
                <li>Si no deshaces, la operación se confirma permanentemente</li>
                <li>La función está disponible para: reservas, usuarios, tarifas y descuentos</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                ⏱️ Tiempo limitado: Actúa rápido si necesitas deshacer una acción.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'barra-carga',
          question: '¿Qué significa la barra de carga en la parte superior?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                La barra de progreso azul en la parte superior indica que el sistema está procesando una operación:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li>Aparece automáticamente durante cargas de datos</li>
                <li>Se muestra al generar reportes</li>
                <li>Indica procesamientos en segundo plano</li>
                <li>Desaparece cuando la operación termina</li>
              </Typography>
              <Typography variant="body2" sx={{ mt: 1, fontStyle: 'italic', color: '#666' }}>
                💡 No cierres la ventana mientras la barra esté visible.
              </Typography>
            </Box>
          ),
        },
        {
          id: 'navegacion',
          question: '¿Cómo navego por el sistema?',
          answer: (
            <Box>
              <Typography variant="body1" paragraph>
                Formas de navegar:
              </Typography>
              <Typography variant="body2" component="ul" sx={{ paddingLeft: 2 }}>
                <li><strong>Menú superior:</strong> Accede a todas las secciones principales</li>
                <li><strong>Menú lateral:</strong> Navegación rápida por categorías</li>
                <li><strong>Enlaces directos:</strong> Presiona en esta FAQ para ir directamente</li>
                <li><strong>Atajos de teclado:</strong> Para acceso rápido a secciones frecuentes</li>
                <li><strong>Botón &quot;Volver&quot;:</strong> Regresa a la página anterior</li>
              </Typography>
            </Box>
          ),
        },
      ],
    },
  ];

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Box sx={{ textAlign: 'center', mb: 4 }}>
        <AnimatedTitle
          variant="h3"
          component="h1"
          animationType="pulse"
          gutterBottom
          sx={{
            fontWeight: 'bold',
            color: 'var(--primary-color)',
            textShadow: '0 2px 4px rgba(0,0,0,0.3)',
          }}
        >
          📚 Preguntas Frecuentes
        </AnimatedTitle>
        <Typography
          variant="h6"
          sx={{
            mb: 3,
            color: 'var(--text-optional-color)',
            fontWeight: 500,
          }}
        >
          Encuentra respuestas rápidas a las preguntas más comunes sobre el sistema
        </Typography>
        <Divider sx={{ my: 3, borderColor: 'var(--border-color)' }} />
      </Box>

      {faqData.map((category) => (
        <Box key={category.id} sx={{ mb: 4 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
            <Box sx={{ color: category.color, mr: 1 }}>{category.icon}</Box>
            <Typography variant="h5" component="h2" sx={{ fontWeight: 'bold', color: category.color }}>
              {category.category}
            </Typography>
          </Box>

          {category.questions.map((faq) => (
            <Accordion
              key={faq.id}
              expanded={expanded === faq.id}
              onChange={handleChange(faq.id)}
              sx={{
                mb: 1,
                backgroundColor: 'var(--card-bg)',
                color: 'var(--text-color)',
                boxShadow: 'var(--shadow-md)',
                '&:before': { display: 'none' },
                borderRadius: 1,
                overflow: 'hidden',
                border: '1px solid var(--border-color)',
              }}
            >
              <AccordionSummary
                expandIcon={<ExpandMoreIcon sx={{ color: category.color }} />}
                sx={{
                  backgroundColor: `${category.color}15`,
                  '&:hover': {
                    backgroundColor: `${category.color}25`,
                    '& .MuiTypography-root': { color: category.color },
                  },
                }}
              >
                <Typography
                  variant="h6"
                  sx={{
                    fontWeight: 500,
                    color: 'var(--text-color)',
                    transition: 'color 0.2s ease',
                  }}
                >
                  {faq.question}
                </Typography>
              </AccordionSummary>
              <AccordionDetails
                sx={{
                  backgroundColor: 'var(--background-secondary)',
                  p: 3,
                  color: 'var(--text-secondary)',
                  '& .MuiTypography-root': { color: 'var(--text-secondary)' },
                  '& strong': { color: 'var(--text-color)' },
                  '& .MuiChip-root': {
                    backgroundColor: 'var(--primary-color)',
                    color: 'var(--text-color)',
                  },
                }}
              >
                {faq.answer}
              </AccordionDetails>
            </Accordion>
          ))}
        </Box>
      ))}

      <Box
        sx={{
          mt: 6,
          p: 3,
          backgroundColor: 'var(--background-accent)',
          borderRadius: 2,
          textAlign: 'center',
          border: '1px solid var(--border-color)',
        }}
      >
        <Typography
          variant="h6"
          gutterBottom
          sx={{ color: 'var(--primary-color)', fontWeight: 'bold' }}
        >
          ¿No encontraste lo que buscabas?
        </Typography>
        <Typography
          variant="body1"
          sx={{ color: 'var(--text-secondary)' }}
        >
          Si tienes alguna pregunta que no está aquí, contacta al administrador del sistema
          o revisa la documentación técnica del proyecto.
        </Typography>
      </Box>
    </Container>
  );
}

export default FAQ;
