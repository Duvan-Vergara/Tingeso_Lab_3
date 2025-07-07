import PropTypes from 'prop-types';

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
