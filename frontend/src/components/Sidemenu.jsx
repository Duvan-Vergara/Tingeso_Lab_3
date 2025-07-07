import Box from '@mui/material/Box';
import Drawer from '@mui/material/Drawer';
import List from '@mui/material/List';
import Divider from '@mui/material/Divider';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import PeopleAltIcon from '@mui/icons-material/PeopleAlt';
import PaidIcon from '@mui/icons-material/Paid';
import DiscountIcon from '@mui/icons-material/Discount';
import MoreTimeIcon from '@mui/icons-material/MoreTime';
import HelpOutlineIcon from '@mui/icons-material/HelpOutline';
import HomeIcon from '@mui/icons-material/Home';
import StarIcon from '@mui/icons-material/Star';
import GroupAddIcon from '@mui/icons-material/GroupAdd';
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import AssessmentIcon from '@mui/icons-material/Assessment';
import LoopIcon from '@mui/icons-material/Loop';
import PropTypes from 'prop-types';
import { useNavigate } from 'react-router-dom';

export default function Sidemenu({ open, toggleDrawer }) {
  const navigate = useNavigate();

  const menuItemStyle = {
    '&:hover': {
      backgroundColor: 'var(--primary-light)',
      borderLeft: '3px solid var(--primary-color)',
      transform: 'translateX(5px)',
    },
    transition: 'all 0.3s ease',
    color: 'var(--text-color)',
    margin: '0.3rem 0.8rem',
    borderRadius: '0.5rem',
    borderLeft: '3px solid transparent',
    padding: '0.8rem 1rem',
    '&:active': {
      backgroundColor: 'var(--primary-hover)',
    },
  };

  const iconStyle = {
    color: 'var(--primary-color)',
    fontSize: '1.5rem',
  };

  const textStyle = {
    '& .MuiListItemText-primary': {
      color: 'var(--text-color)',
      fontWeight: '500',
      fontSize: '0.95rem',
    },
  };

  const dividerStyle = {
    backgroundColor: 'var(--primary-color)',
    margin: '1rem 0.8rem',
    height: '2px',
    borderRadius: '1px',
  };

  const listOptions = () => (
    <Box
      role="presentation"
      onClick={toggleDrawer(false)}
      onKeyDown={(event) => {
        if (event.key === 'Escape' || event.key === 'Tab') {
          toggleDrawer(false)(event);
        }
      }}
      sx={{
        background: 'linear-gradient(135deg, var(--background-secondary) 0%, var(--background-accent) 100%)',
        borderRight: '1px solid var(--primary-color)',
        height: '100%',
        color: 'var(--text-color)',
        backdropFilter: 'blur(15px)',
        WebkitBackdropFilter: 'blur(15px)',
        width: '280px',
      }}
    >
      <List sx={{ padding: '1rem 0' }}>
        <ListItemButton
          onClick={() => navigate('/home')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <HomeIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Home"
            sx={textStyle}
          />
        </ListItemButton>

        <Divider sx={dividerStyle} />

        <ListItemButton
          onClick={() => navigate('/user/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <PeopleAltIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Usuarios"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/reserve/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <GroupAddIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Reservas"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/specialdays/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <CalendarMonthIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Días Especiales"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/tariff/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <PaidIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Tarifas"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/tariff/special/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <StarIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Tarifas Especiales"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/desctnumber/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <DiscountIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Descuentos por Grupo"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/desctfrec/list')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <LoopIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Lista de Descuentos por Frecuencia"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/reports/generate')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <AssessmentIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Generar Reporte"
            sx={textStyle}
          />
        </ListItemButton>

        <ListItemButton
          onClick={() => navigate('/rack/semana')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <MoreTimeIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Rack Semanal"
            sx={textStyle}
          />
        </ListItemButton>

        <Divider sx={dividerStyle} />

        <ListItemButton
          onClick={() => navigate('/faq')}
          sx={menuItemStyle}
        >
          <ListItemIcon>
            <HelpOutlineIcon sx={iconStyle} />
          </ListItemIcon>
          <ListItemText
            primary="Preguntas Frecuentes"
            sx={textStyle}
          />
        </ListItemButton>
      </List>
    </Box>
  );  return (
    <div>
      <Drawer
        anchor="left"
        open={open}
        onClose={toggleDrawer(false)}
        ModalProps={{
          keepMounted: false,
          disablePortal: false,
          hideBackdrop: false,
          disableAutoFocus: false,
          disableEnforceFocus: false,
          disableRestoreFocus: false,
        }}
        PaperProps={{
          role: 'navigation',
          'aria-label': 'Menú de navegación principal',
          sx: {
            background: 'linear-gradient(135deg, var(--background-secondary) 0%, var(--background-accent) 100%)',
            backdropFilter: 'blur(15px)',
            WebkitBackdropFilter: 'blur(15px)',
            border: '1px solid var(--primary-color)',
            borderLeft: 'none',
            boxShadow: `
              0 0 30px rgba(var(--primary-color-rgb), 0.3),
              0 20px 25px -5px rgba(0, 0, 0, 0.4),
              0 10px 10px -5px rgba(0, 0, 0, 0.1)
            `,
            '&::before': {
              content: '""',
              position: 'absolute',
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              background: 'var(--glass-bg)',
              zIndex: -1,
            },
          },
        }}
      >
        {listOptions()}
      </Drawer>
    </div>
  );
}

Sidemenu.propTypes = {
  open: PropTypes.bool.isRequired,
  toggleDrawer: PropTypes.func.isRequired,
};
