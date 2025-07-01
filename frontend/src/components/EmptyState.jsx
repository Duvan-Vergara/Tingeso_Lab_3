import PropTypes from 'prop-types';

/**
 * Componente para mostrar estados vacíos con un diseño consistente
 * @param {Object} props - Props del componente
 * @param {string} props.title - Título del estado vacío
 * @param {string} props.description - Descripción del estado vacío
 * @param {string} props.icon - Icono a mostrar (emoji o texto)
 * @param {React.ReactNode} props.action - Botón o acción opcional
 * @param {string} props.className - Clases CSS adicionales
 */
function EmptyState({
  title = 'No hay datos',
  description = 'No se encontraron elementos para mostrar.',
  icon = '📭',
  action = null,
  className = '',
}) {
  return (
    <div className={`empty-state-container ${className}`}>
      <div className="empty-state-icon">
        {icon}
      </div>
      <h3 className="empty-state-title">
        {title}
      </h3>
      <p className="empty-state-description">
        {description}
      </p>
      {action && (
        <div style={{ marginTop: '1.5rem' }}>
          {action}
        </div>
      )}
    </div>
  );
}

EmptyState.propTypes = {
  title: PropTypes.string,
  description: PropTypes.string,
  icon: PropTypes.string,
  action: PropTypes.node,
  className: PropTypes.string,
};

export default EmptyState;
