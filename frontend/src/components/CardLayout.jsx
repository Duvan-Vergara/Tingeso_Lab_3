import PropTypes from 'prop-types';

function CardLayout({
  children,
  title,
  subtitle,
  className = '',
  hover = true,
  padding = 'normal',
  ...props
}) {
  const getPaddingClass = () => {
    switch (padding) {
      case 'small': return 'card-padding-sm';
      case 'large': return 'card-padding-lg';
      case 'none': return 'card-padding-none';
      default: return '';
    }
  };

  return (
    <div
      className={`card animated-card animated-card-pulse ${hover ? 'card-hoverable' : ''} ${getPaddingClass()} ${className}`}
      {...props}
    >
      {title && (
        <div className="card-header">
          {title && <h3 className="card-title">{title}</h3>}
          {subtitle && <p className="card-subtitle">{subtitle}</p>}
        </div>
      )}
      <div className="card-content">
        {children}
      </div>
    </div>
  );
}

CardLayout.propTypes = {
  children: PropTypes.node.isRequired,
  title: PropTypes.string,
  subtitle: PropTypes.string,
  className: PropTypes.string,
  hover: PropTypes.bool,
  padding: PropTypes.oneOf(['none', 'small', 'normal', 'large']),
};

export default CardLayout;
